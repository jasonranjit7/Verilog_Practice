module tb_traffic_light();
  reg clk,reset, E,E_R,pri_E,W,W_R,pri_W,N,N_R,pri_N, 
  			S,S_R,pri_S; 
  
  wire [3:1] light_E, light_W, light_N, light_S;
  wire ped_light_EW,light_E_R,light_W_R,
  	   ped_light_NS,light_N_R,light_S_R;
  
  traffic_light DUT(clk,reset,E,E_R,pri_E,W,W_R,pri_W,N,N_R,pri_N,S
                   ,S_R,pri_S,light_E,ped_light_EW,light_E_R,light_W
                   ,light_W_R,light_N,ped_light_NS,light_N_R,light_S
                   ,light_S_R);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  task rst;
    begin
      $display("Reset");
      repeat(1)@(posedge clk);            
      reset = 1;     
      repeat(4)@(posedge clk);  
      reset = 0;     
      repeat(1)@(posedge clk);  
    end
  endtask
  
  task display;
    begin
      if(DUT.state == 0) begin
        $display("EAST and WEST on");
        $display("light East = %b, ped light = %d, Light West = %b",
                 light_E, ped_light_EW,light_W);
      end
      if(DUT.state == 1) begin
        $display("EAST right on");
        $display("light East = %b, ped light = %d, right turn east = %b",
                 light_E, ped_light_EW,light_E_R);  
      end
      if(DUT.state == 2) begin
        $display("WEST and EAST on");
        $display("light East = %b, ped light = %d, Light West = %b",
                 light_E, ped_light_EW,light_W);
      end
      if(DUT.state == 3) begin
        $display("WEST right on");
        $display("light WEST = %b, ped light = %d, right turn West = %b",
                 light_W, ped_light_EW,light_W_R);  
      end
      if(DUT.state == 4) begin
        $display("NORTH and SOUTH on");
        $display("light NORTH = %b, ped light = %d, Light South = %b",
                 light_N, ped_light_NS,light_S);
      end
      if(DUT.state == 5) begin
        $display("NORTH right on");
        $display("light north = %b, ped light = %d, right turn North = %b",
                 light_N, ped_light_NS,light_N_R);  
      end
      if(DUT.state == 6) begin
        $display("SOUTH and NORTH on");
        $display("light South = %b, ped light = %d, Light North = %b",
                 light_S, ped_light_NS,light_N);
      end
      if(DUT.state == 7) begin
        $display("SOUTH right on");
        $display("light South = %b, ped light = %d,right turn South = %b",
                 light_S, ped_light_NS,light_S_R);  
      end
    end
  endtask
  
  task wait_state;
    input s;
    begin
      wait(DUT.state==s);
      display();
    end
  endtask
  
  task regular_run;
    begin
      repeat(3)
        $display(" ");
      $display("Regular timed Run");
      rst();
      wait(DUT.state==0);
      display();
      wait(DUT.state==6);
      display();
      wait(DUT.state==2);
      display();
      wait(DUT.state==4);
      display();
      wait(DUT.state==0);
      display();
    end
  endtask
        
  
  task run_with_right;
    begin
      repeat(3)
        $display(" ");
      $display("Run with Right sensors ");
      rst();
      wait(DUT.state==0);
      @(negedge clk);
      E_R = 1;
      display();
      wait(DUT.state==1);
      E_R=0;
      display();
      wait(DUT.state==6)
      @(negedge clk);
      S_R=1;
      display();
      wait(DUT.state==7);
      S_R=0;
      display();
      wait(DUT.state==2)
      @(negedge clk);
      W_R=1;
      display();
      wait(DUT.state==3);
      W_R=0;
      display();
      wait(DUT.state==4)
      @(negedge clk);
      N_R=1;
      display();
      wait(DUT.state==5);
      N_R=0;
      display();
      wait(DUT.state==0);
      display();
    end
  endtask
      
        
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,tb_traffic_light.DUT);
    E = 0; E_R = 0; pri_E = 0;
    W = 0; W_R = 0; pri_W = 0;
    N = 0; N_R = 0; pri_N = 0;
    S = 0; S_R = 0; pri_S = 0;
    
    regular_run();
    run_with_right();
    $finish();
  end
endmodule
