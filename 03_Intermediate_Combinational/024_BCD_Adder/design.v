module bcd_add (
    input [3:0] a,
    input [3:0] b,
    input  cin,
    output reg cout,
    output reg [3:0] sum );
  
  always@(*) begin
    if(a+b+cin<=9) begin
      sum = a+b+cin;
      cout = 0;
    end
    else begin
      sum = 10-(a+b+cin);
      cout = 1;
    end
  end
endmodule
