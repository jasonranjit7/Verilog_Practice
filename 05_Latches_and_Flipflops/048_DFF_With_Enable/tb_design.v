module tb_dff();
  reg clk,reset,d,en;
  wire q;
  
  dff dut(.d(d),
          .clk(clk),
          .reset(reset),
          .en(en),
          .q(q)
         );
  
  initial begin
    clk=0;
    forever #10 clk=~clk;
  end
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,tb_dff.dut);
    $monitor("d = %0b, q = %0b",d,q);
    reset = 1;
    en=0;
    repeat(1)@(negedge clk);
    d=1;
    reset = 0;
    en=0;
    @(negedge clk)
    en=1;
    d=1;
    repeat(2)@(posedge clk);
    $finish();
  end
endmodule
    
    

