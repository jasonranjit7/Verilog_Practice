module gray_to_binary_tb();
  reg [3:0]g,n;
  wire [3:0]b;
  
  
  gray_to_binary DUT(.g(g),
                     .b(b)
                    );
  
  
  task run;
    input [3:0]j;
    begin
      g = j;
      #10;
      $display("Gray = %b, Binary = %b",g,b);
      #10;
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,gray_to_binary_tb);
    run(4'b1111);
    run(4'b1100);
    run(4'b0110);
    run(4'b0011);
    run(4'b1110);
  end
endmodule
