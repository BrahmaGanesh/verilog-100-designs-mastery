module demux_1to2(
    input  wire i,
    input  wire sel,
    output wire y1,
    output wire y2
);

    assign  y1  =   ~sel & i;
    assign  y2  =   sel &  i;
endmodule