module tb_counter_mod6;
  reg clk, clr, enable, reset;

  wire [2:0] X;

  counter_mod6 counter(.clk(clk), .reset(reset), .enable(enable), .X(X));

  initial begin
    $dumpfile("_tb_countermod6.vcd");
    $dumpvars(0, tb_counter_mod6);

    enable = 0;
    clr = 0;
    clk = 0;
    reset = 1;
    
    #10;
    reset = 0;
    #10;
    enable = 1;
    for (integer i = 0; i < 7; i = i + 1) begin
      #10 $display("X = %d", X);
    end

    enable = 0;
    #10;

    reset = 1;
    $finish;
  end

  always begin
    #5 clk = ~clk;
  end
endmodule
