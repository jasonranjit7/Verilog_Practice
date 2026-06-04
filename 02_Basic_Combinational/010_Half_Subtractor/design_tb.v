module half_sub_tb();
  reg x,y;
  wire bout, diff;
  
  half_sub hs(.x(x),
                .y(y),
                .bout(bout),
                .diff(diff)
               );
  
  initial begin
    #10 x = 0; y = 0;
    $dumpfile("image.vcd");
    $dumpvars(0);
    $monitor("x = %b, y = %b, diff = %b, bout = %b", x,y,diff,bout);
    #10 y = 1;
    #10 x = 1; y = 0;
    #10 y = 1;
    #10 $finish();
  end
  
endmodule
