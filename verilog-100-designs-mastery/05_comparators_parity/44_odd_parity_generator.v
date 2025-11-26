module odd_parity_generator (
    input  wire [3:0] data_in,   
    output wire       parity_out
);

    assign parity_out = ~(^data_in);

endmodule