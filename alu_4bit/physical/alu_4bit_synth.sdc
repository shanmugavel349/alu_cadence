# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Tue Sep 29 11:43:30 EDT 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design alu_4bit

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_load -pin_load 0.05 [get_ports {alu_out[3]}]
set_load -pin_load 0.05 [get_ports {alu_out[2]}]
set_load -pin_load 0.05 [get_ports {alu_out[1]}]
set_load -pin_load 0.05 [get_ports {alu_out[0]}]
set_load -pin_load 0.05 [get_ports carry_out]
set_load -pin_load 0.05 [get_ports zero_flag]
set_false_path -from [get_ports rst_n]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports rst_n]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {a_in[3]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {a_in[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {a_in[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {a_in[0]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {b_in[3]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {b_in[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {b_in[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {b_in[0]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {opcode_in[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {opcode_in[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {opcode_in[0]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports rst_n]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {a_in[3]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {a_in[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {a_in[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {a_in[0]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {b_in[3]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {b_in[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {b_in[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {b_in[0]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {opcode_in[2]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {opcode_in[1]}]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.5 [get_ports {opcode_in[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {alu_out[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {alu_out[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {alu_out[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports {alu_out[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports carry_out]
set_output_delay -clock [get_clocks clk] -add_delay -max 2.5 [get_ports zero_flag]
set_output_delay -clock [get_clocks clk] -add_delay -min -0.2 [get_ports {alu_out[3]}]
set_output_delay -clock [get_clocks clk] -add_delay -min -0.2 [get_ports {alu_out[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min -0.2 [get_ports {alu_out[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min -0.2 [get_ports {alu_out[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min -0.2 [get_ports carry_out]
set_output_delay -clock [get_clocks clk] -add_delay -min -0.2 [get_ports zero_flag]
set_max_fanout 16.000 [current_design]
set_max_transition 0.5 [current_design]
set_input_transition 0.15 [get_ports rst_n]
set_input_transition 0.15 [get_ports {a_in[3]}]
set_input_transition 0.15 [get_ports {a_in[2]}]
set_input_transition 0.15 [get_ports {a_in[1]}]
set_input_transition 0.15 [get_ports {a_in[0]}]
set_input_transition 0.15 [get_ports {b_in[3]}]
set_input_transition 0.15 [get_ports {b_in[2]}]
set_input_transition 0.15 [get_ports {b_in[1]}]
set_input_transition 0.15 [get_ports {b_in[0]}]
set_input_transition 0.15 [get_ports {opcode_in[2]}]
set_input_transition 0.15 [get_ports {opcode_in[1]}]
set_input_transition 0.15 [get_ports {opcode_in[0]}]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.2 [get_clocks clk]
set_clock_uncertainty -hold 0.05 [get_clocks clk]
