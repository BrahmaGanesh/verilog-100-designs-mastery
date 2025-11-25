module mac (
    input         clk,
    input         rst,
    input         enable,
    input  [7:0]  a,
    input  [7:0]  b,
    output [23:0] acc
);

    reg [23:0] accumulator;

    wire [15:0] product;
    assign product = a * b;

    always @(posedge clk or posedge rst) begin
        if (rst)
            accumulator <= 24'd0;
        else if (enable)
            accumulator <= accumulator + product;
    end

    assign acc = accumulator;

endmodule
