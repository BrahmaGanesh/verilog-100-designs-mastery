module arithmetic_logic_unit(
    input   wire [7:0] a,
    input   wire [7:0] b,
    input   wire [3:0] opcode,
    output  reg [7:0] result,
    output  reg       carry   
);

    always @(*) begin
        carry = 1'b0;
        case(opcode)
            4'b0000: begin
                    {carry,result} = a + b;
                    end   
            4'b0001: result = a - b;   
            4'b0010: result = a & b;   
            4'b0011: result = a | b;   
            4'b0100: result = a ^ b;   
            4'b0101: result = ~a;      
            default: result = 8'b00000000;
        endcase
    end
endmodule
