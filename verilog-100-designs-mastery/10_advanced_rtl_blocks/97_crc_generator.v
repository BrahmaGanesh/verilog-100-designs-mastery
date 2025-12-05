module crc8_generator #(
    parameter POLY = 8'h07,  
    parameter INIT = 8'h00   
)(
    input  wire clk,
    input  wire reset_n,
    input  wire data_valid,  
    input  wire data_bit,    
    output reg  [7:0] crc_out
);

    integer i;
    reg [7:0] crc_next;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            crc_out <= INIT;
        else if (data_valid) begin
            crc_next = crc_out;
            if (data_bit ^ crc_out[7]) begin
                crc_next = {crc_out[6:0], 1'b0} ^ POLY;
            end else begin
                crc_next = {crc_out[6:0], 1'b0};
            end
            crc_out <= crc_next;
        end
    end
endmodule
