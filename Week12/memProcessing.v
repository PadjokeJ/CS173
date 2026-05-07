module memCounter #(
    parameter MEM_SIZE = 7,
    parameter MAX_ADDR = 2
) (
    input clk, Init, Inc, output reg [MAX_ADDR:0] Addr
);
    always @(posedge clk) begin
        if (Init || Addr == MEM_SIZE) Addr <= 0;

        if (Inc) Addr <= Addr + 1;
    end
endmodule

module memProcessing (
    input clock, Reset, Init, input [7:0] DataInA
);
    // memory
    parameter WORD_SIZE = 7;
    parameter COL_A = 7;
    parameter COL_B = 3;

    reg [WORD_SIZE:0] MemoryA [COL_A:0]; 
    reg [WORD_SIZE:0] MemoryB [COL_B:0];

    reg [WORD_SIZE:0] Dout1;
    reg [WORD_SIZE:0] Dout2;

    reg WEA;
    reg WEB;

    reg [WORD_SIZE:0] DataInB;

    wire [2:0] AddrA;
    wire [1:0] AddrB;

    reg IncA;
    reg IncB;

    wire comp;

    memCounter counterA(.clk(clock), .Init(Init), .Inc(IncA), .Addr(AddrA));
    memCounter #(.MEM_SIZE(3), .MAX_ADDR(1)) counterB(.clk(clock), .Init(Init), .Inc(IncB), .Addr(AddrB));

    always @(posedge clock) begin
        Dout2 <= Dout1;
    end

    always @(*) begin
        if (Dout1 < Dout2)
            DataInB <= (Dout1 + Dout2);
        else 
            DataInB <= (Dout2 - Dout1);
    end

    // functionality
    parameter READA = 2'b00;
    parameter COMP  = 2'b01;
    parameter HALT  = 2'b10;

    reg [1:0] state;

    always @(*) begin
        if (Init) begin
            state = READA;
            IncA = 0;
            IncB = 0;
        end else begin
            case (state)
                READA: begin
                    WEA = 'b1;
                    IncA = 'b1;
                    WEB = 0;
                    IncB = 0;
                    if (AddrA == 7) state <= COMP;
                end
                COMP: begin
                    WEA = 'b0;
                    IncA = 1;

                    if (AddrA[0] == 0 && !(AddrA == 0 && AddrB == 0)) begin
                        WEB = 1;
                        IncB = 1;
                    end else begin
                        WEB = 0;
                        IncB = 0;
                    end

                    if (AddrA == 0 && AddrB == 3) state <= HALT;
                end
                default: state <= HALT;
            endcase
        end
    end


endmodule