module washing_machine(
    input  wire clk,
    input  wire reset_n,
    input  wire start,       
    output reg  fill_valve,  
    output reg  motor_wash,  
    output reg  motor_spin,  
    output reg  done         
);

    typedef enum logic [2:0] {IDLE, FILL, WASH, RINSE, SPIN, DONE} state_t;
    state_t state, next_state;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE:   next_state = start ? FILL : IDLE;
            FILL:   next_state = WASH;
            WASH:   next_state = RINSE;
            RINSE:  next_state = SPIN;
            SPIN:   next_state = DONE;
            DONE:   next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    always @(*) begin
        fill_valve = (state == FILL);
        motor_wash = (state == WASH || state == RINSE);
        motor_spin = (state == SPIN);
        done       = (state == DONE);
    end

endmodule
