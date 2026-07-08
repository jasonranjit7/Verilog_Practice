module mealy_101(
    input clk,
    input rstn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    reg [1:0] state,nxt_state;
    localparam IDLE=0,S1=1,S10=2,S101=3;
    
    always@(posedge clk or negedge rstn) begin
        if(!rstn)
            state<=IDLE;
        else
            state<=nxt_state;
    end
    
    always@(*) begin
        nxt_state = state;
        case(state)
            IDLE: begin
                if(x)
                    nxt_state = S1;
                else
                    nxt_state = IDLE;
            end
            S1: begin
                if(!x)
                    nxt_state = S10;
                else
                    nxt_state = S1;
            end
            S10: begin
                if(x)
                    nxt_state = S101;
                else
                    nxt_state = IDLE;
            end
            S101: begin
                if(!x)
                    nxt_state = S10;
                else
                    nxt_state = S1;
            end
            default: nxt_state = state;
        endcase
    end
    
    assign z = (state == S10 && x)?1'b1:1'b0;

endmodule

