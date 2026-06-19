module mux4to1 (
    input a, b, c, d, w, z,
    output reg f
);
    always @(*) begin
        case ({z,w})
            2'b00 : f = a;
            2'b01 : f = b;
            2'b10 : f = c;
            2'b11 : f = d; 
            default : ;
        endcase
    end
endmodule

module abc4to1mux (
    input a, b, c, w, z,
    output f
);
    reg d;

    reg _nor;
    reg _and;
    reg _or;

    mux4to1 _mux4to1 (.a(_nor), .b(_and), .c(_or), .d(d), .w(w), .z(z), .f(f));

    always @(*) begin
        d = 1'b1;
        _nor = ~(a | b);
        _and = b & c;
        _or  = a | c;
    end
endmodule