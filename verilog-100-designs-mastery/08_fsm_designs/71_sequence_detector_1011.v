module sequence_detector_1011( 
    input wire clk, 
    input wire reset_n, 
    input wire din, 
    output reg dout 
); 

    typedef enum bit [2:0] {s0,s1,s2,s3,s4} state_t; 
    state_t state, next_state; 
    
    always @(posedge clk or negedge reset_n)begin 
        if(!reset_n) 
            state <= s0; 
        else 
            state <= next_state; 
    end 
    
    always @(*) begin 
        next_state = state; 
        case(state) 
            s0 : next_state = din ? s1 : s0; 
            s1 : next_state = din ? s1 : s2; 
            s2 : next_state = din ? s3 : s0; 
            s3 : next_state = din ? s4 : s0; 
            s4 : next_state = din ? s1 : s2; 
            default : next_state = s0; 
        endcase 
    end 
    
    always @(*) begin 
        dout = (state==s4); 
    end 

endmodule