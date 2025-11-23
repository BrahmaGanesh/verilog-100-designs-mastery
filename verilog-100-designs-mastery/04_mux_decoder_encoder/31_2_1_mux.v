module mux_2to1(
    input  wire  i0,
    input  wire  i1,
    input  wire  sel,
    output wire  Y_2mux 
);

    assign  Y_2mux  =   sel ? i1 : i0 ;
endmodule