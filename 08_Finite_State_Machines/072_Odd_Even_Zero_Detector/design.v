module even_odd_zero(input data,
                     input clk,
                     input reset,
                     output even,
                     output odd,
                     output zero
                    );
  
  reg[1:0] state,nxt_state;
  localparam IDLE=0,ZERO=1,ODD=2,EVEN=3;
  
  always@(posedge clk) begin
    if(reset)
      state<= IDLE;
    else
      state<=nxt_state;
  end
  
  always@(*) begin
    case(state)
      IDLE: begin
        if(data)
          nxt_state = ODD;
        else
          nxt_state = ZERO;
      end
      ZERO: begin
        if(data)
          nxt_state = ODD;
        else
          nxt_state = ZERO;
      end
      ODD: begin
        if(data)
          nxt_state = ODD;
        else
          nxt_state = EVEN;
      end
      EVEN: begin
        if(data)
          nxt_state = ODD;
        else
          nxt_state = EVEN;
      end
      default: nxt_state = state;
    endcase
  end
  
  assign even = state ==EVEN;
  assign odd = state==ODD;
  assign zero = state==ZERO;
  
endmodule
