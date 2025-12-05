module rom_case #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8
)(
    input  wire [ADDR_WIDTH-1:0] addr,
    output reg  [DATA_WIDTH-1:0] dout
);

    always @(*) begin
        case(addr)
            4'd0: dout = 8'hA1;
            4'd1: dout = 8'hB2;
            4'd2: dout = 8'hC3;
            4'd3: dout = 8'hD4;
            4'd4: dout = 8'hE5;
            4'd5: dout = 8'hF6;
            default: dout = 8'h00;
        endcase
    end

endmodule
