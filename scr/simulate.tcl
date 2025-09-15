vlog -sv ./rtl/alu.sv
vlog -sv ./tb/alu_tb.sv

vsim -voptargs=+acc work.alu_tb

# Add your waveforms signals here
add wave -position insertpoint  \
sim:/alu_tb/in_a \
sim:/alu_tb/in_b \
sim:/alu_tb/opcode \
sim:/alu_tb/out \
sim:/alu_tb/flags

run 500ns
