module full_sub_tb();
  reg x,y,bin;
  wire bout, diff;
  
  full_sub fa(.x(x),
              .y(y),
              .bin(bin),
              .bout(bout),
              .diff(diff)
               );
  
  initial begin
    #10 x = 0; y = 0; bin = 0;
    $dumpfile("image.vcd");
    $dumpvars(0);
    $monitor("x = %b, y = %b, bin = %b, diff = %b, bout = %b",x,y,bin,diff,bout);
    #10 x = 0; y = 0; bin = 1;
    #10 x = 0; y = 1; bin = 0;
    #10 x = 0; y = 1; bin = 1;
    #10 x = 1; y = 0; bin = 0;
    #10 x = 1; y = 0; bin = 1;
    #10 x = 1; y = 1; bin = 0;
    #10 x = 1; y = 1; bin = 1;
    #10 $finish();
  end
  
endmodule
