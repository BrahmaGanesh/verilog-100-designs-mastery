module vending_machine(
    input   wire clk,
    input   wire reset_n,
    input   wire coin5,
    input   wire coin10,
    output  reg dispense
);

    typedef enum bit [1:0] {s0,s5,s10,s15} state_t;
    state_t state,next_state;

    always @(posedge clk or negedge reset_n) begin
        if(!reset_n)
            state <= s0;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case(state)
            s0 : begin
                if(coin5)
                    next_state = s5;
                else if(coin10)
                    next_state = s10;
                else
                    next_state = s0;
                end
            s5 : begin
                if(coin5)
                    next_state = s10;
                else if(coin10)
                    next_state = s15;
                else
                    next_state = s5;
                end
            s10 :  begin
                if(coin5)
                    next_state = s15;
                else if(coin10)
                    next_state = s15;
                else
                    next_state = s10;
                end
            s15 : next_state = s0;
            default : next_state = s0;
        endcase
    end

    always @(*) begin
        dispense = (state == s15);
    end
endmodule