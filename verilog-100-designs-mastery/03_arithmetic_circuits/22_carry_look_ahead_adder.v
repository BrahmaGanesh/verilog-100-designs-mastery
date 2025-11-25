module carry_look_ahead_adder(
    input   wire  [3:0] a,
    input   wire  [3:0] b,
    input   wire        cin,
    output  wire  [3:0] Sum,
    output  wire        Carry 
);

    wire [3:0] P;
    wire [3:0] G;
    wire c1,c2,c3,c4;

    assign P[0] = a[0] ^ b[0];
    assign P[1] = a[1] ^ b[1];
    assign P[2] = a[2] ^ b[2];
    assign P[3] = a[3] ^ b[3];
    
    assign G[0] = a[0] & b[0];
    assign G[1] = a[1] & b[1];
    assign G[2] = a[2] & b[2];
    assign G[3] = a[3] & b[3];

    assign c1 = G[0] | ( P[0] & cin );
    assign c2 = G[1] | ( P[1] & c1 );
    assign c3 = G[2] | ( P[2] & c2 );
    assign c4 = G[3] | ( P[3] & c3 );

    assign Sum[0] = P[0] ^ cin; 
    assign Sum[1] = P[1] ^ c1; 
    assign Sum[2] = P[2] ^ c2; 
    assign Sum[3] = P[3] ^ c3;

    assign Carry = c4;

endmodule 
