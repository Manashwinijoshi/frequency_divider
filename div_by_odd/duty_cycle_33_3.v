
/**********************************************************************************
Asynchronous reset, parameterized clock divider for odd division ratios (N = 3,5,7,...)
Implements 33.33% duty cycle using counter-based design
**********************************************************************************/
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
           
            out_clk <= (count == 0);
         end
   end
endmodule

