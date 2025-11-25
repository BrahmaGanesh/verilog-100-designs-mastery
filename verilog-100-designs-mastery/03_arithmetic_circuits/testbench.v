module tb;

    reg A, B, Cin;
    reg [3:0] a4, b4;
    reg [7:0] a8, b8;
    reg [3:0] sel;
    reg [2:0] shift;
    reg clk, rst, enable;
    reg [3:0] a4_mul, b4_mul;

    wire [3:0] rc_sum, cla_sum;
    wire rc_carry, cla_carry;

    wire [7:0] mul4_product;
    wire [15:0] booth_product;
    wire [15:0] array_product;

    wire [7:0] csa_sum, csa_carry;
    wire [8:0] final_csa_sum;

    wire [7:0] sh_left, sh_right;

    reg [3:0] op;
    wire [7:0] alu_result;
    wire alu_carry;

    wire [23:0] mac_acc;

    ripple_carry_adder u1 (.a(a4), .b(b4), .cin(Cin), .Sum(rc_sum), .Carry(rc_carry));
    carry_look_ahead_adder u2 (.a(a4), .b(b4), .cin(Cin), .Sum(cla_sum), .Carry(cla_carry));

    multiplier_4bit u3 (.a(a4_mul), .b(b4_mul), .product(mul4_product));
    booth_multiplier u4 (.multiplicand(a8), .multiplier(b8), .product(booth_product));
    array_multiplier u5 (.a(a8), .b(b8), .product(array_product));

    carry_save_adder u6 (.a(a8), .b(b8), .c(8'h0), .sum(csa_sum), .carry(csa_carry));
    csa_final_adder u7 (.a(a8), .b(b8), .c(8'h0), .final_sum(final_csa_sum));

    barrel_shifter_left  u8 (.data(a8), .shift(shift), .out(sh_left));
    barrel_shifter_right u9 (.data(a8), .shift(shift), .out(sh_right));

    arithmetic_logic_unit u10 (.a(a8), .b(b8), .opcode(op), .result(alu_result), .carry(alu_carry));

    mac u11 (.clk(clk), .rst(rst), .enable(enable), .a(a8), .b(b8), .acc(mac_acc));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("\n==================== RIPPLE CARRY ADDER ====================");
        a4 = 4'b1010; b4 = 4'b0101; Cin = 0; #10;
        $display("a=%b b=%b cin=%0d => Sum=%b Carry=%0d", a4, b4, Cin, rc_sum, rc_carry);

        $display("\n==================== CARRY LOOK AHEAD ADDER ====================");
        a4 = 4'b1100; b4 = 4'b0011; Cin = 1; #10;
        $display("a=%b b=%b cin=%0d => Sum=%b Carry=%0d", a4, b4, Cin, cla_sum, cla_carry);

        $display("\n==================== MULTIPLIER (4 BIT) ====================");
        a4_mul = 4'b1010; b4_mul = 4'b0011; #10;
        $display("a=%b b=%b => product=%b", a4_mul, b4_mul, mul4_product);

        $display("\n==================== BOOTH MULTIPLIER ====================");
        a8 = -8'd5; b8 = 8'd7; #10;
        $display("a=%0d b=%0d => product=%0d", a8, b8, booth_product);

        $display("\n==================== ARRAY MULTIPLIER ====================");
        a8 = 8'd12; b8 = 8'd10; #10;
        $display("a=%0d b=%0d => product=%0d", a8, b8, array_product);

        $display("\n==================== CARRY SAVE ADDER ====================");
        a8 = 8'd15; b8 = 8'd10; #10;
        $display("a=%0d b=%0d => sum_bits=%b carry_bits=%b", a8, b8, csa_sum, csa_carry);

        $display("\n==================== FINAL CSA ADDER ====================");
        $display("Final_sum = %0d", final_csa_sum);

        $display("\n==================== BARREL SHIFTER LEFT ====================");
        a8 = 8'b10110011; shift = 3; #10;
        $display("data=%b shift=%0d => out=%b", a8, shift, sh_left);

        $display("\n==================== BARREL SHIFTER RIGHT ====================");
        a8 = 8'b10110011; shift = 2; #10;
        $display("data=%b shift=%0d => out=%b", a8, shift, sh_right);

        $display("\n==================== ALU ====================");
        a8 = 8'd25; b8 = 8'd10;

        op = 4'b0000; #10; $display("ADD => %0d", alu_result);
        op = 4'b0001; #10; $display("SUB => %0d", alu_result);
        op = 4'b0010; #10; $display("AND => %0d", alu_result);
        op = 4'b0011; #10; $display("OR  => %0d", alu_result);
        op = 4'b0100; #10; $display("XOR => %0d", alu_result);
        op = 4'b0101; #10; $display("NOT => %0d", alu_result);

        $display("\n==================== MAC ====================");
        rst = 1; enable = 0; #10;
        rst = 0; enable = 1;
        
        a8 = 8'd3; b8 = 8'd4; #10;
        a8 = 8'd2; b8 = 8'd5; #10;
        a8 = 8'd1; b8 = 8'd7; #10;

        $display("MAC Accumulator = %0d", mac_acc);

        $finish;
    end
endmodule
