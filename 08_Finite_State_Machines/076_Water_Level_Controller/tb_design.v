module tb_water_level();
  reg clk,reset;
  reg [3:1] s;
  wire fr1,fr2,fr3,dfr;
  
  water_level DUT(.clk(clk),
                  .reset(reset),
                  .s(s),
                  .fr3(fr3),
                  .fr2(fr2),
                  .fr1(fr1),
                  .dfr(dfr)
                 );
  
  initial begin
    clk = 0;
    forever #5 clk=~clk;
  end
  
  task s1_on;
    begin
      $display("turning on sensor 1");
      @(negedge clk);
      s[1]=1'b1;
      @(posedge clk);
    end
  endtask
  
  task s1_off;
    begin
      $display("turning off sensor 1");
      @(negedge clk);
      s[1]=1'b0;
      @(posedge clk);
    end
  endtask
  
  task s2_on;
    begin
      $display("turning on sensor 2");
      @(negedge clk);
      s[2]=1'b1;
      @(posedge clk);
    end
  endtask
  
  task s2_off;
    begin
      $display("turning off sensor 2");
      @(negedge clk);
      s[2]=1'b0;
      @(posedge clk);
    end
  endtask
  
  task s3_on;
    begin
      $display("turning on sensor 3");
      @(negedge clk);
      s[3]=1'b1;
      @(posedge clk);
    end
  endtask
  
  task s3_off;
    begin
      $display("turning off sensor 3");
      @(negedge clk);
      s[3]=1'b0;
      @(posedge clk);
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,tb_water_level.DUT);
    $monitor("sensors = %0b, state = %d", s, DUT.state);
    $display("reset = 1");
    reset = 1;
    s=3'd0;
    @(posedge clk)
    @(negedge clk)
    $display("reset = 0");
    reset = 0;
    @(posedge clk)
    s1_on();
    repeat(2)@(posedge clk);
    s2_on();
    repeat(2)@(posedge clk);
    s3_on();
    repeat(2)@(posedge clk);
    s3_off();
    repeat(2)@(posedge clk);
    s2_off();
    repeat(2)@(posedge clk);
    s1_off();
    repeat(2)@(posedge clk);
    $finish();
  end
endmodule
    
    
