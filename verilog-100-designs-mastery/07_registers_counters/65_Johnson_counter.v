module johnson_counter (
    input  wire clk,
    input  wire reset_n,
    input  wire en,
    output reg  [3:0] count,
    output reg        Q,
    output wire       Q_bar
);

    assign Q_bar = ~Q;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            count <= 4'b0001;
            Q     <= 1'b0;
        end else if (en) begin
            count <= {count[2:0], ~count[3]};
            Q     <= count[3];
        end
    end

endmodule
