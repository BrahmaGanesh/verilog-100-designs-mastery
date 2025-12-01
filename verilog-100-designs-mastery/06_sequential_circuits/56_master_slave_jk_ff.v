module master_slave_jk_ff(
    input  wire J,
    input  wire K,
    input  wire clk,
    input  wire reset_n,
    output reg  Q,
    output wire Q_bar
);

    reg master_Q;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            master_Q <= 1'b0;
        else begin
            case ({J,K})
                2'b00: master_Q <= master_Q;  
                2'b01: master_Q <= 1'b0;      
                2'b10: master_Q <= 1'b1;      
                2'b11: master_Q <= ~master_Q; 
            endcase
        end
    end

    always @(negedge clk or negedge reset_n) begin
        if (!reset_n)
            Q <= 1'b0;
        else
            Q <= master_Q;
    end
    
    assign Q_bar = ~Q;

endmodule
