module priority_arbiter #(
    parameter N = 4
)(
    input  wire [N-1:0] req,  
    output reg  [N-1:0] grant 
);

    always @(*) begin
        grant = 0; 
        if (req[0])       grant = 4'b0001;
        else if (req[1])  grant = 4'b0010;
        else if (req[2])  grant = 4'b0100;
        else if (req[3])  grant = 4'b1000;
    end
endmodule
