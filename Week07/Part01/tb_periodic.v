module tb_periodic;
  reg clk, clr;

  wire [11:0] F;
  
  periodic_4096 pt(.clk(clk), .clr(clr), .F(F));

  initial begin
    $dumpfile ("_tb_periodic.vcd");

    $dumpvars(0, tb_periodic);
    
    clr = 1;
    clk = 0;
    #20 clr = 0;
    for (integer i = 0; i < 4100; i = i + 1) begin 
      #10 $display("F = %d", F);
    end
    $finish;
  end

  always begin
    #5 clk = ~clk;
  end
endmodule

