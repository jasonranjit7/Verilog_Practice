module comp_2s(input i,
               input clk,
               input rst,
               output y
              );
  
  reg state, nxt_state;
  
  localparam S0 = 1'b0,
  			 S1 = 1'b1;
  
  always@(posedge clk or posedge rst) begin
    if(rst)
      state<=S0;
    else
      state<=nxt_state;
  end
      
  
  always@(*) begin
    case(state)
      S0: begin
        nxt_state = i?S1:S0;
      end
      S1: begin
        nxt_state = S1;
      end
      default: nxt_state = S0;
    endcase
  end
  
  assign y = (state == S0)?i:~i;
  
endmodule
        
        
  
  
