/* a)

WXYZ : abcdefg
0000 : 1111110
0001 : 0110000
0010 : 1101101
0011 : 1111001
0100 : 0110011
0101 : 1011011
0110 : 1011111
0111 : 1110000
1000 : 1111111
1001 : 1111011
xxxx : 0000000

/* b)

b = ~W~X + ~WX~Y~Z + ~WXYZ + W~X~Y
b = ~W~X + ~W~Y~Z + ~WYZ + ~X~Y

c = ~W~X~Y~Z + ~W~X~YZ + ~W~XYZ + ~WX~Y~Z + ~WX~YZ + ... + W~X~YZ
c = ~W~X~Y + ~W~XYZ + ~WX + W~X~Y
c = ~X~Y(W + ~W) + ~W(~XYZ + X + ~X~Y)
c = ~X~Y + ~W(~X(YZ + ~Y) + X)
c = ~X~Y + ~W~X(YZ + ~Y) + ~WX
c = ~X~Y + ~WZ + ~WX

*/

module seven_segment_always (
    input W[3:0], output F[6:0]
);
    always @(*) begin
        case (W)
            4'b0000: F = 7'b1111110;
            4'b0001: F = 7'b0110000;
            4'b0010: F = 7'b1101101;
            4'b0011: F = 7'b1111001;
            4'b0100: F = 7'b0110011;
            4'b0101: F = 7'b1011011;
            4'b0110: F = 7'b1011111;
            4'b0111: F = 7'b1110000;
            4'b1000: F = 7'b1111111;
            4'b1001: F = 7'b1111011;
            default: F = 7'b0000000;
        endcase
    end
endmodule