`timescale 1ns / 1ps
module tb ();

   logic [63:0] seed;
   logic [63:0] gridOut;
   logic       clk;
   logic       reset;
   logic       lfsr_rand;

   
  // instantiate device under test
   Game duck (clk, reset, seed, gridOut);

   // 20 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end

   initial
     begin
	#0  reset = 1'b1;
	#0  lfsr_rand = 1'b0;
	#0  seed = 64'b0;          
	#22 reset = 1'b0;
	#71 lfsr_rand = 1'b1;		
     end

   
endmodule
