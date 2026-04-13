module TwoDigitCnt(input clk, input [3:0] DIN, input READ, input EN, input INIT, input LOAD, output reg [3:0] DOUT);
  
  wire [3:0] coutDigit;
  wire [3:0] coutTens;

  Excess3Cnt digit(.clk(clk), .CIN(DIN), .EN(EN), .LOAD(LOAD), .INIT(INIT), .COUT(coutDigit));
  Excess3Cnt tens(.clk(clk), .CIN(DIN), .EN(EN), .LOAD(LOAD), .INIT(INIT), .COUT(coutTens));

  always @(posedge clk) begin
    
  end

  always @(*) begin
    if (READ)
      DOUT <= coutTens;
    else
      DOUT <= coutDigit;
  end
endmodule
