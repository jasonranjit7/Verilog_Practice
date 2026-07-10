module tb_pop_count();
  reg [254:0] in;
  wire [7:0] out;
  
  pop_count DUT(.in(in),
                .out(out)
               );
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0, tb_pop_count.DUT);
    $monitor("in = %0d, out = %0d", in, out);
    in=255'd7;
    #5
    in = 255'd1023;
    #5
    $finish();
  end
endmodule
