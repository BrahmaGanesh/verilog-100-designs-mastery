module piso_register (
    input  wire       clk,
    input  wire       reset_n,
    input  wire [3:0] data_in,
    input  wire       load,
    output reg        data_out
);

    reg [3:0] shift_reg;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            shift_reg <= 4'b0;
            data_out  <= 1'b0;
        end else if (load) begin
            shift_reg <= data_in;
        end else begin
            data_out  <= shift_reg[3];
            shift_reg <= {shift_reg[2:0], 1'b0};
        end
    end
endmodule
