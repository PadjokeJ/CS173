module triangle_counter(input clk, input reset, output reg [1:0] s);
  reg d;

  always @(negedge reset) begin
    s <= 0;
    d <= 0;
  end

  always @(posedge clk or negedge reset) begin
    if (!reset) begin
      s <= 0;
      d <= 0;
    end else begin
      d <= (d & s[1]) | (~d & (s == 2'b10));

      s[0] <= ~s[0] | ((s == 2'b10) & d);
      s[1] <= s[0] ^ (d ^ s[1]);
    end
  end
endmodule
