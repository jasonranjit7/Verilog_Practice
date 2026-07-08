module dff(input d,
        input clk,
        input reset,
        input en,
        output reg q);

        
  always@(posedge clk) begin
    if(reset)
      q<=0;
    else if(en)
      q<=d;
    else
      q<=q;
  end

endmodule 
