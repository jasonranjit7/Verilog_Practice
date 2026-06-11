module comparator_4bit_tb();
  reg [3:0]a,b;
  wire greater,smaller,equal;
  
  comparator_4bit DUT(.a(a),
                      .b(b),
                      .greater(greater),
                      .smaller(smaller),
                      .equal(equal)
                     );
  
  task run;
    input [3:0] i1,i2;
    begin
      a = i1;
      b = i2;
      #10
      $display("a = %0b, b = %0b, greater = %b, smaller = %b, equal = %b",a,b,greater,smaller,equal);
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0);
    run(4'd7, 4'd7);
    run($random, $random);
    run($random, $random);
    run($random, $random);
  end
endmodule
