
//input ports
add mapped point clk clk -type PI PI
add mapped point rst_n rst_n -type PI PI
add mapped point a_in[3] a_in[3] -type PI PI
add mapped point a_in[2] a_in[2] -type PI PI
add mapped point a_in[1] a_in[1] -type PI PI
add mapped point a_in[0] a_in[0] -type PI PI
add mapped point b_in[3] b_in[3] -type PI PI
add mapped point b_in[2] b_in[2] -type PI PI
add mapped point b_in[1] b_in[1] -type PI PI
add mapped point b_in[0] b_in[0] -type PI PI
add mapped point opcode_in[2] opcode_in[2] -type PI PI
add mapped point opcode_in[1] opcode_in[1] -type PI PI
add mapped point opcode_in[0] opcode_in[0] -type PI PI

//output ports
add mapped point alu_out[3] alu_out[3] -type PO PO
add mapped point alu_out[2] alu_out[2] -type PO PO
add mapped point alu_out[1] alu_out[1] -type PO PO
add mapped point alu_out[0] alu_out[0] -type PO PO
add mapped point carry_out carry_out -type PO PO
add mapped point zero_flag zero_flag -type PO PO

//inout ports




//Sequential Pins
add mapped point zero_flag/q zero_flag_reg/Q -type DFF DFF
add mapped point alu_out[3]/q alu_out_reg[3]/Q -type DFF DFF
add mapped point alu_out[2]/q alu_out_reg[2]/Q -type DFF DFF
add mapped point carry_out/q carry_out_reg/Q -type DFF DFF
add mapped point alu_out[1]/q alu_out_reg[1]/Q -type DFF DFF
add mapped point alu_out[0]/q alu_out_reg[0]/Q -type DFF DFF
add mapped point opcode_reg[1]/q opcode_reg_reg[1]/Q -type DFF DFF
add mapped point b_reg[0]/q b_reg_reg[0]/Q -type DFF DFF
add mapped point b_reg[1]/q b_reg_reg[1]/Q -type DFF DFF
add mapped point a_reg[0]/q a_reg_reg[0]/Q -type DFF DFF
add mapped point opcode_reg[0]/q opcode_reg_reg[0]/Q -type DFF DFF
add mapped point b_reg[2]/q b_reg_reg[2]/Q -type DFF DFF
add mapped point b_reg[3]/q b_reg_reg[3]/Q -type DFF DFF
add mapped point a_reg[3]/q a_reg_reg[3]/Q -type DFF DFF
add mapped point a_reg[1]/q a_reg_reg[1]/Q -type DFF DFF
add mapped point a_reg[2]/q a_reg_reg[2]/Q -type DFF DFF
add mapped point opcode_reg[2]/q opcode_reg_reg[2]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
