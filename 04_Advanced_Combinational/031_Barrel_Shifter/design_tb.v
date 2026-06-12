module barrel_shifter_tb();
  reg [3:0]i;
  reg [1:0]s;
  reg dir;
  wire [3:0]y;
  
  barrel_shifter DUT(.i(i),
                     .s(s),
                     .dir(dir),
                     .y(y)
                    );
  
  task run;
    input [3:0] a;
    input [1:0] sh;
    input d;
    begin
      i=a;
      s=sh;
      dir = d;
      #10
      $display("input  = %b, shift amount = %0d, direction = %b, output = %b", i,s,dir,y);
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,barrel_shifter_tb.DUT);
    run($random,$random,$random);
    run($random,$random,$random);
    run($random,$random,$random);
    run($random,$random,$random);
    run($random,$random,$random);
    $finish();
  end
  
endmodule
