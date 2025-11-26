module tb;

    reg  A1, B1, pbit;
    reg  [1:0] A2, B2;
    reg  [3:0] A4, B4, din4;
    reg  [7:0] a8, b8, oa, ob, osum;
    wire       gt8, lt8, eq8, eq_out,is_zero,uov, sov;
    wire eq1, lt1, gt1;
    wire eq2, lt2, gt2;
    wire eq4, lt4, gt4;
    wire odd_p, even_p, perror;

    bit_comparator_1 u1 (.A(A1), .B(B1), .Y_equal(eq1), .Y_less(lt1), .Y_greater(gt1));
    bit_comparator_2 u2 (.a(A2), .b(B2), .Y_equal(eq2), .Y_less(lt2), .Y_greater(gt2));
    bit_comparator_2 u4 (.a(A4), .b(B4), .Y_equal(eq4), .Y_less(lt4), .Y_greater(gt4));

    odd_parity_generator  up1 (.data_in(din4), .parity_out(odd_p));
    even_parity_generator up2 (.data_in(din4), .parity_out(even_p));
    parity_checker        up3 (.data_in(din4), .parity_bit(pbit), .error(perror));

    magnitude_comparator #(8) ucmp (.a(a8), .b(b8), .Y_greater(gt8), .Y_less(lt8), .Y_equal(eq8));
    equality_comparator  #(8) ueq  (.a(a8), .b(b8), .eq(eq_out));
    zero_detector        #(8) uz   (.a(a8), .is_zero(is_zero));

    overflow_detector #(8) uovf (
        .a(oa), .b(ob), .sum(osum),
        .unsigned_overflow(uov),
        .signed_overflow(sov)
    );


    initial begin
        $monitor("time=%0t | 1bit:{eq=%b lt=%b gt=%b} | 2bit:{eq=%b lt=%b gt=%b} | 4bit:{eq=%b lt=%b gt=%b} | odd=%b even=%b pchk=%b | mag:{gt=%b lt=%b eq=%b} | eq8=%b zero=%b | uov=%b sov=%b",
                 $time, eq1, lt1, gt1, eq2, lt2, gt2, eq4, lt4, gt4,
                 odd_p, even_p, perror, gt8, lt8, eq8, eq_out, is_zero, uov, sov);

        $display("=== Starting comparator + parity + detector testbench ===");

        $display("=== 1-BIT COMPARATOR ===");
        A1=0; B1=0; #10;
        A1=0; B1=1; #10;
        A1=1; B1=0; #10;
        A1=1; B1=1; #10;

        $display("=== 2-BIT COMPARATOR ===");
        A2=2; B2=1; #10;
        A2=3; B2=3; #10;
        A2=1; B2=2; #10;

        $display("=== 4-BIT COMPARATOR ===");
        A4=4'd9; B4=4'd3; #10;
        A4=4'd7; B4=4'd7; #10;

        $display("=== PARITY GENERATORS / CHECKER ===");
        din4 = 4'b1010; pbit = ^din4; #10;
        din4 = 4'b1111; pbit = ^din4; #10;

        $display("=== 8-BIT MAGNITUDE & EQUALITY & ZERO DETECTOR ===");
        a8=10; b8=20; #10;
        a8=20; b8=20; #10;
        a8=0;  b8=5;  #10;

        $display("=== OVERFLOW DETECTOR ===");
        oa=8'd200; ob=8'd100; osum=oa+ob; #10;
        oa=8'd120; ob=8'd120; osum=oa+ob; #10;
        oa=8'sd100; ob=8'sd50;  osum=oa+ob; #10;
        oa = 8'sd100; ob = 8'sd40; osum = -8'sd120;

        $display("=== Testbench Finished ===");
        $finish;
    end

endmodule
