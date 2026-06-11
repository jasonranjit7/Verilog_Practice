module binary_to_gray_tb();
  reg [3:0]i,n;
  wire [3:0]g;
  
  
  binary_to_gray DUT(.i(i),
                     .g(g)
                    );
  
  
  task run;
    input [3:0]j;
    begin
      i = j;
      #10;
      $display("Binary = %b, Gray = %b",i,g);
      #10;
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,binary_to_gray_tb);
    run(4'b1010);
    run(4'b1000);
    run(4'b0100);
    run(4'b0010);
    run(4'b1011);
  end
endmodule
      
      
    
    

