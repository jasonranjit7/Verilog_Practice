#!/bin/bash
case "$1" in
  1) echo "AND Gate"; cd 01_Gates/001_AND_Gate && iverilog -o out design.v design_tb.v && vvp out ;;
  2) cd 01_Gates/002_OR_Gate  && iverilog -o out design.v design_tb.v && vvp out ;;
  3) cd 01_Gates/003_NOT_Gate  && iverilog -o out design.v design_tb.v && vvp out ;;
  4) cd 01_Gates/004_NAND_Gate  && iverilog -o out design.v design_tb.v && vvp out ;;
  5) cd 01_Gates/005_NOR_Gate  && iverilog -o out design.v design_tb.v && vvp out ;;
  6) cd 01_Gates/006_XOR_Gate  && iverilog -o out design.v design_tb.v && vvp out ;;
  7) cd 01_Gates/007_XNOR_Gate  && iverilog -o out design.v design_tb.v && vvp out ;;
  8) cd 02_Basic_Combinational/008_Half_Adder  && iverilog -o out design.v design_tb.v && vvp out ;;
  9) cd 02_Basic_Combinational/009_Full_Adder  && iverilog -o out design.v design_tb.v && vvp out ;;
  10) cd 02_Basic_Combinational/010_Half_Subtractor  && iverilog -o out design.v design_tb.v && vvp out ;;
  11) cd 02_Basic_Combinational/011_Full_Subtractor  && iverilog -o out design.v design_tb.v && vvp out ;;
  12) cd 02_Basic_Combinational/012_2to1_Mux  && iverilog -o out design.v design_tb.v && vvp out ;;
  13) cd 02_Basic_Combinational/013_4to1_Mux  && iverilog -o out design.v design_tb.v && vvp out ;;
  14) cd 02_Basic_Combinational/014_1to2_Demux  && iverilog -o out design.v design_tb.v && vvp out ;;
  *) echo "Usage: $0 <gate_number>" ;;
esac
