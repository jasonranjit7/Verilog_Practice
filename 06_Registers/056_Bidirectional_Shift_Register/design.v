module bi_shift_register(input clk,
               input rst,
               input mode, //1 for right shift, 0 for left
               input serial_ip_l,
               input serial_ip_r,
               output out);
  
  reg [3:0] register;
  always@(posedge clk) begin
    if(rst) begin
      register<=0;
    end
    else begin
      if(mode)
        register<={serial_ip_r,register[3:1]};
      else
        register<={register[2:0],serial_ip_l};
    end 
  end
  
  assign out = mode?register[0]:register[3];
  
endmodule
