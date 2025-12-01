 module D_latch(
    input   wire D,
    input   wire EN,
    output  reg  Q,
    output  wire  Q_bar   
 );

    always @(*) begin 
        if(EN)
            Q = D;
    end
    assign Q_bar = ~Q;
endmodule
