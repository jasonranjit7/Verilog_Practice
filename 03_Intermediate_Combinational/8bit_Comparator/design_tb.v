module comparator_8bit_tb();
  reg [7:0]a,b;
  wire greater,smaller,equal;
  
  comparator_8bit DUT(.a(a),
                      .b(b),
                      .greater(greater),
                      .smaller(smaller),
                      .equal(equal)
                     );
  
  task run;
    input [7:0] i1,i2;
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
    run(8'd12, 8'd12);
    run($random, $random);
    run($random, $random);
    run($random, $random);
  end
endmodule
