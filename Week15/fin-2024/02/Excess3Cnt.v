module Excess3Cnt(
  input clk,
  input [3:0] CIN,
  input EN,
  input INIT,
  input LOAD,
  output reg [3:0] COUT
);
  always @(posedge clk) begin
    if (INIT) begin
      COUT <= 4'b0011;
    end else if (LOAD) begin
      COUT <= CIN + 4'b0011;
    end else if (EN) begin
      if (COUT == 4'b1100) begin
        COUT <= 4'b0011;
      end else begin 
        COUT <= COUT + 4'b0001;
      end
    end
  end
endmodule

