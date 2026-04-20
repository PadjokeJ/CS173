module mux4to1(input a, b, c, d, w, z, output reg f);
  always @(*) begin
    case ({z, w})
      2'b00: f = a;
      2'b01: f = b;
      2'b10: f = c;
      2'b11: f = d;

      default: f = 0;
    endcase
  end
endmodule

module mux(input a, b, c, w, z, output f);
  mux4to1 m(.a(~(a | b)), .b(b & c), .c(a | c), .d(1'b1), .f(f));
endmodule
