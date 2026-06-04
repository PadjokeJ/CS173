module FSM(
  input clk,
  input [1:0] in,
  input reset,
  output reg out
);
  parameter A = 2'b00;
  parameter B = 2'b01;
  parameter C = 2'b10;
  parameter D = 2'b11;

  reg [1:0] state;

  always @(posedge clk) begin
    case (state)
       A: begin
        case (in)
          2'b01: state <= B;
          2'b10: state <= B;
          2'b11: state <= C;
        endcase
      end
      B: begin
        case (in)
          2'b01: state <= C;
          2'b10: state <= C;
          2'b11: state <= D;
        endcase
      end
      C: begin
        case (in)
          2'b01: state <= D;
          2'b10: state <= D;
          2'b11: state <= A;
        endcase
      end
      D: begin
        case (in)
          2'b01: state <= A;
          2'b10: state <= A;
          2'b11: state <= B;
        endcase
      end
    endcase
  end

  always @(negedge reset) begin
    state = A;
  end

  always @(*) begin
    out = (state == A) ? 1'b1 : 1'b0;
  end
endmodule

