module MainMux (shift_seed, gridOut, start, grid); 
  input logic [63:0] shift_seed;
  input logic [63:0] gridOut;
  input logic start;
  output logic [63:0] grid;

  assign grid[63:0] = start ? shift_seed[63:0] : gridOut[63:0]; 

endmodule