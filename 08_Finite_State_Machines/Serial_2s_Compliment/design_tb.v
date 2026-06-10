`timescale 1ns/1ps
module comp_2s_tb();
  reg i,clk,rst;
  wire y;
  
  comp_2s DUT(.i(i),
              .clk(clk),
              .rst(rst),
              .y(y)
             );
  
  reg [3:0] in,out;
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  integer j;
  
  task run;
    input [3:0] num;
    begin
      in = num;
      rst = 1;
      @(posedge clk);
      #1;
      rst = 0;
      for(j = 0;j < 4;j = j+1) begin
        i = in[j];
        #1;
        @(posedge clk);
        out[j] = y;
      end
      $display("input = %b, output = %b",num,out);
    end
  endtask
      
      
      
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,comp_2s_tb);
    run(4'b0000);
    run(4'b0001);
    run(4'b0010);
    run(4'b1000);
    run(4'b1111);
    $finish();
  end
    
endmodule
