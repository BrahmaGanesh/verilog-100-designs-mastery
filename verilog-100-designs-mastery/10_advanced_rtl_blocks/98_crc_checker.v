module crc8_checker #(
    parameter POLY = 8'h07,     
    parameter INIT = 8'h00      
)(
    input  wire clk,
    input  wire reset_n,
    input  wire data_valid,     
    input  wire data_bit,       
    output reg  error_flag      
);

    reg [7:0] crc_reg;
    reg [7:0] crc_next;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            crc_reg    <= INIT;
            error_flag <= 0;
        end else if (data_valid) begin
            crc_next = crc_reg;
            if (data_bit ^ crc_reg[7]) begin
                crc_next = {crc_reg[6:0], 1'b0} ^ POLY;
            end else begin
                crc_next = {crc_reg[6:0], 1'b0};
            end
            crc_reg <= crc_next;
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            error_flag <= 0;
        else if (!data_valid) begin
            error_flag <= (crc_reg != 0);
        end
    end
endmodule
