module tb;

    reg clk, reset_n;
    reg din_1011, din_1101;
    wire dout_1011, dout_1101;

    wire red, green, yellow;

    reg coin5, coin10;
    wire dispense;

    reg [1:0] current_floor, request_floor;
    wire motor_up, motor_down, door_open;

    reg start_wm;
    wire fill_valve, motor_wash, motor_spin, done;

    reg start_sw, stop_sw, clear_sw;
    wire [15:0] count_sw;

    reg din_pwd;
    wire unlock;

    reg tx_start;
    reg [7:0] tx_data;
    wire tx, busy;

    reg rx;
    wire [7:0] rx_data;
    wire rx_ready;

    sequence_detector_1011 U1 (.clk(clk), .reset_n(reset_n),
                               .din(din_1011), .dout(dout_1011));

    sequence_detector_1101 U2 (.clk(clk), .reset_n(reset_n),
                               .din(din_1101), .dout(dout_1101));

    traffic_light U3 (.clk(clk), .reset_n(reset_n),
                      .red(red), .green(green), .yellow(yellow));

    vending_machine U4 (.clk(clk), .reset_n(reset_n),
                        .coin5(coin5), .coin10(coin10), .dispense(dispense));

    lift_controller U5 (.clk(clk), .reset_n(reset_n),
                        .current_floor(current_floor), .request_floor(request_floor),
                        .motor_up(motor_up), .motor_down(motor_down), .door_open(door_open));

    washing_machine U6 (.clk(clk), .reset_n(reset_n), .start(start_wm),
                        .fill_valve(fill_valve), .motor_wash(motor_wash),
                        .motor_spin(motor_spin), .done(done));

    stopwatch_controller U7 (.clk(clk), .reset_n(reset_n),
                             .start(start_sw), .stop(stop_sw),
                             .clear(clear_sw), .count(count_sw));

    password_door_lock U8 (.clk(clk), .reset_n(reset_n),
                            .din(din_pwd), .unlock(unlock));

    uart_tx U9 (.clk(clk), .reset_n(reset_n),
                .tx_start(tx_start), .tx_data(tx_data),
                .tx(tx), .busy(busy));

    uart_rx U10 (.clk(clk), .reset_n(reset_n),
                 .rx(rx), .rx_data(rx_data), .rx_ready(rx_ready));

    always #5 clk = ~clk;


    initial begin
        $display("\n========= MULTI-FSM & UART TESTBENCH START =========");

        clk = 0;
        reset_n = 0;

        din_1011 = 0;
        din_1101 = 0;
        coin5 = 0; coin10 = 0;
        current_floor = 0; request_floor = 0;
        start_wm = 0;
        start_sw = 0; stop_sw = 0; clear_sw = 0;
        din_pwd = 0;
        tx_start = 0; tx_data = 0;
        rx = 1;

        #20 reset_n = 1;

        $display("\n=== SEQUENCE DETECTOR 1011 ===");
        repeat(8) begin
            din_1011 = $random;
            #10;
        end

        $display("\n=== SEQUENCE DETECTOR 1101 ===");
        repeat(8) begin
            din_1101 = $random;
            #10;
        end

        $display("\n=== TRAFFIC LIGHT ===");
        #100;

        $display("\n=== VENDING MACHINE ===");
        coin5 = 1; #10; coin5 = 0;
        coin10 = 1; #10; coin10 = 0;
        coin5 = 1; #10; coin5 = 0;
        #20;

        $display("\n=== LIFT CONTROLLER ===");
        current_floor = 2; request_floor = 0; #50;
        request_floor = 2; #50;

        $display("\n=== WASHING MACHINE ===");
        start_wm = 1; #10; start_wm = 0;
        #200;

        $display("\n=== STOPWATCH ===");
        start_sw = 1; #30;
        stop_sw = 1; #10; stop_sw = 0;
        clear_sw = 1; #10; clear_sw = 0;

        $display("\n=== PASSWORD DOOR LOCK ===");

        din_pwd = 1; #10;
        din_pwd = 0; #10;
        din_pwd = 1; #10;
        din_pwd = 1; #10;
        din_pwd = 0; #10;

        $display("\n=== UART TX ===");
        tx_data = 8'hA5;
        tx_start = 1; #10; tx_start = 0;
        #200;

        $display("\n=== UART RX ===");
        rx = 0; #104000;

        repeat(8) begin
            rx = $random;
            #104000;
        end

        rx = 1; #104000;

        #50;

        $display("\n========= TESTBENCH FINISHED =========\n");
        $finish;
    end

endmodule
