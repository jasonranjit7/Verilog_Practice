module barrel_shifter(input [3:0]i,
                      input [1:0]s,
                      input dir,	//1 for right, 0 for left
                      output [3:0]y
                     );
  
  wire [3:0] in,temp1,temp2;
  
  assign in = dir?{i[0],i[1],i[2],i[3]}:i;
  
  assign temp1 = s[0]?{in[2:0],1'b0}:in; //shift 1
  
  assign temp2 = s[1]?{temp1[1:0],2'b0}:temp1; //shift 2
  
  assign y = dir?{temp2[0],temp2[1],temp2[2],temp2[3]}:temp2;
  
endmodule
