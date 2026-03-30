module periodic_4096(input clk, input clr, output reg [11:0] F);
  always @(posedge clk) begin
    if (clr)
      F <= 0;
    else
    F <= F + 1;
  end
    
endmodule

