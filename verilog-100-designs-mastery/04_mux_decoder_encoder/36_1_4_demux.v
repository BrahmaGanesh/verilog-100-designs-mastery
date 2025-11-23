module demux_1to4(
    input wire i,
    input wire [1:0] SEL,
    output reg [3:0] Y_4demux
);

    always @(*) begin
        case (SEL)
    		2'b00: Y_4demux = 4'b0001 & {4{i}};
    		2'b01: Y_4demux = 4'b0010 & {4{i}};
    		2'b10: Y_4demux = 4'b0100 & {4{i}};
    		2'b11: Y_4demux = 4'b1000 & {4{i}};
    		default: Y_4demux = 4'b0000;
	  	endcase
    end
endmodule
