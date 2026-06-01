module control (
    input clk,
    input [6:0] opcode,
    output branch, memRead, memToReg, ALUOp, memWrite, ALUSrc, regWrite
);
    @always @(posedge clk ) begin
        case (opcode)
            7'h03: memRead = 'b1;
            7'h13: ALUSrc = 'b1;
            7'h23: memWrite = 'b1;
            7'h33: ;
            7'h37: ALUSrc = 'b1;
            7'h63: branch = 'b1;
        endcase
    end
endmodule

module mux #(
    parameter SIZE = 32;
) (
    input clk,
    input a[SIZE - 1:0], b[SIZE - 1:0], sel,
    output out[SIZE - 1:0]
);
    always @(posedge clk ) begin
        if (sel) begin
            out = b;
        end else begin
            out = a;
        end
    end
endmodule

module registerFile (
    input clk,
    input reg1[4:0], reg2[4:0], wreg[4:0], wdata[31:0], regWrite,
    output dat1[31:0], dat2[31:0]
);
    reg [31:0] file [0:31];
    always @(posedge clk) begin
        if (regWrite) begin
            file[wreg] <= wdata;
        end
        dat1 <= file[reg1];
        dat2 <= file[reg2];
    end
endmodule

module immGen (
    input instruction[31:0],
    output generated[31:0]
);
    
endmodule
