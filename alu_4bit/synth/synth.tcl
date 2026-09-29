# ==============================================================================
# Cadence Genus Synthesis Script: alu_4bit targeting GPDK 45nm
# Location: /home/user26/shanmugavel/wrk/alu_4bit/synth/synth.tcl
# ==============================================================================

set_db max_cpus_per_server 4

# ------------------------------------------------------------------------------
# 1. Directory and Path Setup (Explicit Absolute Paths)
# ------------------------------------------------------------------------------
set SCRIPT_DIR    "/home/user26/shanmugavel/wrk/alu_4bit/synth"
set PRJ_ROOT      "/home/user26/shanmugavel/wrk/alu_4bit"

set DESIGN_NAME   "alu_4bit"
set RTL_FILE      "${PRJ_ROOT}/rtl/alu.v"
set SDC_FILE      "${SCRIPT_DIR}/alu.sdc"

# Exact GPDK 45nm timing library directory
set LIB_DIR       "/home/user26/GPDK/gpdk45nm_E/gsclib045_all_v4.8/gsclib045/timing"

# Outputs & Reports
set REPORT_DIR    "${SCRIPT_DIR}/reports"
set OUTPUT_DIR    "${SCRIPT_DIR}/outputs"

file mkdir $REPORT_DIR
file mkdir $OUTPUT_DIR

# ------------------------------------------------------------------------------
# 2. Technology Setup (GPDK 45nm SVT 1.2V)
# ------------------------------------------------------------------------------
set_db init_lib_search_path [list "$LIB_DIR"]

# Load both basic gates and sequential DFF timing libraries
set_db library [list "slow_vdd1v2_basicCells.lib" "slow_vdd1v2_multibitsDFF.lib"]

# ------------------------------------------------------------------------------
# 3. Read Design (RTL) & Elaboration
# ------------------------------------------------------------------------------
read_hdl -v2001 $RTL_FILE

elaborate $DESIGN_NAME

check_design -unresolved > ${REPORT_DIR}/${DESIGN_NAME}_unresolved.rpt

# ------------------------------------------------------------------------------
# 4. Constraints Setup (SDC)
# ------------------------------------------------------------------------------
read_sdc $SDC_FILE

check_timing_intent > ${REPORT_DIR}/${DESIGN_NAME}_check_timing.rpt

# ------------------------------------------------------------------------------
# 5. Synthesis Execution
# ------------------------------------------------------------------------------
syn_generic
syn_map
syn_opt

# ------------------------------------------------------------------------------
# 6. Reports Generation
# ------------------------------------------------------------------------------
report_timing > ${REPORT_DIR}/${DESIGN_NAME}_timing.rpt
report_area   > ${REPORT_DIR}/${DESIGN_NAME}_area.rpt
report_gates  > ${REPORT_DIR}/${DESIGN_NAME}_gates.rpt
report_power  > ${REPORT_DIR}/${DESIGN_NAME}_power.rpt
report_qor    > ${REPORT_DIR}/${DESIGN_NAME}_qor.rpt

# ------------------------------------------------------------------------------
# 7. Write Outputs for Innovus PnR
# ------------------------------------------------------------------------------
write_hdl > ${OUTPUT_DIR}/${DESIGN_NAME}_synth.v
write_sdc > ${OUTPUT_DIR}/${DESIGN_NAME}_synth.sdc

# Copy synthesized files directly to the physical directory
file copy -force ${OUTPUT_DIR}/${DESIGN_NAME}_synth.v ${PRJ_ROOT}/physical/
file copy -force ${OUTPUT_DIR}/${DESIGN_NAME}_synth.sdc ${PRJ_ROOT}/physical/

puts "=========================================================="
puts " Genus synthesis completed successfully for ${DESIGN_NAME} "
puts " Outputs placed in: ${OUTPUT_DIR} and ${PRJ_ROOT}/physical "
puts "=========================================================="


