module fsm(
    input clk, reset, W,
    output reg Z
);
    reg [1:0] state;

    always @(posedge clk) begin
        case (state)
            'b00: begin
                state <= 2'b10 ^ {1'b0, W};
                Z <= 0;
                if (W) Z <= 1;
            end
            'b01: begin
                state <= {1'b0, ~W};
                Z <= 0;
            end 
            'b10: begin
                state[W] <= ~state[W];
                Z <= 0;
                if (~W) Z <= 1;
            end
            'b11: begin
                state[W] <= 'b00;
                Z <= 0;
            end
            default: state <= state;
        endcase
        if (reset) state <= 'b00;
    end
endmodule
