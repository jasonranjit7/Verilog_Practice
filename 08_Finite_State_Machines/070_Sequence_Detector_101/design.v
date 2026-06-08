module seq_det(input in,
               input clk, input rst,
               output y);
  
  reg [1:0] state,nxt_state;
  
  localparam [1:0] S0 = 2'b00,
  				   S1 = 2'b01,
  				   S10 = 2'b10,
  				   S101 = 2'b11;
  					
  
  always@(posedge clk, posedge rst) begin
    if(rst)
      state <= S0;
    else
      state <= nxt_state;
  end
  
  always@(*) begin
    case(state)
      S0: 
        if(in) 
          nxt_state = S1;
      	else
          nxt_state = S0;
      S1:
        if(!in) 
          nxt_state = S10;
      	else
          nxt_state = S0;
      S10:
        if(in) 
          nxt_state = S101;
      	else
          nxt_state = S0;
      S101:
        if(in) 
          nxt_state = S1;
      	else
          nxt_state = S0;
      default: nxt_state = S0;
    endcase
  end
  
  assign y = (state == S101)?1:0;
endmodule
