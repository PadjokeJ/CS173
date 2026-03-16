module my_circ(
    input a, input b, input c,
    output f
);
    wire w1, w2, w3, not_a, not_b;
    not(not_a, a);
    not(not_b, b);

    and(w1, not_a, b);
    and(w2, not_b, c);

    or(w3, w1, w2);
    not(f, w3);
endmodule