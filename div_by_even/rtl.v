/**************************************************************************************
Parameterized Even Clock Divider (Divide-by-2/4/8) using Counter with Asynchronous Reset
****************************************************************************************/

module div_by_even #(parameter N = 4)
  (   input clk, 
      input rst_n,
      output reg out_clk
  );
  
  reg [$clog2(N)-1 : 0]count;
  always@(posedge clk or negedge rst_n)
  begin 
    if(!rst_n)
       begin 
          out_clk <= 0;
          count<= 0;
       end
     else 
        begin 
          if(count == N/2 -1)
             begin
              out_clk <= ~out_clk;
              count<=0;
             end
           else 
              count<=count+1;
        end
  end
endmodule
