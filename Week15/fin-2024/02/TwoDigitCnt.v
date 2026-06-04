module TwoDigitCnt(
  input clk,
  input [3:0] DIN,
  input READ,
  input EN,
  input INIT,
  input LOAD,
  output reg [3:0] DOUT
);
  wire [7:0] COUT;
  reg TEN_EN;

  Excess3Cnt unit(.clk(clk), .CIN(DIN), .EN(EN), .INIT(INIT), .LOAD(LOAD), .COUT(COUT[3:0]));
  Excess3Cnt tens(.clk(clk), .CIN(DIN), .EN(TEN_EN), .INIT(INIT), .LOAD(LOAD), .COUT(COUT[7:4]));

  always @(*) begin
    if (COUT[3:0] == 4'b1100 && EN) begin
      TEN_EN = 1'b1;
    end else begin
      TEN_EN = 1'b0;
    end

    if (READ) begin
      DOUT = COUT[7:4];
    end else begin
      DOUT = COUT[3:0];
    end
  end
endmodule

