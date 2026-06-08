module seq_det(input in,
               input clk, input rst,
               output y);
  
  reg [2:0] state,nxt_state;
  
  localparam [2:0] S0 = 3'b000,
  				   S1 = 3'b001,
  				   S11 = 3'b010,
  				   S110 = 3'b011,
  				   S1101 = 3'b100;
  					
  
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
        if(in) 
          nxt_state = S11;
      	else
          nxt_state = S0;
      S11:
        if(!in) 
          nxt_state = S110;
      	else
          nxt_state = S1;
      S110:
        if(in) 
          nxt_state = S1101;
      	else
          nxt_state = S0;
      S1101:
        if(in) 
          nxt_state = S1;
      	else
          nxt_state = S0;
      default: nxt_state = S0;
    endcase
  end
  
  assign y = (state == S1101)?1:0;
endmodule
