module tb_even_odd_zero();
  reg data,clk,reset;
  wire even,odd,zero;
  
  even_odd_zero DUT(.data(data),
                    .clk(clk),
                    .reset(reset),
                    .even(even),
                    .odd(odd),
                    .zero(zero)
                   );
  
  initial begin
    clk = 0;
    forever #5 clk=~clk;
  end
  
  task get_data;
    input d;
    begin
      @(negedge clk);
      data =d;
      @(posedge clk);
    end
  endtask    
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0, tb_even_odd_zero.DUT);
    reset=1;
    $monitor("input = %b, state = %d",data, DUT.state);
    @(negedge clk);
    reset = 0;
    get_data(1'b0);
    get_data(1'b1);
    get_data(1'b1);
    get_data(1'b0);
    get_data(1'b1);
    get_data(1'b0);
    reset = 1;
    @(posedge clk);
    $finish();
  end
endmodule
    
