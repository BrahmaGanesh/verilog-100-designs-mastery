module stack_memory #(
    parameter DATA_WIDTH = 8,
    parameter STACK_DEPTH = 16,
    parameter ADDR_WIDTH = 4  
)(
    input  wire                  clk,
    input  wire                  reset_n,
    input  wire                  push,    
    input  wire                  pop,     
    input  wire [DATA_WIDTH-1:0] din,     
    output reg  [DATA_WIDTH-1:0] dout,    
    output wire                  full,
    output wire                  empty
);

    reg [DATA_WIDTH-1:0] stack [0:STACK_DEPTH-1];

    reg [ADDR_WIDTH:0] sp;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            sp   <= 0;
            dout <= 0;
        end else begin
            if (push && !full) begin
                stack[sp[ADDR_WIDTH-1:0]] <= din;
                sp <= sp + 1;
            end
            if (pop && !empty) begin
                sp   <= sp - 1;
                dout <= stack[sp[ADDR_WIDTH-1:0]-1];
            end
            if (!push && !pop && !empty) begin
                dout <= stack[sp[ADDR_WIDTH-1:0]-1];
            end
        end
    end

    assign empty = (sp == 0);
    assign full  = (sp == STACK_DEPTH);

endmodule
