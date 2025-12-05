module i2c_master #(
    parameter CLK_FREQ = 50000000, 
    parameter I2C_FREQ = 100000    
)(
    input  wire clk,
    input  wire reset_n,
    input  wire start,             
    input  wire [6:0] slave_addr,  
    input  wire rw,                
    input  wire [7:0] tx_data,     
    output reg  [7:0] rx_data,     
    output reg  busy,
    output reg  scl,
    inout  wire sda
);

    localparam integer DIV = CLK_FREQ / (2*I2C_FREQ);

    reg [15:0] clk_cnt;
    reg [3:0]  bit_idx;
    reg [7:0]  shift_reg;
    reg        sda_out, sda_oe;

    assign sda = sda_oe ? sda_out : 1'bz;

    typedef enum logic [2:0] {IDLE, START, ADDR, DATA, STOP} state_t;
    state_t state, next_state;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) state <= IDLE;
        else state <= next_state;
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            clk_cnt <= 0;
            scl <= 1;
        end else if (busy) begin
            if (clk_cnt == DIV-1) begin
                clk_cnt <= 0;
                scl <= ~scl;
            end else begin
                clk_cnt <= clk_cnt + 1;
            end
        end else begin
            scl <= 1;
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE:   if (start) next_state = START;
            START:  next_state = ADDR;
            ADDR:   if (bit_idx == 8) next_state = DATA;
            DATA:   if (bit_idx == 8) next_state = STOP;
            STOP:   next_state = IDLE;
        endcase
    end

    always @(posedge scl or negedge reset_n) begin
        if (!reset_n) begin
            bit_idx   <= 0;
            shift_reg <= 0;
            sda_out   <= 1;
            sda_oe    <= 0;
            busy      <= 0;
        end else begin
            case (state)
                IDLE: begin
                    busy <= 0;
                    sda_out <= 1;
                    sda_oe  <= 0;
                end
                START: begin
                    busy <= 1;
                    sda_out <= 0;
                    sda_oe  <= 1;
                    bit_idx <= 0;
                    shift_reg <= {slave_addr, rw};
                end
                ADDR: begin
                    sda_out <= shift_reg[7];
                    shift_reg <= {shift_reg[6:0], 1'b0};
                    bit_idx <= bit_idx + 1;
                end
                DATA: begin
                    if (!rw) begin
                        sda_out <= tx_data[7-bit_idx];
                        bit_idx <= bit_idx + 1;
                    end else begin
                        rx_data[7-bit_idx] <= sda;
                        bit_idx <= bit_idx + 1;
                    end
                end
                STOP: begin
                    sda_out <= 1;
                    sda_oe  <= 1;
                    busy <= 0;
                end
            endcase
        end
    end

endmodule
