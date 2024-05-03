module OtherMux (shift_seed, gridOut, showgridOut, HDMIout); 
  input logic [63:0] shift_seed;
  input logic [63:0] gridOut;
  input logic [63:0] showgridOut;
  output logic [63:0] HDMIout;

  assign HDMIout[63:0] = gridOut ? showgridOut[63:0] : shift_seed [63:0]; 

endmodule