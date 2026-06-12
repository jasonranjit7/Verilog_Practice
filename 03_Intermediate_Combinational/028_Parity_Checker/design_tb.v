module parity_checker_tb();
  reg [3:0]a;
  reg even_odd;
  reg p;
  wire c;
  
  parity_checker DUT(.a(a),
                     .p(p),
                     .even_odd(even_odd),
                     .c(c)
                    );
  
  task run;
    input [3:0]x;
    input e_o;
    input pa;
    begin
      a=x;
      even_odd = e_o;
      p = pa;
      #10
      $display("input = %b, even/odd = %b, paritybit = %b, checker bit  = %b",a,e_o,pa,c);
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,parity_checker_tb);
    run(4'd15, 1'b1, $random);
    run($random, $random, $random);
    run($random, $random, $random);
    run($random, $random, $random);
  end
endmodule
    
      
      

