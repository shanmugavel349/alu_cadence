module alu_4bit (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [3:0] a_in,
    input  wire [3:0] b_in,
    input  wire [2:0] opcode_in,
    output reg  [3:0] alu_out,
    output reg        carry_out,
    output reg        zero_flag
);

    // Pipeline registers for inputs
    reg [3:0] a_reg, b_reg;
    reg [2:0] opcode_reg;

    // Combinational evaluation
    reg [4:0] result_comb;

    // ----------------------------------------------------
    // Input Stage
    // ----------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_reg      <= 4'b0000;
            b_reg      <= 4'b0000;
            opcode_reg <= 3'b000;
        end else begin
            a_reg      <= a_in;
            b_reg      <= b_in;
            opcode_reg <= opcode_in;
        end
    end

    // ----------------------------------------------------
    // ALU Core Logic
    // ----------------------------------------------------
    always @(*) begin
        case (opcode_reg)
            3'b000: result_comb = {1'b0, a_reg} + {1'b0, b_reg}; // ADD
            3'b001: result_comb = {1'b0, a_reg} - {1'b0, b_reg}; // SUB
            3'b010: result_comb = {1'b0, a_reg & b_reg};         // AND
            3'b011: result_comb = {1'b0, a_reg | b_reg};         // OR
            3'b100: result_comb = {1'b0, a_reg ^ b_reg};         // XOR
            3'b101: result_comb = {1'b0, ~a_reg};                // NOT A
            3'b110: result_comb = {a_reg, 1'b0};                 // Shift Left (SHL)
            3'b111: result_comb = {a_reg[0], 1'b0, a_reg[3:1]};  // Shift Right (SHR)
            default: result_comb = 5'b00000;
        endcase
    end

    // ----------------------------------------------------
    // Output Stage
    // ----------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            alu_out   <= 4'b0000;
            carry_out <= 1'b0;
            zero_flag <= 1'b0;
        end else begin
            alu_out   <= result_comb[3:0];
            carry_out <= result_comb[4];
            zero_flag <= (result_comb[3:0] == 4'b0000);
        end
    end

endmodule
