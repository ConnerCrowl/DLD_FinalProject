`timescale 1ns / 1ps
module MainFlop (clk, flopreset, grid_evo, gridOut);
  input  logic  clk, flopreset;
  input  logic [63:0] grid_evo;
  output logic [63:0] gridOut;

  always_ff @(posedge clk)
    if (flopreset) gridOut[63:0] <= #1 0;
    else       gridOut[63:0] <= #1 grid_evo[63:0];
endmodule