module Game(clk, reset, selector, seed, gridOut)

input logic clk;
input logic reset;
input logic selector;
input logic [63:0] seed;
output logic [63:0] gridOut;

logic [63:0] dadaIn;
logic [63:0] dadaOut;

datapath evolve (dadaIn, dadaOut);

mux2 #(64) muxxy (gridOut, seed, selector, dadaIn);

flop #(64) floppy (dadaOut, gridOut);


endmodule