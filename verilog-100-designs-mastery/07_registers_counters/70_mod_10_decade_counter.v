module mod_10_counter (
    input  wire       clk,       
    input  wire       reset_n,   
    output reg  [3:0] count      
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            count <= 4'b0000;      
        end 
        else if (count == 4'b1001) begin
            count <= 4'b0000;
        end 
        else begin
            count <= count + 1'b1;
        end
    end

endmodule
