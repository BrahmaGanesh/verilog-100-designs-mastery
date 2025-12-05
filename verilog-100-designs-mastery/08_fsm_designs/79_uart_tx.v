module uart_tx #(
    parameter CLK_FREQ = 50000000,  
    parameter BAUD_RATE = 9600      
)(
    input  wire clk,
    input  wire reset_n,
    input  wire tx_start,           
    input  wire [7:0] tx_data,      
    output reg  tx,                 
    output reg  busy                
);

    localparam integer BAUD_TICK = CLK_FREQ / BAUD_RATE;

    reg [15:0] baud_cnt;
    reg [3:0]  bit_idx;
    reg [9:0]  shift_reg;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            baud_cnt  <= 0;
            bit_idx   <= 0;
            shift_reg <= 10'b1111111111;
            tx        <= 1'b1;
            busy      <= 1'b0;
        end else begin
            if (tx_start && !busy) begin
                shift_reg <= {1'b1, tx_data, 1'b0};
                bit_idx   <= 0;
                baud_cnt  <= 0;
                busy      <= 1'b1;
            end else if (busy) begin
                if (baud_cnt == BAUD_TICK-1) begin
                    baud_cnt <= 0;
                    tx <= shift_reg[bit_idx];
                    bit_idx <= bit_idx + 1;
                    if (bit_idx == 9) busy <= 1'b0;
                end else begin
                    baud_cnt <= baud_cnt + 1;
                end
            end
        end
    end
endmodule
