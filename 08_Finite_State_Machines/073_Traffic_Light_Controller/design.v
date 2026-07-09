module traffic_light(input clk,
                      input reset,
                      input E, //east side traffic sensor
                      input E_R, //east side right turn lane sensor
                      input pri_E, //priority vehicle east
                      input W,
                      input W_R,
                      input pri_W, 
                      input N,
                      input N_R,
                      input pri_N, 
                      input S,
                      input S_R,
                      input pri_S, 
                      output reg [3:1] light_E, //[1] index is greeen, [2] yellow, [3] red
                      output reg ped_light_EW, //pedestrian light East and West,1 green,0 red
                      output reg light_E_R, //right turn light east 1 green, 0 red
                      output reg [3:1] light_W,
                      output reg light_W_R,
                      output reg [3:1] light_N,
                      output reg ped_light_NS,
                      output reg light_N_R,
                      output reg [3:1] light_S,
                      output reg light_S_R
                     );
  
  reg [2:0] state,nxt_state;
  localparam EAST=0,EAST_R=1,WEST=2,WEST_R=3,NORTH=4,NORTH_R=5,
  			 SOUTH=6,SOUTH_R=7;
  
  always@(posedge clk) begin
    if(reset)
      state<=EAST;
    else
      state<=nxt_state;
  end
  
  reg [3:0] count;
  reg c,r,pri;
  
  always@(posedge clk) begin
    if(reset)
      count<=0;
    else begin
      count<=count+1;
      if(r)
        count<=0;
      if(pri)
        count<=5'd30;
    end
  end
  
  always@(*) begin
    nxt_state = state;
    r=0;
    pri=0;
    case(state)
      
      EAST: begin
        if(pri_E) begin
          r=1;
          nxt_state = EAST_R;
        end
        else if(pri_W) begin
          pri=1;
          if(count!=15)
            nxt_state=EAST;
          else
            nxt_state = WEST_R;
        end
        else if(pri_N) begin
          pri=1;
          if(count!=15)
            nxt_state=EAST;
          else
            nxt_state = NORTH_R;
        end
        else if(pri_S) begin
          pri=1;
          if(count!=15)
            nxt_state=EAST;
          else
            nxt_state = SOUTH_R;
        end
        else begin
          if(!E &!E_R && count<7) begin
            if(S)
              nxt_state = SOUTH;
            else if(S_R)
              nxt_state = SOUTH_R;
            else if(W)
              nxt_state = WEST;
            else if(W_R)
              nxt_state = WEST_R;
            else if(N)
              nxt_state = NORTH;
            else if(N_R)
              nxt_state = NORTH_R;
            else nxt_state = EAST;
          end
          else if(count==5 && E_R)
            nxt_state=EAST_R;
          else if(count==15) begin
            $display("loop1");
            nxt_state = SOUTH;
          end
          else begin;
            nxt_state = EAST;
          end
        end
      end
      
      EAST_R: begin
        r=0;
        if(pri_W) begin
          pri=1;
          if(count!=15)
            nxt_state=EAST_R;
          else
            nxt_state = WEST_R;
        end
        else if(pri_N) begin
          pri=1;
          if(count!=15)
            nxt_state=EAST_R;
          else
            nxt_state = NORTH_R;
        end
        else if(pri_S) begin
          pri=1;
          if(count!=15)
            nxt_state=EAST_R;
          else
            nxt_state = SOUTH_R;
        end
        else if(count!=15) begin
          if(!E_R) begin
            if(S)
              nxt_state = SOUTH;
            else if(S_R)
              nxt_state = SOUTH_R;
            else if(W)
              nxt_state = WEST;
            else if(W_R)
              nxt_state = WEST_R;
            else if(N)
              nxt_state = NORTH;
            else if(N_R)
              nxt_state = NORTH_R;
          end
          else     
          	nxt_state = EAST_R;
        end
        else nxt_state = SOUTH;
      end
      
      SOUTH: begin
        if(pri_S) begin
          r=1;
          nxt_state = SOUTH_R;
        end
        else if(pri_W) begin
          pri=1;
          if(count!=15)
            nxt_state=EAST;
          else
            nxt_state = WEST_R;
        end
        else if(pri_N) begin
          pri=1;
          if(count!=15)
            nxt_state=EAST;
          else
            nxt_state = NORTH_R;
        end
        else if(pri_E) begin
          pri=1;
          if(count!=15)
            nxt_state=SOUTH;
          else
            nxt_state = EAST_R;
        end
        else begin
          if(!E &!E_R && count<7) begin
            if(E)
              nxt_state = EAST;
            else if(E_R)
              nxt_state = EAST_R;
            else if(W)
              nxt_state = WEST;
            else if(W_R)
              nxt_state = WEST_R;
            else if(N)
              nxt_state = NORTH;
            else if(N_R)
              nxt_state = NORTH_R;
            else nxt_state = SOUTH;
          end
          else if(count==7 && S_R)
            nxt_state=SOUTH_R;
          else if(count==15) begin
            $display("loop2");
            nxt_state = WEST;
          end
          else begin;
            nxt_state = SOUTH;
          end
        end
      end
      
      SOUTH_R: begin
        r=0;
        if(pri_W) begin
          pri=1;
          if(count!=15)
            nxt_state=EAST_R;
          else
            nxt_state = WEST_R;
        end
        else if(pri_N) begin
          pri=1;
          if(count!=15)
            nxt_state=EAST_R;
          else
            nxt_state = NORTH_R;
        end
        else if(pri_E) begin
          pri=1;
          if(count!=15)
            nxt_state=SOUTH_R;
          else
            nxt_state = EAST_R;
        end
        else if(count!=15) begin
          if(!S_R) begin
            if(W)
              nxt_state = WEST;
            else if(W_R)
              nxt_state = WEST_R;
            else if(N)
              nxt_state = NORTH;
            else if(N_R)
              nxt_state = NORTH_R;
            else if(E)
              nxt_state = EAST;
            else if(E_R)
              nxt_state = EAST_R;
          end
          else     
          	nxt_state = SOUTH_R;
        end
        else nxt_state = WEST;
      end
      
      WEST: begin
        if(pri_W) begin
          r=1;
          nxt_state = WEST_R;
        end
        else if(pri_E) begin
          pri=1;
          if(count!=15)
            nxt_state=WEST;
          else
            nxt_state = EAST_R;
        end
        else if(pri_N) begin
          pri=1;
          if(count!=15)
            nxt_state=WEST;
          else
            nxt_state = NORTH_R;
        end
        else if(pri_S) begin
          pri=1;
          if(count!=15)
            nxt_state=WEST;
          else
            nxt_state = SOUTH_R;
        end
        else begin
          if(!W &!W_R && count<7) begin
            if(S)
              nxt_state = SOUTH;
            else if(S_R)
              nxt_state = SOUTH_R;
            else if(E)
              nxt_state = EAST;
            else if(E_R)
              nxt_state = EAST_R;
            else if(N)
              nxt_state = NORTH;
            else if(N_R)
              nxt_state = NORTH_R;
            else nxt_state = WEST;
          end
          else if(count==5 && W_R)
            nxt_state=W_R;
          else if(count==15) begin
            $display("loop1");
            nxt_state = NORTH;
          end
          else begin;
            nxt_state = WEST;
          end
        end
      end
      
      WEST_R: begin
        r=0;
        if(pri_N) begin
          pri=1;
          if(count!=15)
            nxt_state=WEST_R;
          else
            nxt_state = NORTH_R;
        end
        else if(pri_E) begin
          pri=1;
          if(count!=15)
            nxt_state=WEST_R;
          else
            nxt_state = EAST_R;
        end
        else if(pri_S) begin
          pri=1;
          if(count!=15)
            nxt_state=WEST_R;
          else
            nxt_state = SOUTH_R;
        end
        else if(count!=15) begin
          if(!W_R) begin
            if(S)
              nxt_state = SOUTH;
            else if(S_R)
              nxt_state = SOUTH_R;
            else if(E)
              nxt_state = EAST;
            else if(E_R)
              nxt_state = EAST_R;
            else if(N)
              nxt_state = NORTH;
            else if(N_R)
              nxt_state = NORTH_R;
          end
          else     
          	nxt_state = WEST_R;
        end
        else nxt_state = NORTH;
      end
      
      NORTH: begin
        if(pri_N) begin
          r=1;
          nxt_state = NORTH_R;
        end
        else if(pri_W) begin
          pri=1;
          if(count!=15)
            nxt_state=NORTH;
          else
            nxt_state = WEST_R;
        end
        else if(pri_E) begin
          pri=1;
          if(count!=15)
            nxt_state=NORTH;
          else
            nxt_state = EAST_R;
        end
        else if(pri_S) begin
          pri=1;
          if(count!=15)
            nxt_state=NORTH;
          else
            nxt_state = SOUTH_R;
        end
        else begin
          if(!N &!N_R && count<7) begin
            if(S)
              nxt_state = SOUTH;
            else if(S_R)
              nxt_state = SOUTH_R;
            else if(E)
              nxt_state = EAST;
            else if(E_R)
              nxt_state = EAST_R;
            else if(W)
              nxt_state = WEST;
            else if(W_R)
              nxt_state = WEST_R;
            else nxt_state = NORTH;
          end
          else if(count==5 && N_R)
            nxt_state=N_R;
          else if(count==15) begin
            $display("loop1");
            nxt_state = EAST;
          end
          else begin;
            nxt_state = NORTH;
          end
        end
      end
      
      NORTH_R: begin
        r=0;
        if(pri_W) begin
          pri=1;
          if(count!=15)
            nxt_state=NORTH_R;
          else
            nxt_state = WEST_R;
        end
        else if(pri_E) begin
          pri=1;
          if(count!=15)
            nxt_state=NORTH_R;
          else
            nxt_state = EAST_R;
        end
        else if(pri_S) begin
          pri=1;
          if(count!=15)
            nxt_state=NORTH_R;
          else
            nxt_state = SOUTH_R;
        end
        else if(count!=15) begin
          if(!N_R) begin
            if(S)
              nxt_state = SOUTH;
            else if(S_R)
              nxt_state = SOUTH_R;
            else if(W)
              nxt_state = WEST;
            else if(W_R)
              nxt_state = WEST_R;
            else if(E)
              nxt_state = EAST;
            else if(E_R)
              nxt_state = EAST_R;
          end
          else     
          	nxt_state = NORTH_R;
        end
        else nxt_state = EAST;
      end
      
      default:nxt_state=state;    
      
    endcase
  end
  
  //output logic
  always@(*) begin
    light_E = 0;
    light_W = 0;
    light_N = 0;
    light_S = 0;
    ped_light_EW = 0;
    case(state)
      EAST: begin
        light_E[1] = 1'b1;
        light_W[1]=1'b1;
        ped_light_EW = 1'b1;
      end
      EAST_R: begin
        light_E[1] = 1'b1;
        light_E_R = 1'b1;
      end
      SOUTH: begin
        light_S[1] = 1'b1;
        light_N[1] = 1'b1;
        ped_light_NS = 1'b1;
      end
      NORTH_R: begin
        light_N[1] = 1'b1;
        light_N_R = 1'b1;
      end
      WEST: begin
        light_W[1] = 1'b1;
        light_E[1] = 1'b1;
        ped_light_EW = 1'b1;
      end
      WEST_R: begin
        light_W[1] = 1'b1;
        light_W_R = 1'b1;
      end
      SOUTH: begin
        light_S[1] = 1'b1;
        light_N[1] = 1'b1;
        ped_light_NS = 1'b1;
      end
      SOUTH_R: begin
        light_S[1] = 1'b1;
        light_S_R = 1'b1;
      end
    endcase
  end
        
  
endmodule
        
        
          
          
          
                                
