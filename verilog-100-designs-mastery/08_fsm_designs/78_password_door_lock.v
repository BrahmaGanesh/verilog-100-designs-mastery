module password_door_lock(
    input   wire clk,
    input   wire reset_n,
    input   wire din,
    output  reg  unlock
);

    typedef enum bit [2:0] {IDLE,s1,s2,s3,UNLOCK} state_t;
    state_t state, next_state;

    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) 
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case(state)
            IDLE    : next_state = din ? s1 : IDLE;
            s1      : next_state = din ? s1 : s2;
            s2      : next_state = din ? s3 : IDLE;
            s3      : next_state = din ? UNLOCK : IDLE;
            UNLOCK  : next_state = IDLE;
            default : next_state = IDLE;
        endcase
    end

    always @(*) begin
        unlock = (state == UNLOCK);
    end

endmodule