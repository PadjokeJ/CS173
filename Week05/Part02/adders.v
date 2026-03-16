module fulladd1(x, y, cin, s, cout);
    input x, y, cin;
    output cout, s;

    wire w1, w2, w3;

    xor(w1, x, y);
    and(w2, x, y);

    xor(s, cin, w1);
    and(w3, cin, w1);

    or(cout, w2, w3);
endmodule

module half_adder(x, y, s, cout);
    input x, y;
    output cout, s;

    xor(s, x, y);

    and(cout, x, y);
endmodule

module fulladd(x, y, cin, s, cout);
    input x, y, cin;
    output s, cout;

    wire ha1_s, ha1_c, ha2_c;

    half_adder ha1(x, y, ha1_s, ha1_c);
    half_adder ha2(cin, ha1_s, s, ha2_c);

    or(cout, ha1_c, ha2_c);
endmodule
