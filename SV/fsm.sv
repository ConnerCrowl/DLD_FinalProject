module fsm (clk, fsmReset, randSwitch, startSwitch, flopreset, giveSeed, muxStart, showShift_seed);

   input logic clk;
   input logic randSwitch;
   input logic startSwitch;
   input logic fsmReset;

   output logic flopreset;
   output logic giveSeed;
   output logic muxStart;
   output logic showShift_seed;

   typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge fsmReset)
     if (fsmReset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
          flopreset <= 1'b0;
          giveSeed <= 1'b1;
          muxStart <= 1'b0;
          showShift_seed <= 1'b0;	  
          
          if (randSwitch && startSwitch) nextstate <= S3;
          else if(startSwitch) nextstate <= S1;
          else if(randSwitch) nextstate <=S2;
          else nextstate <=S0;
      end
       S1: begin
          flopreset <= 1'b0;
          giveSeed <= 1'b0;
          muxStart <= 1'b0;
          showShift_seed <= 1'b0;	  
          
          if (randSwitch && startSwitch) nextstate <= S3;
          else if(startSwitch) nextstate <= S1;
          else if(randSwitch) nextstate <=S2;
          else nextstate <=S0;
       end
       S2: begin
          flopreset <= 1'b0;
          giveSeed <= 1'b1;
          muxStart <= 1'b1;
          showShift_seed <= 1'b1;	  
          
          if (randSwitch && startSwitch) nextstate <= S3;
          else if(startSwitch) nextstate <= S1;
          else if(randSwitch) nextstate <=S2;
          else nextstate <=S0;
       end
       S3: begin
	       flopreset <= 1'b0;
          giveSeed <= 1'b0;
          muxStart <= 1'b1;
          showShift_seed <= 1'b1;	  
          
          if (randSwitch && startSwitch) nextstate <= S3;
          else if(startSwitch) nextstate <= S1;
          else if(randSwitch) nextstate <=S2;
          else nextstate <=S0;  
       end
       
     endcase
   
endmodule
