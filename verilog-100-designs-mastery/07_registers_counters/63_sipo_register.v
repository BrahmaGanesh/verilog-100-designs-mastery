module sipo_register (
    input  wire       clk,
    input  wire       reset_n,
    input  wire       data_in, 
    output reg  [3:0] data_out 
);

    reg [3:0] shift_reg;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            shift_reg <= 4'b0;
            data_out  <= 4'b0;
        end else begin
            shift_reg <= {shift_reg[2:0], data_in};
            data_out  <= shift_reg;
        end
    end

endmodule
