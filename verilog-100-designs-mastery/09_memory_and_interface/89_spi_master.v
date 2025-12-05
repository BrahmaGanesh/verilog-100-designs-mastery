module spi_master #(
    parameter CLK_FREQ = 50000000,
    parameter SPI_FREQ = 1000000   
)(
    input  wire clk,
    input  wire reset_n,
    input  wire start,               
    input  wire [7:0] mosi_data,     
    output reg  [7:0] miso_data,     
    output reg  busy,                
    output reg  sclk,
    output reg  mosi,
    input  wire miso,
    output reg  cs_n
);

    localparam integer DIV = CLK_FREQ / (2*SPI_FREQ);

    reg [15:0] clk_cnt;
    reg [2:0]  bit_idx;
    reg [7:0]  shift_reg;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            clk_cnt   <= 0;
            bit_idx   <= 0;
            shift_reg <= 0;
            sclk      <= 0;
            mosi      <= 0;
            miso_data <= 0;
            cs_n      <= 1;
            busy      <= 0;
        end else begin
            if (start && !busy) begin
                busy      <= 1;
                cs_n      <= 0;           
                shift_reg <= mosi_data;
                bit_idx   <= 0;
                clk_cnt   <= 0;
                sclk      <= 0;
            end else if (busy) begin
                if (clk_cnt == DIV-1) begin
                    clk_cnt <= 0;
                    sclk <= ~sclk;

                    if (sclk == 0) begin
                        mosi <= shift_reg[7];
                        shift_reg <= {shift_reg[6:0], 1'b0};
                    end else begin
                        miso_data <= {miso_data[6:0], miso};
                        bit_idx <= bit_idx + 1;
                        if (bit_idx == 7) begin
                            busy <= 0;
                            cs_n <= 1;
                        end
                    end
                end else begin
                    clk_cnt <= clk_cnt + 1;
                end
            end
        end
    end
endmodule
