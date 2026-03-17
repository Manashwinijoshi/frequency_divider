/**********************************************************************************************
For odd clock division ratios, exact duty cycles such as 66.66% are not always achievable because the output waveform is constrained to integer clock cycles. 
This limits the duty cycle to k/N ratios. To improve accuracy, a higher-frequency clock can be used to increase resolution and better approximate the desired duty cycle.
**********************************************************************************************/

module div_by_odd #(parameter N = 3) (input clk, input rst_n, output reg out_clk);

  reg [$clog2(N)-1: 0]count;
  always@(posedge clk or negedge rst_n)
  begin 
    if(!rst_n)
    begin 
        out_clk<=0;
        count<=0;
    end
    else 
      begin 
         if(count == N-1)
         begin   
    			count<=0;
         end 
	       else
          	count <= count + 1;
         out_clk <= (count < ((N+1)>>1) );
         end
 end
endmodule

