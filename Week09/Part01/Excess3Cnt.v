  module Excess3Cnt(input clk, input [3:0] CIN, input EN, input LOAD, input INIT, output reg [3:0] COUT);
  always @(posedge clk) begin
    if (INIT) 
      COUT <= 3;
    else if (LOAD)
      COUT <= CIN + 3;
    else if (EN)
      COUT <= COUT + 1;
  end
endmodule
