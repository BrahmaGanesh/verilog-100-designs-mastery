module tb;

  reg A,B,Cin,Bin,cin,bin,mode;
  reg [3:0] a,b,sel;
  wire f_sum,f_carry,h_sum,h_carry;
  wire f_diff,f_barrow,h_diff,h_barrow;
  wire [3:0] a_sum,s_diff,Sum;
  wire a_carry,s_barrow,Cout;
  wire [1:0] Y;
  wire A_equal_B,A_less_B,A_greater_B,valid;

  full_adder u1 (.A(A),.B(B),.Cin(Cin),.f_sum(f_sum),.f_carry(f_carry));
  half_adder u2 (.A(A),.B(B),.h_sum(h_sum),.h_carry(h_carry));
  full_subtractor u3 (.A(A),.B(B),.Bin(Bin),.f_diff(f_diff),.f_barrow(f_barrow));
  half_subtractor u4 (.A(A),.B(B),.h_diff(h_diff),.h_barrow(h_barrow));

  adder_4bit u5 (.a(a),.b(b),.cin(cin),.a_sum(a_sum),.a_carry(a_carry));
  subtractor_4bit u6 (.a(a),.b(b),.bin(bin),.s_diff(s_diff),.s_barrow(s_barrow));

  adder_subtractor_4bit u7 (.a(a),.b(b),.mode(mode),.Cin(Cin),.Sum(Sum),.Cout(Cout));
  comparator_4bit u8 (.A(a),.B(b),.A_equal_B(A_equal_B),.A_less_B(A_less_B),.A_greater_B(A_greater_B));

  priority_encoder_4bit u9 (.sel(sel),.Y(Y));
  priority_generator_4bit u10 (.sel(sel),.Y(Y),.valid(valid));

  initial begin
   $display("\n==================== FULL ADDER ====================");
    $display(" A | B | Cin || Sum | Carry ");
    $display("--------------------------------");
    A=0; B=1; Cin=0; #1;
    $display(" %0d | %0d |  %0d  ||  %0d  |  %0d", A, B, Cin, f_sum, f_carry);
    A=1; B=1; Cin=1; #10;
    $display(" %0d | %0d |  %0d  ||  %0d  |  %0d", A, B, Cin, f_sum, f_carry);


    $display("\n==================== HALF ADDER ====================");
    $display(" A | B || Sum | Carry ");
    $display("--------------------------");
    A=1; B=0; #10;
    $display(" %0d | %0d ||  %0d  |  %0d", A, B, h_sum, h_carry);


    $display("\n==================== FULL SUBTRACTOR ====================");
    $display(" A | B | Bin || Diff | Borrow ");
    $display("--------------------------------------");
    A=1; B=0; Bin=0; #10;
    $display(" %0d | %0d |  %0d  ||  %0d   |   %0d", A, B, Bin, f_diff, f_barrow);


    $display("\n==================== 4-BIT ADDER ====================");
    $display("   a    |   b    | cin ||   Sum   | Carry ");
    $display("-----------------------------------------------");
    a=4'b1010; b=4'b0101; cin=0; #10;
    $display(" %b | %b |  %0d  ||  %b  |   %0d", a, b, cin, a_sum, a_carry);


    $display("\n==================== 4-BIT SUBTRACTOR ====================");
    $display("   a    |   b    | bin ||  Diff  | Borrow ");
    $display("-----------------------------------------------");
    a=4'b1001; b=4'b0011; bin=0; #10;
    $display(" %b | %b |  %0d  ||  %b  |   %0d", a, b, bin, s_diff, s_barrow);


    $display("\n==================== ADDER-SUBTRACTOR ====================");
    $display("   a    |   b    | mode | Cin ||  Sum  | Cout ");
    $display("-----------------------------------------------");
    a=6; b=3; mode=0; Cin=0; #10;
    $display(" %b | %b |   %0d  |  %0d ||  %b |  %0d", a, b, mode, Cin, Sum, Cout);
    a=6; b=3; mode=1; Cin=1; #10;
    $display(" %b | %b |   %0d  |  %0d ||  %b |  %0d", a, b, mode, Cin, Sum, Cout);


    $display("\n==================== COMPARATOR ====================");
    $display("  A  |  B  || equal | less | greater ");
    $display("----------------------------------------------");
    a=5; b=5; #10;
    $display(" %0d | %0d ||   %0d   |  %0d   |   %0d", a, b, A_equal_B, A_less_B, A_greater_B);
    a=6; b=5; #10;
    $display(" %0d | %0d ||   %0d   |  %0d   |   %0d", a, b, A_equal_B, A_less_B, A_greater_B);


    $display("\n==================== PRIORITY ENCODER ====================");
    $display("  sel  ||  Y ");
    $display("----------------");
    sel=4'b0100; #10;
    $display("  %b || %b", sel, Y);


    $display("\n==================== PRIORITY GENERATOR ====================");
    $display("  sel  ||  Y | valid ");
    $display("-------------------------");
    sel=4'b0100; #10;
    $display("  %b || %b |   %0d", sel, Y, valid);
  end
endmodule
