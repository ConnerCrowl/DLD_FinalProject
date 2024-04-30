// testbench to prove maximal LFSR
module tb ();


   //logic variables to route input and output to DUT
  integer handle3;
  integer desc3;
   // instantiate device under test (small LFSR)
  logic[64:0]seed;
  logic clk;
  logic reset;
  logic[64:0]shift_seed;
   //create file handles to write results to a file
  lfsr16 dut (seed,clk,reset,shift_seed);   
   
   //set up a clock signal
   always     
     begin
	clk = 1; 
     #1; 
     clk = 0; 
     #1;
     end
   
   initial
     begin
	//set up output file
  initial
     begin
	// Gives output file name
	handle3 = $fopen("State.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

 always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b || %b", reset, shift_seed); 
     end   
   
	//set up any book keeping variables you may want to use
          //Book keeping variables for why?

	//set up a starting seed.  What happens with all 0s?
     assign seed_sm = 64'h 00_06_76_00_04_64_64_00;

     //When you set up the starting seed with 0s (and you are XORing for your shifts), you will be in a "lock out state"
     //When you set up the starting seed with 1s (and you are XNORing for your shifts), you will be in a "lock out state"

	//reset your DUT
     lfsr16 dut (seed,clk,reset,shift_seed);   
	//save the initial output of your DUT to compare with current output

     //Look at where we are and ask if we are in the right order/what we are missing so that we can get to testing

	//and see when you repeat
     end

   always @(posedge clk)
     begin
		//output your results to a file
     end

   // check results on falling edge of clk
   always @(negedge clk) begin
		if(~reset) begin
		//check if your output equals the initial output 
		//if so, report how many iterations it took to repeat
		//this should be (2^n) - 1
		//if the output never repeats for 2^n iterations, report that
		end
	end
   
endmodule // tb

