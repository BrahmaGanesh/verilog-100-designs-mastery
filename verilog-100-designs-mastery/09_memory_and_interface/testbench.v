`timescale 1ns/1ps

module tb;

    reg clk, reset_n;

    reg         we_sp;
    reg  [3:0]  addr_sp;
    reg  [7:0]  din_sp;
    wire [7:0]  dout_sp;

  reg         we_a, we_b;
    reg  [3:0]  addr_a, addr_b;
    reg  [7:0]  din_a, din_b;
    wire [7:0]  dout_a, dout_b;

    reg  [3:0]  rom_addr;
    wire [7:0]  rom_out;

    reg         wr_en_s, rd_en_s;
    reg  [7:0]  din_s;
    wire [7:0]  dout_s;
    wire        full_s, empty_s;

    reg         wr_en_a, rd_en_a;
    reg  [7:0]  din_a2;
    wire [7:0]  dout_a2;
    wire        full_a2, empty_a2;

    reg wr_clk, rd_clk;

    reg         push, pop;
    reg  [7:0]  din_st;
    wire [7:0]  dout_st;
    wire        full_st, empty_st;

    reg         tx_start;
    reg  [7:0]  tx_data;
    wire        tx, busy_tx;

    reg         rx;
    wire [7:0]  rx_data;
    wire        rx_ready;

    reg         start_spi;
    reg  [7:0]  mosi_data;
    wire [7:0]  miso_data;
    wire        busy_spi;
    wire        sclk, mosi, miso, cs_n;

    reg         start_i2c;
    reg  [6:0]  slave_addr;
    reg         rw;
    reg  [7:0]  tx_data_i2c;
    wire [7:0]  rx_data_i2c;
    wire        busy_i2c;
    wire        scl;
    tri         sda;


    single_port_ram U1 (
        .clk(clk), .we(we_sp), .addr(addr_sp),
        .din(din_sp), .dout(dout_sp)
    );

    dual_port_ram U2 (
        .clk(clk),
        .we_a(we_a), .addr_a(addr_a), .din_a(din_a), .dout_a(dout_a),
        .we_b(we_b), .addr_b(addr_b), .din_b(din_b), .dout_b(dout_b)
    );

    rom_case U3 (.addr(rom_addr), .dout(rom_out));

    fifo_sync U4 (
        .clk(clk), .reset_n(reset_n),
        .wr_en(wr_en_s), .rd_en(rd_en_s),
        .din(din_s), .dout(dout_s),
        .full(full_s), .empty(empty_s)
    );

    async_fifo U5 (
        .wr_clk(wr_clk), .rd_clk(rd_clk), .reset_n(reset_n),
        .wr_en(wr_en_a), .rd_en(rd_en_a),
        .din(din_a2), .dout(dout_a2),
        .full(full_a2), .empty(empty_a2)
    );

    stack_memory U6 (
        .clk(clk), .reset_n(reset_n),
        .push(push), .pop(pop),
        .din(din_st), .dout(dout_st),
        .full(full_st), .empty(empty_st)
    );

    uart_tx U7 (
        .clk(clk), .reset_n(reset_n),
        .tx_start(tx_start), .tx_data(tx_data),
        .tx(tx), .busy(busy_tx)
    );

    uart_rx U8 (
        .clk(clk), .reset_n(reset_n),
        .rx(rx), .rx_data(rx_data), .rx_ready(rx_ready)
    );

    spi_master U9 (
        .clk(clk), .reset_n(reset_n),
        .start(start_spi), .mosi_data(mosi_data),
        .miso_data(miso_data), .busy(busy_spi),
        .sclk(sclk), .mosi(mosi), .miso(miso), .cs_n(cs_n)
    );

    assign miso = mosi;

    i2c_master U10 (
        .clk(clk), .reset_n(reset_n),
        .start(start_i2c), .slave_addr(slave_addr), .rw(rw),
        .tx_data(tx_data_i2c), .rx_data(rx_data_i2c),
        .busy(busy_i2c), .scl(scl), .sda(sda)
    );

    reg sda_slave_oe = 0;
    reg sda_slave_out = 1;
    assign sda = sda_slave_oe ? sda_slave_out : 1'bz;

    always #5 clk = ~clk;
    always #4 wr_clk = ~wr_clk;
    always #7 rd_clk = ~rd_clk;

    initial begin
        $display("\n========= MEMORY + INTERFACE TESTBENCH START =========");

        clk = 0; wr_clk = 0; rd_clk = 0;
        reset_n = 0;

        we_sp = 0; we_a = 0; we_b = 0;
        wr_en_s = 0; rd_en_s = 0;
        wr_en_a = 0; rd_en_a = 0;
        push = 0; pop = 0;
        tx_start = 0; rx = 1;
        start_spi = 0; start_i2c = 0;

        #20 reset_n = 1;

        $display("\n=== SINGLE PORT RAM ===");
        we_sp = 1; addr_sp = 2; din_sp = 8'hAA;
        #10 we_sp = 0; addr_sp = 2;

        $display("\n=== DUAL PORT RAM ===");
        we_a = 1; addr_a = 1; din_a = 8'h11;
        we_b = 1; addr_b = 2; din_b = 8'h22;
        #10 we_a = 0; we_b = 0;

        $display("\n=== ROM ===");
        rom_addr = 3;
        #10;

        $display("\n=== SYNCHRONOUS FIFO ===");
        wr_en_s = 1; din_s = 8'h55;
        #10 wr_en_s = 0; rd_en_s = 1;
        #10 rd_en_s = 0;

        $display("\n=== ASYNCHRONOUS FIFO ===");
        wr_en_a = 1; din_a2 = 8'h77;
        #20 wr_en_a = 0;
        #40 rd_en_a = 1;
        #20 rd_en_a = 0;

        $display("\n=== STACK MEMORY ===");
        push = 1; din_st = 8'h33;
        #10 push = 0;
        pop = 1;
        #10 pop = 0;

        $display("\n=== UART TX ===");
        tx_data = 8'hA5;
        tx_start = 1; #10; tx_start = 0;
        #200;

        $display("\n=== UART RX ===");
        rx = 0; #104000;
        rx = 1; #104000;

        $display("\n=== SPI MASTER ===");
        start_spi = 1; mosi_data = 8'hF0;
        #10 start_spi = 0;

        $display("\n=== I2C MASTER ===");
        start_i2c = 1; slave_addr = 7'h20; rw = 0;
        tx_data_i2c = 8'hAB;
        #10 start_i2c = 0;

        #300;
        $display("\n========= TESTBENCH FINISHED =========\n");
        $finish;
    end

endmodule
