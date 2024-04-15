module Game(clk, reset, seed, gridOut)

input logic clk;
input logic reset;
input logic [63:0] seed;
output logic [63:0] gridOut;

logic [63:0] dadaIn;
logic [63:0] dadaOut;

datapath evolve (dadaIn, dadaOut);

mux2 #(64) muxxy (gridOut, seed, reset, dadaIn);




endmodule