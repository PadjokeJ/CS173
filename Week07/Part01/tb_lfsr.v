module tb_lfsr;
  reg clk, clr, set;
  
  reg [2:0] D;
  wire [2:0] Q; 

  lfsr rand(.clk(clk), .clr(clr), .set(set), .D(D), .Q(Q));

  initial begin
    $dumpfile ("_tb_lfsr.vcd");
    $dumpvars(0, tb_lfsr);
    D = 3'b001;
    
    set = 1;
    
    clr = 0;
    clk = 0;
    #20 set = 0;
    for (integer i = 0; i < 8; i = i + 1) begin
      #10 $display("Q = %d", Q);
    end
    $finish;
  end

  always begin
    #5 clk = ~clk;
  end
    
endmodule
