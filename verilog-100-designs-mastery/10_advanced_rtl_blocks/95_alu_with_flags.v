module alu_with_flags #(
    parameter DATA_WIDTH = 8
)(
    input  wire [DATA_WIDTH-1:0] A,
    input  wire [DATA_WIDTH-1:0] B,
    input  wire [3:0] opcode,  
    output reg  [DATA_WIDTH-1:0] result,
    output reg  zero_flag,
    output reg  carry_flag,
    output reg  negative_flag,
    output reg  overflow_flag
);

    reg [DATA_WIDTH:0] tmp;

    always @(*) begin
        result        = 0;
        zero_flag     = 0;
        carry_flag    = 0;
        negative_flag = 0;
        overflow_flag = 0;

        case (opcode)
            4'b0000: begin
                tmp    = A + B;
                result = tmp[DATA_WIDTH-1:0];
                carry_flag = tmp[DATA_WIDTH];
                overflow_flag = (A[DATA_WIDTH-1] == B[DATA_WIDTH-1]) &&
                                (result[DATA_WIDTH-1] != A[DATA_WIDTH-1]);
            end
            4'b0001: begin
                tmp    = A - B;
                result = tmp[DATA_WIDTH-1:0];
                carry_flag = tmp[DATA_WIDTH];
                overflow_flag = (A[DATA_WIDTH-1] != B[DATA_WIDTH-1]) &&
                                (result[DATA_WIDTH-1] != A[DATA_WIDTH-1]);
            end
            4'b0010: result = A & B;  
            4'b0011: result = A | B;  
            4'b0100: result = A ^ B;  
            4'b0101: result = ~A;     
            4'b0110: result = A << 1; 
            4'b0111: result = A >> 1; 
            default: result = 0;
        endcase

        zero_flag     = (result == 0);
        negative_flag = result[DATA_WIDTH-1];
    end
endmodule
