module D_FF (clk, reset, set, D, Q, Q_n);
  input clk, reset, set, D;
  output reg Q, Q_n;
  always @(posedge clk) begin
    if (reset)
      Q <= 0;
    else if (set)
      Q <= 1;
    else 
      Q <= D;
  end
  always @*
    Q_n <= ~Q;

endmodule

