module parity_checker(
    input  wire [4-1:0] data_in,   
    input  wire         parity_bit, 
    output wire         error       
);

    assign error = (^data_in) ^ parity_bit;
    
endmodule
