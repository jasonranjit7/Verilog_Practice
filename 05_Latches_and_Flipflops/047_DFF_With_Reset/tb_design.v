module tb_dff();
  reg clk,reset,d;
  wire q;
  
  dff dut(.d(d),
          .clk(clk),
          .reset(reset),
          .q(q)
         );
  
  initial begin
    clk=0;
    forever #10 clk=~clk;
  end
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,tb_dff.dut);
    reset = 1;
    repeat(1)@(negedge clk);
    d=1;
    reset = 0;
    @(negedge clk)
    d=0;
    $monitor("d = %0b, q = %0b",d,q);
    repeat(3)@(posedge clk);
    $finish();
  end
endmodule
    
    

