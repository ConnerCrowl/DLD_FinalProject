module Game(clk, reset, lfsr_rand, seed, gridOut)

input logic clk;
input logic reset;
input logic lfsr_rand;
input logic [63:0] seed;
output logic [63:0] gridOut;

logic [63:0] shift_seed;
logic [63:0] grid;

lfsr toMux (seed, clk, reset, shift_seed);

mux2 #(64) muxxy (gridOut, shift_seed, lfsr_rand, grid);

datapath evolve (shift_seed, grid);

flop #(64) floppy (grid_evo, gridOut);


endmodule