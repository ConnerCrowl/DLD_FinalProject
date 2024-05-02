module GoGoGadget (clk, fsmReset, randSwitch, startSwitch, seed, gridOut);

input logic clk;
input logic randSwitch;
input logic startSwitch;
input logic fsmReset;
input logic [63:0] seed;

output logic [63:0] gridOut;

logic [63:0] shift_seed;

logic flopreset;
logic giveSeed;
logic start;
logic showgridOut;

fsm FStevenM (clk, fsmreset, randSwitch, startSwitch, flopreset, giveSeed, start, showShift_seed);

lfsr64 shevifted (seed, clk, giveSeed, shift_seed);

Game geeven (clk, shift_seed, showShift_seed, start, flopreset, gridOut);

endmodule
