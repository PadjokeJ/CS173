module tb_fsm;
  reg clk, reset, W;

  wire Z;

  fsm _fsm(.clk(clk), .reset(reset), .W(W), .Z(Z));

  initial begin
    $dumpfile("_tb_fsm.vcd");
    $dumpvars(0, tb_fsm);

    reset = 1;
    clk = 0;
    W = 0;
    
    #10;
    reset = 0;
    #10;
    for (integer i = 0; i < 2; i = i + 1) begin
      #10 $display("Z = %d", Z);
    end
    W = 1;
    for (integer i = 0; i < 4; i = i + 1) begin
      #10 $display("Z = %d", Z);
    end
    #10;
    reset = 1;

    #8;
    reset = 0;
    W = 0;
    #10;
    #10;
    W = 1;
    #10;
    W = 0;
    #30;

    $finish;
  end

  always begin
    #5 clk = ~clk;
  end
endmodule
