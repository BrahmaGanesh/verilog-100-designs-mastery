module universal_shift_register(
    input   wire [3:0] data_in,
    input   wire  [1:0] sel,
    input   wire clk,
    input   wire reset_n,
    output  reg  [3:0] data_out
);

    always @(posedge clk or negedge reset_n) begin
        if(!reset_n)
            data_out <= 4'b0000;
        else
            case(sel)
                2'b00 : data_out <= data_out;
                2'b01 : data_out <= { 1'b0 , data_out[3:1]};
                2'b10 : data_out <= { data_out[2:0] , 1'b0};
                2'b11 : data_out <= data_in;
                default : data_out <= data_out;
            endcase
    end
endmodule
