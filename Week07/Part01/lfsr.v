module lfsr(input clk, input clr, input set, input [2:0] D, output reg [2:0] Q);
  always @(posedge clk) begin
    if (clr)
      Q <= 3'b0;
    else if (set) 
      Q <= D;
    else begin
      Q[0] <= Q[2];
      Q[1] <= Q[0] ^ Q[2];
      Q[2] <= Q[1];
    end
  end
endmodule

