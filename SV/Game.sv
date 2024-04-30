module Game(clk, flopreset, start, shift_seed, gridOut);

input  logic clk;
input  logic flopreset;
input  logic start;
input  logic [63:0] shift_seed;
output logic  [63:0] gridOut;


logic [63:0] grid;
logic [63:0] grid_evo;

//lfsr toMux (seed, clk, reset, shift_seed);

//mux2 #(64) muxxy (gridOut, shift_seed, start, grid);

MainMux muxxy (shift_seed, gridOut, start, grid);

datapath evolve (grid, grid_evo);

//flop #(64) floppy (grid_evo, gridOut);

MainFlop floppy (clk, flopreset, grid_evo, gridOut);

endmodule