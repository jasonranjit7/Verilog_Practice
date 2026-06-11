module parity_gen_tb();
  reg [3:0]a;
  reg even_odd;
  wire p;
  
  parity_gen DUT(.a(a),
             .even_odd(even_odd),
             .p(p)
            );
  
  task run;
    input [3:0]x;
    input e_o;
    begin
      a=x;
      even_odd = e_o;
      #10
      $display("input = %b, even/odd = %b, paritybit = %b",a,e_o,p);
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0);
    run(4'd15, 1'b1);
    run($random, $random);
    run($random, $random);
    run($random, $random);
  end
endmodule
    
      
      

