module sync_fifo #(parameter WIDTH = 8, DEPTH =8)
  				(input w_en,
                 input r_en,
                 input [WIDTH-1:0] d_in,
                 input clk,
                 input rst,
                 output full,
                 output empty,
                 output reg [WIDTH-1:0] dout
                );
  
  reg [$clog2(WIDTH)-1:0] rd_ptr, wr_ptr;
  reg [WIDTH-1:0] fifo [0:DEPTH-1];
  
  //write op
  always@(posedge clk) begin
    if(rst) begin
      wr_ptr <= 1'b0;
      for(integer i=0; i<DEPTH; i=i+1)
        fifo[i] <= 0;
    end
    else if(w_en && !full) begin
      fifo[wr_ptr] <= d_in;
      wr_ptr <= wr_ptr + 1'b1;
    end
  end
  
  //read op
  always@(posedge clk) begin
    if(rst)
      rd_ptr <= 0;
    else if(r_en && !empty) begin
      dout <= fifo[rd_ptr];
      rd_ptr <= rd_ptr + 1'b1;
    end
  end
  
  assign full = ((wr_ptr + 1'b1) == rd_ptr);
  assign empty = (wr_ptr == rd_ptr);
  
endmodule
  
  
  
  
