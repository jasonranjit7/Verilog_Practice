iverilog -o out design.v design_tb.v
vvp out
#gtkwave image.vcd
