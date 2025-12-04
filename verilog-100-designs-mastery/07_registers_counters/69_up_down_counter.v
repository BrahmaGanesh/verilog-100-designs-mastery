module up_down_counter (
    input  wire       clk,
    input  wire       reset_n,
    input  wire       dir,
    output reg  [3:0] count
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            count <= 4'b0000;   
        else if(dir)
            count <= count + 1'b1;
        else     
            count <= count - 1'b1;
    end

endmodule
