module tb;
    reg     A,B,C,D;
    wire    Y_not,Y_and,Y_or,Y_nand,Y_nor;
    wire    Y_xor,Y_xnor,Y_buff,Y_combo,Y_nor_4;

    NOT_gate    u_not   (.A(A),     .Y_not(Y_not));
    AND_gate    u_and   (.A(A),.B(B),.Y_and(Y_and));
    OR_gate     u_or    (.A(A),.B(B),.Y_or(Y_or));
    NAND_gate   u_nand  (.A(A),.B(B),.Y_nand(Y_nand));
    NOR_gate    u_nor   (.A(A),.B(B),.Y_nor(Y_nor));
    XOR_gate    u_xor   (.A(A),.B(B),.Y_xor(Y_xor));
    XNOR_gate   u_xnor  (.A(A),.B(B),.Y_xnor(Y_xnor));
    buffer      u_buff  (.A(A),     .Y_buff(Y_buff));
    combo_2input u_comb (.A(A),.B(B),.Y_combo(Y_combo));
    NOR_4gate   u_nor4  (.A(A),.B(B),.C(C),.D(D),.Y_nor_4(Y_nor_4));

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,tb);
    end

    initial begin
        $display("-----------------------------------------------------------");
        $display("   TIME  | A B C D | NOT AND OR NAND NOR XOR XNOR BUF CMB NR4");
        $display("-----------------------------------------------------------");

        $monitor(" %4t | %b %b %b %b |  %b   %b   %b    %b    %b   %b    %b   %b   %b   %b",
                $time, A,B,C,D,Y_not, Y_and, Y_or, 
                Y_nand, Y_nor,Y_xor, Y_xnor, Y_buff, 
                Y_combo, Y_nor_4);
        
        A=0; B=0; C=0; D=0; #10;
        A=0; B=1; C=1; D=0; #10;
        A=1; B=0; C=1; D=1; #10;
        A=1; B=1; C=0; D=1; #10;
        #10;
        $finish;
    end
endmodule
