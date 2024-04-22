`timescale 1ns / 1ps
module tb ();

   logic [63:0] seed;
   logic [63:0] gridOut;
   logic       clk;
   logic       reset;

   
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
	#0  sel = 1'b0;
	#0  seed = 64'b0             
     
          ;
	#22 reset = 1'b0;
	#71 sel = 1'b1;		
     end

   
endmodule
