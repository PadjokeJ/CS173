module moore_fsm (
    input clk, I, reset, output reg O
);
    parameter IDLE = 2'b00;
    parameter A = 2'b01;
    parameter B = 2'b10;

    reg [1:0] state;
    reg [3:0] clk_counter;

    always @(*) begin
        if (state == B) O = 'b1;
        else O = 'b0;
    end

    always @(posedge clk) begin
        if (reset) begin
            state = 0;
            clk_counter = 0;
        end
        if (I) begin
            case (state)
                IDLE:
                    state <= A;
                A: begin
                    if (clk_counter == 9)
                        state <= B;
                    clk_counter <= clk_counter + 1;
                end
                B: 
                    state <= IDLE;
                default:
                    state <= IDLE;
            endcase
        end
        else state <= IDLE;
    end
endmodule