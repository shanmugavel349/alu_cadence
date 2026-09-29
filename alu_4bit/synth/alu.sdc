# ====================================================================
# Units
# ====================================================================
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA

# ====================================================================
# Clock Definition
# Period = 10.0 ns (100 MHz) with 50% duty cycle
# ====================================================================
create_clock -name clk -period 10.0 -waveform {0.0 5.0} [get_ports clk]

# Clock non-idealities
set_clock_uncertainty -setup 0.200 [get_clocks clk]
set_clock_uncertainty -hold  0.050 [get_clocks clk]
set_clock_transition 0.100 [get_clocks clk]

# ====================================================================
# Input Constraints
# Budgeting 25% of period (2.5 ns) for external logic
# ====================================================================
set all_inputs_except_clk [remove_from_collection [all_inputs] [get_ports clk]]

set_input_delay -clock clk -max 2.500 $all_inputs_except_clk
set_input_delay -clock clk -min 0.500 $all_inputs_except_clk

# Input transition slope (e.g., standard driven pin)
set_input_transition 0.150 $all_inputs_except_clk

# ====================================================================
# Output Constraints
# Budgeting 25% of period (2.5 ns) for external setup
# ====================================================================
set_output_delay -clock clk -max 2.500 [all_outputs]
set_output_delay -clock clk -min -0.200 [all_outputs]

# External pin load capacitance
set_load -pin_load 0.050 [all_outputs]

# ====================================================================
# Design Rules & Timing Exceptions
# ====================================================================
set_max_fanout 16 [current_design]
set_max_transition 0.500 [current_design]

# Async active-low reset false path (static de-assertion analyzed via recovery/removal)
set_false_path -from [get_ports rst_n]
