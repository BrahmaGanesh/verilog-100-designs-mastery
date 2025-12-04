module lift_controller(
    input  wire clk,
    input  wire reset_n,
    input  wire [1:0] current_floor, 
    input  wire [1:0] request_floor, 
    output reg  motor_up,
    output reg  motor_down,
    output reg  door_open
);

    typedef enum logic [1:0] {IDLE, MOVE_UP, MOVE_DOWN, OPEN_DOOR} state_t;
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
            IDLE: begin
                if (request_floor > current_floor)
                    next_state = MOVE_UP;
                else if (request_floor < current_floor)
                    next_state = MOVE_DOWN;
                else
                    next_state = OPEN_DOOR;
            end
            MOVE_UP: begin
                if (current_floor == request_floor)
                    next_state = OPEN_DOOR;
                else
                    next_state = MOVE_UP;
            end
            MOVE_DOWN: begin
                if (current_floor == request_floor)
                    next_state = OPEN_DOOR;
                else
                    next_state = MOVE_DOWN;
            end
            OPEN_DOOR: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    always @(*) begin
        motor_up   = (state == MOVE_UP);
        motor_down = (state == MOVE_DOWN);
        door_open  = (state == OPEN_DOOR);
    end

endmodule
