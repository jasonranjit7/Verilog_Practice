module ripple_carry_4bit_tb();
  reg [3:0]a,b;
  reg cin;
  wire [3:0] sum;
  wire cout;
  
  ripple_carry_4bit DUT(.a(a),
                    .b(b),
                    .cin(cin),
                    .sum(sum),
                    .cout(cout)
                   );
  
  task run;
    input [3:0]x,y;
    input c;
    begin
      a=x;
      b=y;
      cin = c;
      #10
      $display("a = %0b,b=%b, cin = %b, sum = %b, cout = %b",a,b,cin,sum,cout);
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,ripple_carry_4bit_tb.DUT);
    run($random,$random,$random);
    run($random,$random,$random);
    run($random,$random,$random);
  end
endmodule
