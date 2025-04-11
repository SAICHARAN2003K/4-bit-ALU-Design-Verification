vlib work
vlog alu.v
vlog alu_tb.sv
vsim -voptargs=+acc alu_tb
add wave -r*
run -all
