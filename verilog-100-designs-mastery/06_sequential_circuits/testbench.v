module tb;

    reg clk, reset_n;
    reg S, R, D_l, EN, J, K, D_ff;
    reg T, signal_pd, signal_ed, signal_st, out_st, async_in;
    wire Q_sr, Qb_sr, Q_dl, Qb_dl, Q_jk, Qb_jk;
    wire Q_dff, Qb_dff, Q_tff, Qb_tff, Q_ms, Qb_ms;
    wire pulse_out, rise_pulse, fall_pulse, sync_out;


    sr_latch          u1 (.S(S), .R(R), .Q(Q_sr), .Q_bar(Qb_sr));
    D_latch           u2 (.D(D_l), .EN(EN), .Q(Q_dl), .Q_bar(Qb_dl));
    jk_flip_flop      u3 (.J(J), .K(K), .clk(clk), .reset_n(reset_n), .Q(Q_jk), .Q_bar(Qb_jk));
    D_flip_flop       u4 (.D(D_ff), .clk(clk), .reset_n(reset_n), .Q(Q_dff), .Q_bar(Qb_dff));
    T_flip_flop       u5 (.T(T), .clk(clk), .reset_n(reset_n), .Q(Q_tff), .Q_bar(Qb_tff));
    master_slave_jk_ff u6 (.J(J), .K(K), .clk(clk), .reset_n(reset_n), .Q(Q_ms), .Q_bar(Qb_ms));
    pulse_detector    u7 (.clk(clk), .reset_n(reset_n), .signal_in(signal_pd), .pulse_out(pulse_out));
    edge_detector     u8 (.clk(clk), .reset_n(reset_n), .signal_in(signal_ed), .rising_edge_pulse(rise_pulse), .falling_edge_pulse(fall_pulse));
    schmitt_trigger   u9 (.clk(clk), .reset_n(reset_n), .signal_in(signal_st), .signal_out(out_st));
    two_ff_synchronizer u10 (.clk(clk), .reset_n(reset_n), .async_in(async_in), .sync_out(sync_out));


    always #5 clk = ~clk;


    initial begin
        $monitor("t=%0t | SR=%b%b -> Q=%b | D_L=%b EN=%b -> Q=%b | JK=%b%b Q=%b | DFF=%b Q=%b | TFF=%b Q=%b | MS_JK=%b%b Q=%b | PD=%b pulse=%b | ED=%b rise=%b fall=%b | ST=%b out=%b | async=%b sync=%b",
                 $time, S, R, Q_sr,
                 D_l, EN, Q_dl,
                 J, K, Q_jk,
                 D_ff, Q_dff,
                 T, Q_tff,
                 J, K, Q_ms,
                 signal_pd, pulse_out,
                 signal_ed, rise_pulse, fall_pulse,
                 signal_st, out_st,
                 async_in, sync_out);

        clk = 0;
        reset_n = 0;
        S=0; R=0;
        D_l=0; EN=0;
        J=0; K=0;
        D_ff=0;
        T=0;
        signal_pd=0;
        signal_ed=0;
        signal_st=0;
        async_in=0;

        $display("=== Sequential Logic Testbench Start ===");
        #20 reset_n = 1;

        $display("=== SR LATCH ===");
        S=1; R=0; #10;
        S=0; R=1; #10;
        S=1; R=1; #10;
        S=0; R=0; #10;

        $display("=== D LATCH ===");
        EN=1; D_l=1; #10;
        D_l=0; #10;
        EN=0; D_l=1; #10;

        $display("=== JK FLIP-FLOP ===");
        J=1; K=0; #20;
        J=0; K=1; #20;
        J=1; K=1; #20;

        $display("=== D FF ===");
        D_ff=1; #20;
        D_ff=0; #20;

        $display("=== T FF ===");
        T=1; #40;
        T=0; #20;

        $display("=== MASTER-SLAVE JK FF ===");
        J=1; K=0; #20;
        J=0; K=1; #20;
        J=1; K=1; #20;

        $display("=== PULSE DETECTOR ===");
        signal_pd=1; #10;
        signal_pd=0; #20;

        $display("=== EDGE DETECTOR ===");
        signal_ed=1; #20;
        signal_ed=0; #20;

        $display("=== SCHMITT TRIGGER ===");
        signal_st=1; #20;
        signal_st=0; #20;

        $display("=== TWO FF SYNCHRONIZER ===");
        async_in=1; #15;
        async_in=0; #20;

        $display("=== Testbench Finished ===");
        $finish;
    end

endmodule
