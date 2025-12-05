module timer #(
    parameter WIDTH = 32   
)(
    input  wire clk,
    input  wire reset_n,
    input  wire enable,            
    input  wire [WIDTH-1:0] period,
    output reg  timeout         
);

    reg [WIDTH-1:0] counter;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            counter <= 0;
            timeout <= 0;
        end else if (enable) begin
            if (counter == period) begin
                timeout <= 1;  
                counter <= 0;  
            end else begin
                counter <= counter + 1;
                timeout <= 0;
            end
        end else begin
            counter <= 0;
            timeout <= 0;
        end
    end
endmodule
