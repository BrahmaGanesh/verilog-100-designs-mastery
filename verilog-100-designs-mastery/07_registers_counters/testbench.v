module tb;

    reg clk, reset_n;
    reg  [3:0] data_in;
    reg  [1:0] sel;
    reg  dir, load, data_in_sipo, en_ring, en_johnson;
    wire [3:0] data_out_usr, data_out_piso, data_out_sipo, data_out_pipo;
    wire q_ring, q_bar_ring;
    wire [3:0] ring_count, johnson_coun;
    wire [3:0] up_count, down_count, up_down_count, mod10_count;
    wire q_johnson, q_bar_johnson;

 

    universal_shift_register U1 (.data_in(data_in), .sel(sel), .clk(clk),
                                 .reset_n(reset_n), .data_out(data_out_usr));

    piso_register U2 (.clk(clk), .reset_n(reset_n), .data_in(data_in),
                      .load(load), .data_out(data_out_piso));

    sipo_register U3 (.clk(clk), .reset_n(reset_n), .data_in(data_in_sipo),
                      .data_out(data_out_sipo));

    ring_counter U4 (.clk(clk), .reset_n(reset_n), .en(en_ring),
                     .count(ring_count), .Q(q_ring), .Q_bar(q_bar_ring));

    johnson_counter U5 (.clk(clk), .reset_n(reset_n), .en(en_johnson),
                        .count(johnson_count), .Q(q_johnson), .Q_bar(q_bar_johnson));

    pipo_register U6 (.clk(clk), .reset_n(reset_n),
                      .data_in(data_in), .data_out(data_out_pipo));

    up_counter U7 (.clk(clk), .reset_n(reset_n), .count(up_count));

    down_counter U8 (.clk(clk), .reset_n(reset_n), .count(down_count));

    up_down_counter U9 (.clk(clk), .reset_n(reset_n),
                        .dir(dir), .count(up_down_count));

    mod_10_counter U10 (.clk(clk), .reset_n(reset_n), .count(mod10_count));


    always #5 clk = ~clk;


    initial begin
        $display("\n===== REGISTER & COUNTER TESTBENCH START =====");

        clk = 0;
        reset_n = 0;
        data_in = 4'b1010;
        sel = 2'b00;
        load = 0;
        data_in_sipo = 0;
        en_ring = 0;
        en_johnson = 0;
        dir = 0;

        #20 reset_n = 1;

        $display("=== UNIVERSAL SHIFT REGISTER ===");
        sel = 2'b11; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b00; #10;

        $display("=== PISO REGISTER ===");
        load = 1; #10;
        load = 0; #40;

        $display("=== SIPO REGISTER ===");
        repeat(4) begin
            data_in_sipo = $random;
            #10;
        end

        $display("=== RING COUNTER ===");
        en_ring = 1; #80;

        $display("=== JOHNSON COUNTER ===");
        en_johnson = 1; #80;

        $display("=== UP-DOWN COUNTER ===");
        dir = 1; #50;
        dir = 0; #50;

        $display("\n===== TESTBENCH FINISHED =====\n");
        #50 $finish;
    end

endmodule
