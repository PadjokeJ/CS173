module counter_mod6(input clk, input reset, input enable, output reg [2:0] X);
  always @(posedge clk) begin
    if (enable) begin
      if (X == 5)
        X <= 0;
      else
        X <= X + 1;
    end
    if (reset)
      X <= 0;
  end
endmodule

