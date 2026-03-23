module mux_2to1 (input x1, x2, s, output reg f);
  always @* begin
    if (s) 
      f = x2;
    else
      f = x1;
  end
endmodule
