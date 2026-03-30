module periodic_4096(input clk, output reg [11:0] F, output f);
  
  always @(posedge clk)
    F <= F + 1;

  assign f = F[11];
endmodule

