module simple_bus #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 32
)(
    input  wire                  clk,
    input  wire                  reset_n,

    input  wire [ADDR_WIDTH-1:0] m_addr,
    input  wire [DATA_WIDTH-1:0] m_wdata,
    output reg  [DATA_WIDTH-1:0] m_rdata,
    input  wire                  m_we,
    input  wire                  m_valid,
    output reg                   m_ready,

    output reg  [ADDR_WIDTH-1:0] s_addr,
    output reg  [DATA_WIDTH-1:0] s_wdata,
    input  wire [DATA_WIDTH-1:0] s_rdata,
    output reg                   s_we,
    output reg                   s_valid,
    input  wire                  s_ready
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            m_ready <= 0;
            s_valid <= 0;
            s_we    <= 0;
            s_addr  <= 0;
            s_wdata <= 0;
            m_rdata <= 0;
        end else begin
            m_ready <= 0;
            s_valid <= 0;

            if (m_valid) begin
                s_addr  <= m_addr;
                s_wdata <= m_wdata;
                s_we    <= m_we;
                s_valid <= 1;

                if (s_ready) begin
                    m_ready <= 1;
                    if (!m_we) begin
                        m_rdata <= s_rdata;
                    end
                end
            end
        end
    end
endmodule
