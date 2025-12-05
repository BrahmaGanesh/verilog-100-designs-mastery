module stopwatch_controller(
    input   wire clk,
    input   wire reset_n,
    input   wire start,
    input   wire stop,
    input   wire clear,
    output  reg  [15:0] count
);

    typedef enum bit [1:0] {IDLE,RUN,STOP} state_t;
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
            IDLE :begin
                     if(start)
                        next_state = RUN;
                    else
                        next_state = IDLE;
                  end
            RUN  : begin
                    if(stop) next_state = STOP;
                    else if(clear) next_state = IDLE;
                    else next_state = RUN;
                   end
            STOP : begin
                    if(start) next_state = RUN;
                    else if(clear) next_state = IDLE;
                    else next_state = STOP;
                   end
            default : next_state = IDLE;
        endcase
    end

    always @(posedge clk or negedge reset_n) begin
        if(!reset_n)
            count <= 16'd0;
        else begin
            case(state)
                IDLE : count <= 16'd0;
                RUN  : count <= count + 16'b1;
                STOP : count <= count;
                default : count <= 16'd0;
            endcase
        end
    end

endmodule

            