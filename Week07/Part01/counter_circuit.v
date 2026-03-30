module single_counter(input clk, input load, input Enable, input [3:0] D, output reg [3:0] X);
  always @(posedge clk) begin
    if (load)
      X <= D;
    else if (Enable) 
      X <= X + 1;
  end
endmodule

module counter_circuit(input clk, input clr, output reg [3:0] X, output reg [3:0] Y);
  wire w1, w2, w3, w4;

  assign w3 = (X == 4'h9);
  assign w4 = (Y == 4'h9) & w3;

  assign w1 = clr | w3;
  assign w2 = clr | w4;

  wire [3:0] wX, wY;
  
  single_counter c0 (.clk(clk), .load(w1), .Enable(1'b1), .D(4'h0), .X(wX));
  single_counter c1 (.clk(clk), .load(w2), .Enable(w3)  , .D(4'h0), .X(wY));

  always @(*) begin
    X = wX;
    Y = wY;
  end
endmodule

