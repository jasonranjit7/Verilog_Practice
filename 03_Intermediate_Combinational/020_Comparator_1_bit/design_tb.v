module comparator_1_bit_tb();
  reg a,b;
  wire a_greater, a_smaller, equal;
  
  comparator_1_bit DUT(.a(a),
                      .b(b),
                      .a_greater(a_greater),
                      .a_smaller(a_smaller),
                      .equal(equal)
                     );
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,comparator_1_bit_tb);
    $monitor("a = %b, b = %b, a_greater =%b, a_smaller = %b, equal = %b",a,b,a_greater, a_smaller, equal);
    a = 0; b = 0;
    #10 a = 1; b = 1;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 $finish();
  end
endmodule
