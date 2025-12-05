module uart_rx #(
    parameter CLK_FREQ = 50000000,
    parameter BAUD_RATE = 9600
)(
    input  wire clk,
    input  wire reset_n,
    input  wire rx,            
    output reg  [7:0] rx_data, 
    output reg  rx_ready       
);

    localparam integer BAUD_TICK = CLK_FREQ / BAUD_RATE;

    reg [15:0] baud_cnt;
    reg [3:0]  bit_idx;
    reg [7:0]  data_buf;
    reg        receiving;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            baud_cnt  <= 0;
            bit_idx   <= 0;
            data_buf  <= 0;
            rx_data   <= 0;
            rx_ready  <= 0;
            receiving <= 0;
        end else begin
            rx_ready <= 0;
            if (!receiving) begin
                if (rx == 0) begin
                    receiving <= 1;
                    baud_cnt  <= BAUD_TICK/2;
                    bit_idx   <= 0;
                end
            end else begin
                if (baud_cnt == BAUD_TICK-1) begin
                    baud_cnt <= 0;
                    if (bit_idx < 8) begin
                        data_buf[bit_idx] <= rx;
                        bit_idx <= bit_idx + 1;
                    end else begin
                        rx_data   <= data_buf;
                        rx_ready  <= 1;
                        receiving <= 0;
                    end
                end else begin
                    baud_cnt <= baud_cnt + 1;
                end
            end
        end
    end
endmodule
