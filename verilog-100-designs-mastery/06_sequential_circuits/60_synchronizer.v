module two_ff_synchronizer(
    input  wire clk,       
    input  wire reset_n,   
    input  wire async_in,  
    output reg  sync_out   
);

    reg sync_ff1; 

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            sync_ff1 <= 1'b0;
            sync_out <= 1'b0;
        end else begin
            sync_ff1 <= async_in; 
            sync_out <= sync_ff1; 
        end
    end

endmodule
