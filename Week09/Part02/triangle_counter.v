module triangle_counter (
    input clk, reset, output reg [1:0] s
);
    reg d;
    always @(posedge clk) begin
        if (s == 'b11 && d)
            d <= ~d;
        else if (s == 0 && !d) 
            d <= ~d;
        if (d)
            s <= s + 1;
        else 
            s <= s - 1;
    end
    always @(*) begin
        if (reset) begin
            d <= 0;
            s <= 0;
        end
    end
endmodule
