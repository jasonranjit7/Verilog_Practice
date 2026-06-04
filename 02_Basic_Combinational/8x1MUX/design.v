module mux_4(input [3:0] i,
             input [1:0] s,
             input en,
             output reg y);
  
  always@(*) begin
    if(en)
      case(s)
        2'b00: y = i[0];
        2'b01: y = i[1];
        2'b10: y = i[2];
        2'b11: y = i[3];
        default: y = 0 ;
      endcase
    else y = 0;
  end
  
endmodule

module mux_8(input [7:0] i,
             input [2:0] s,
             output y);
  
  wire mux1,mux2;
  wire s2;
  
  not(s2,s[2]);
  
  mux_4 mux_1(.i(i[3:0]),
              .s(s[1:0]),
              .en(s2),
              .y(mux1));
  
  mux_4 mux_2(.i(i[7:4]),
              .s(s[1:0]),
              .en(s[2]),
              .y(mux2));
   
  or(y,mux1,mux2);
  
endmodule
  
  
  
              
             

