module fir_filter #(
    parameter N = 4,
    parameter DATA_WIDTH = 16
)(
    input  wire clk,
    input  wire reset_n,
    input  wire signed [DATA_WIDTH-1:0] x_in, 
    output reg  signed [DATA_WIDTH-1:0] y_out 
);

    reg signed [DATA_WIDTH-1:0] coeff [0:N-1];
    initial begin
        coeff[0] = 16'sd8192;
        coeff[1] = 16'sd8192;
        coeff[2] = 16'sd8192;
        coeff[3] = 16'sd8192;
    end

    reg signed [DATA_WIDTH-1:0] x_reg [0:N-1];
    integer i;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            for (i=0; i<N; i=i+1) x_reg[i] <= 0;
            y_out <= 0;
        end else begin
            for (i=N-1; i>0; i=i-1)
                x_reg[i] <= x_reg[i-1];
            x_reg[0] <= x_in;

            y_out <= (coeff[0]*x_reg[0] + coeff[1]*x_reg[1] +
                      coeff[2]*x_reg[2] + coeff[3]*x_reg[3]) >>> 14;
        end
    end
endmodule
