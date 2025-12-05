`timescale 1ns/1ps

module tb;

    reg clk, reset_n;

    reg  [7:0] duty;
    wire pwm_out;

    reg  signed [15:0] x_in;
    wire signed [15:0] y_out;

    reg noisy_btn;
    wire clean_btn;

    wire clk_div4;

    reg  [7:0] A, B;
    reg  [3:0] opcode;
    wire [7:0] result;
    wire zero, carry, neg, overflow;

    reg  enable_timer;
    wire timeout;

    reg data_valid_gen, data_bit_gen;
    wire [7:0] crc_gen_out;

    reg data_valid_chk, data_bit_chk;
    wire crc_error;

    reg  [3:0] req;
    wire [3:0] grant;

    reg  [7:0]  m_addr;
    reg  [31:0] m_wdata;
    wire [31:0] m_rdata;
    reg         m_we, m_valid;
    wire        m_ready;

    reg  [31:0] slave_rdata = 32'hABCD_1234;
    wire [7:0]  s_addr;
    wire [31:0] s_wdata;
    wire        s_we, s_valid;
    reg         s_ready;


    pwm_generator #(8) U1 (
        .clk(clk), .reset_n(reset_n),
        .duty(duty), .pwm_out(pwm_out)
    );

    fir_filter #(4,16) U2 (
        .clk(clk), .reset_n(reset_n),
        .x_in(x_in), .y_out(y_out)
    );

    debouncer #(8) U3 (
        .clk(clk), .reset_n(reset_n),
        .noisy_in(noisy_btn), .clean_out(clean_btn)
    );

    clock_divider #(4) U4 (
        .clk_in(clk), .reset_n(reset_n),
        .clk_out(clk_div4)
    );

    alu_with_flags #(8) U5 (
        .A(A), .B(B), .opcode(opcode),
        .result(result),
        .zero_flag(zero),
        .carry_flag(carry),
        .negative_flag(neg),
        .overflow_flag(overflow)
    );

    timer #(16) U6 (
        .clk(clk), .reset_n(reset_n),
        .enable(enable_timer),
        .period(16'd20),
        .timeout(timeout)
    );

    crc8_generator U7 (
        .clk(clk), .reset_n(reset_n),
        .data_valid(data_valid_gen), .data_bit(data_bit_gen),
        .crc_out(crc_gen_out)
    );

    crc8_checker U8 (
        .clk(clk), .reset_n(reset_n),
        .data_valid(data_valid_chk), .data_bit(data_bit_chk),
        .error_flag(crc_error)
    );

    priority_arbiter #(4) U9 (
        .req(req), .grant(grant)
    );

    simple_bus U10 (
        .clk(clk), .reset_n(reset_n),

        .m_addr(m_addr),
        .m_wdata(m_wdata),
        .m_rdata(m_rdata),
        .m_we(m_we),
        .m_valid(m_valid),
        .m_ready(m_ready),

        .s_addr(s_addr),
        .s_wdata(s_wdata),
        .s_rdata(slave_rdata),
        .s_we(s_we),
        .s_valid(s_valid),
        .s_ready(s_ready)
    );


    always #5 clk = ~clk;


    initial begin
        $display("\n========= ADVANCED RTL BLOCKS TEST START =========");

        clk = 0;
        reset_n = 0;

        duty = 8'd100;
        x_in = 0;
        noisy_btn = 0;
        A = 0; B = 0; opcode = 0;
        enable_timer = 0;

        data_valid_gen = 0; data_bit_gen = 0;
        data_valid_chk = 0; data_bit_chk = 0;

        req = 4'b0000;

        m_addr = 0; m_wdata = 0;
        m_we = 0; m_valid = 0;
        s_ready = 1;

        #20 reset_n = 1;


        duty = 8'd50;  #100;
        duty = 8'd150; #100;

        x_in = 100; #20;
        x_in = 200; #20;
        x_in = 300; #20;
        x_in = 0;

        noisy_btn = 1; #10;
        noisy_btn = 0; #5;
        noisy_btn = 1; #200;
        noisy_btn = 0;

        A = 10; B = 20;
        opcode = 4'b0000; #20;
        opcode = 4'b0001; #20;
        opcode = 4'b0010; #20;
        opcode = 4'b0011; #20;

        enable_timer = 1; #200;
        enable_timer = 0;

        repeat(8) begin
            data_valid_gen = 1;
            data_bit_gen = $random;
            #10;
        end
        data_valid_gen = 0;

        repeat(8) begin
            data_valid_chk = 1;
            data_bit_chk = $random;
            #10;
        end
        data_valid_chk = 0;

        req = 4'b1010; #40;
        req = 4'b0100; #40;
        req = 4'b0001; #40;

        m_addr = 8'h10;
        m_wdata = 32'h11223344;
        m_we = 1; m_valid = 1; #20;
        m_valid = 0;

        #50;
        m_we = 0; m_valid = 1; #20;
        m_valid = 0;

        #300;

        $display("\n========= TEST FINISHED =========\n");
        $finish;
    end

endmodule
