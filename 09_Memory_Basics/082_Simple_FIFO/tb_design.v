module tb_fifo#(parameter WIDTH =8, DEPTH = 8)();
  reg w_en,r_en,clk,rst;
  reg [WIDTH-1:0] d_in;
  wire full,empty;
  wire [WIDTH-1:0] dout;
  
  sync_fifo DUT(.w_en(w_en),
                .r_en(r_en),
                .d_in(d_in),
                .clk(clk),
                .rst(rst),
                .full(full),
                .empty(empty),
                .dout(dout)
               );
  
  initial
    forever #10 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    w_en = 0;
    r_en = 0;
  end
  
  task write;
    input [WIDTH-1:0] din;
    begin
      $display("Writing into FIFO");
      @(negedge clk);
      d_in = din;
      w_en = 1;
      @(posedge clk)
      #1
      w_en = 0;
      //$monitor("din = %b,wr_ptr = %b",d_in, DUT.wr_ptr);
      repeat(5) @(posedge clk);
    end
  endtask
  
  task read;
    begin
      $display("Reading from fifo");
      @(negedge clk);
      r_en = 1;
      @(posedge clk);
      #1
      r_en = 0;
      $display("dout = %b", dout);
    end
  endtask
      
  
  task disp_fifo;
    begin
      $display("FIFO");
      for(integer i=0;i<DEPTH;i=i+1)
        $display(DUT.fifo[i]);
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0, tb_fifo.DUT);
    repeat(5)@(posedge clk);
    rst = 0;
    write(8'b00100100);
    write($random);
    repeat(5)@(posedge clk);
    disp_fifo();
    repeat(5)@(posedge clk);
    read();
    repeat(5)@(posedge clk);
    disp_fifo();
    $finish();
  end
endmodule
    
    
      
  
