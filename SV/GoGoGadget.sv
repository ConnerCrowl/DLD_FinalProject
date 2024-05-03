module GoGoGadget (clk, fsmReset, swA, swB, seed, HDMIOut);

input logic clk;
input logic swA;
input logic swB;
input logic fsmReset;
input logic [63:0] seed;

output logic [63:0] HDMIOut;

logic [63:0] shift_seed;

logic flopreset;
logic giveSeed;
logic start;
logic showgridOut;

fsm FStevenM (clk, fsmReset, swA, swB, flopreset, giveSeed, start, showgridOut);

lfsr64 shevifted (seed, clk, giveSeed, shift_seed);

Game geeven (clk, flopreset, start, shift_seed,showgridOut, HDMIOut);

endmodule
