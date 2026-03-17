/**********************************************************************************
Parameterized, Asynchronous active-high reset Odd Clock Divider with ~50% Duty Cycle
// A counter generates an intermediate enable condition based on (count < N/2),
// producing an asymmetric waveform. This condition is sampled on both the
// positive edge (en1) and negative edge (en2) of the clock, introducing a
// half-cycle phase shift between the two signals.
//
// The final output clock is obtained by OR-ing en1 and en2, effectively
// combining two phase-shifted waveforms to produce an approximate 50% duty
// cycle output.
**********************************************************************************/
module div_odd #(parameter N = 5)(input clk, input reset, output  out_clk);
  
  reg [$clog2(N)-1:0]count;
  reg en1,en2;
  
  always@(posedge clk or posedge reset)
    begin
      if(reset)
        begin
          count<=0;
        end
      else
        begin
          if(count == N-1)
            count<=0;
          else
            count<=count+1;
        end
      
    end
  
  
  always@(posedge clk or posedge reset)
    begin
      if(reset)
        en1<=0;
      else
        en1<=(count < N/2)? 1'b1: 1'b0;
    end
  
  always@(negedge clk or posedge reset)
    begin
      if(reset)
        en2<=0;
      else
        en2<=(count <N/2)? 1'b1: 1'b0;
    end
  assign out_clk = en1 | en2;
   
endmodule
