module tb_bcd_add();
  reg [3:0] a,b;
  reg cin;
  wire cout;
  wire [3:0] sum;
  
  bcd_add DUT(.a(a),
              .b(b),
              .cin(cin),
              .cout(cout),
              .sum(sum)
             );
  
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0, tb_bcd_add.DUT);
    #1
    $monitor("a = %0d, b = %0d, cin = %b, cout= %b, sum = %0d",a,b,cin,cout, sum);
    a = 4'd2;
    b = 4'd3;
    cin = 0;
    #5
    a = 4'd5;
    b = 4'd5;
    cin = 0;
    #5
    a = 4'd4;
    b = 4'd5;
    cin = 1;
    #5
    $finish();
  end
  
  
endmodule
