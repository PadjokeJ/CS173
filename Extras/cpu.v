module control (
    input clk, input [6:0] opcode,
    output reg branch, memRead, memToReg, ALUOp, memWrite, ALUSrc, regWrite
);
    always @(posedge clk) begin
        case (opcode)
            7'h03: memRead <= 'b1;
            7'h13: ALUSrc <= 'b1;
            7'h23: memWrite <= 'b1;
            7'h33: ;
            7'h37: ALUSrc <= 'b1;
            7'h63: branch <= 'b1;
        endcase
    end
endmodule

module mux #(
    parameter SIZE = 32
) (
    input clk,
    input [SIZE - 1:0] a, input [SIZE - 1:0] b, input sel,
    output reg [SIZE - 1:0] mout
);
    always @(posedge clk ) begin
        if (sel) begin
            mout = b;
        end else begin
            mout = a;
        end
    end
endmodule

module registerFile (
    input clk,
    input [4:0] reg1, input [4:0] reg2, input [4:0] wreg, input [31:0] wdata, input regWrite,
    output reg [31:0] dat1, output reg [31:0] dat2
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
    input [31:0] instruction,
    output reg [31:0] generated
);
    always @(*) begin
        case (instruction[6:0])
            //7'h03: generated <= ; // I-type
            7'h13: generated <= {{21{instruction[31]}},instruction[30:20]}; // I-type
            7'h23: generated <= {{{21{instruction[31]}},instruction[31:25]},instruction[11:7]}; // S-type
            7'h33:; // R-type
            7'h37: generated <= {instruction[31:12],12'b0}; // U-type
            7'h63: generated <= {{instruction[12],instruction[7]},{instruction[30:25],instruction[11:8]},1'b0}; // B-type
        endcase
    end
endmodule

module ALU (
    input [31:0] dat1, input [31:0] dat2, input ALUControl,
    output reg zero, output reg [31:0] res
);
    always @(*) begin
        
    end
endmodule

module cpu;
    reg clk;
    
    reg [31:0] instruction;

    reg [31:0] wdata;

    //registerFile rf(.clk(clk), .reg1(instruction[19:15]), .reg2(instruction[24:20]), .wreg(instruction[11:7]), .wdata(wdata), .regWrite(cRegWrite), .dat1(), .dat2());

    always begin
        #5 clk = ~clk;
    end
endmodule
