module tb_all;

    reg  i0, i1, sel2,din,sel2_demux;
    reg  [1:0] SEL4,SEL_demux4,in_d2;
    reg  [2:0] SEL8,in_d3;
    reg  [3:0] I4,SEL16;
    reg  [7:0] I8,in_enc;
    reg  [15:0] I16;
    wire Y_2mux,Y_4mux,Y_8mux,Y_16mux,y1, y2;
    wire [2:0] y_encoder;
    wire [2:0] y_priority;
    wire [3:0] Y_4demux,Y_decoder2;
    wire [7:0] Y_decoder3;

    mux_2to1 u_mux2 (.i0(i0), .i1(i1), .sel(sel2), .Y_2mux(Y_2mux));
    mux_4to1 u_mux4 (.I(I4), .SEL(SEL4), .Y_4mux(Y_4mux));
    mux_8to1 u_mux8 (.I(I8), .SEL(SEL8), .Y_8mux(Y_8mux));
    mux_16to1 u_mux16 (.I(I16), .SEL(SEL16), .Y_16mux(Y_16mux));

    demux_1to2 u_demux2 (.i(din), .sel(sel2_demux), .y1(y1), .y2(y2));
    demux_1to4 u_demux4 (.i(din), .SEL(SEL_demux4), .Y_4demux(Y_4demux));

    decoder_2to4 u_dec2 (.in_d(in_d2), .Y_decoder(Y_decoder2));
    decoder_3to8 u_dec3 (.in_d(in_d3), .Y_decoder(Y_decoder3));

    encoder_8to3 u_enc (.in(in_enc), .y_encoder(y_encoder));
    priority_encoder_8to3 u_prienc (.in(in_enc), .y_encoder(y_priority));

    initial begin
        $display("=== Starting unified testbench ===");
        $monitor("time=%0t | mux2=%b mux4=%b mux8=%b mux16=%b | demux2={%b,%b} demux4=%b | dec2=%b dec3=%b | enc=%b prienc=%b",
                 $time, Y_2mux, Y_4mux, Y_8mux, Y_16mux, y1, y2, Y_4demux, Y_decoder2, Y_decoder3, y_encoder, y_priority);

      $display("=== MUX tests ===");
        i0=0; i1=1; sel2=0; #10;
        sel2=1; #10;

        I4=4'b1010; SEL4=2'b00; #10;
        SEL4=2'b01; #10;
        SEL4=2'b10; #10;
        SEL4=2'b11; #10;

        I8=8'b11001010; SEL8=3'b000; #10;
        SEL8=3'b111; #10;

        I16=16'hA55A; SEL16=4'b0000; #10;
        SEL16=4'b1111; #10;

      $display("=== DEMUX tests ===");
        din=1; sel2_demux=0; #10;
        sel2_demux=1; #10;

        SEL_demux4=2'b00; #10;
        SEL_demux4=2'b01; #10;
        SEL_demux4=2'b10; #10;
        SEL_demux4=2'b11; #10;

      $display("=== DECODER tests ===");
        in_d2=2'b00; #10;
        in_d2=2'b01; #10;
        in_d2=2'b10; #10;
        in_d2=2'b11; #10;

        in_d3=3'b000; #10;
        in_d3=3'b111; #10;

      $display("=== ENCODER tests ===");
        in_enc=8'b00000001; #10;
        in_enc=8'b00010000; #10;
        in_enc=8'b10000000; #10;

      $display("=== Priority encoder with multiple bits ===");
        in_enc=8'b10100000; #10;
        $display("=== Testbench finished ===");
        $finish;
    end
endmodule
