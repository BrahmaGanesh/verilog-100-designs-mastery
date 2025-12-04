module traffic_light(
    input   wire clk,
    input   wire reset_n,
    output  reg  red,
    output  reg  green,
    output  reg  yellow
);
    reg [3:0] timer;

    typedef enum bit [1:0] {RED, GREEN, YELLOW} state_t;
    state_t state, next_state;

    always @(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            state <= RED;
            timer <= 4'd5;
        end
        else begin
            if(timer == 0) begin
                state <= next_state;
                case(next_state)
                    RED : timer <= 4'd5;
                    GREEN : timer <= 4'd3;
                    YELLOW : timer <= 4'd2;
                endcase
            end
            else
                timer <= timer - 4'd1;
        end
    end

    always @(*) begin
        next_state = state;
        case(state)
            RED : next_state = GREEN;
            GREEN : next_state = YELLOW;
            YELLOW : next_state = RED;
            default : next_state = RED;
        endcase
    end
    always @(*) begin
        red = (state==RED);
        green = (state==GREEN);
        yellow = (state==YELLOW);
    end

endmodule