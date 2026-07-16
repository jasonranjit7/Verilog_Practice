module single_port_ram(
    input [7:0] d_in,
    input [4:0] ram_addr,
    input w_en,
    input clk,
    output reg [7:0] d_out
);
  
  reg [7:0] ram_mem [31:0];
  
  always @(posedge clk) begin
    if (w_en) begin
      ram_mem[ram_addr] <= d_in;
    end
    d_out <= ram_mem[ram_addr]; 
  end
  
endmodule

module mem_controller(input clk,
                      input rst,
                      
                      //Processor to Controller
                      input start,
                      input write,
                      input [4:0] address,
                      input [7:0] data,
                      output reg [7:0] d_out,
                      output reg ready,
                      
                      //Controller to ram
                      output [7:0] ram_data_in,
                      output w_en,
                      output [4:0] ram_addr,
                      input [7:0] ram_data_out
                     );
  
  
  reg state, nxt_state;
  localparam IDLE=0,WAIT=1;
  
  assign ram_addr = address;
  assign ram_data_in = data;
  assign w_en = start && write && (state==IDLE);
  
  always@(posedge clk) begin
    if(rst)
      state<=IDLE;
    else
      state<=nxt_state;
  end
  
  always@(*) begin
    nxt_state=state;
    case(state)
        IDLE: begin
          if(start) begin
            if(write)
              nxt_state=IDLE;
            else
              nxt_state= WAIT;
          end
        end
        WAIT: nxt_state=IDLE;
        default: nxt_state=IDLE;
      endcase
  end
  
  
  always@(posedge clk) begin
    if(rst) begin
      ready<=0;
      d_out<=0;
    end
    else begin
      case(state)
        IDLE: begin
          ready<=0;
          if(start) begin
            if(write) begin
              ready<=1;
            end
          end
        end
        WAIT: begin
          d_out<=ram_data_out;
          ready<=1'b1;
        end
        default: begin
          ready<=0;
          d_out<=0;
        end
      endcase
    end
  end
  
endmodule
      
    
  
  
                      
                      
