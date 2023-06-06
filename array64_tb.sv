//Testbench for Verilog code of 64x64 array multiplier
module array64_tb;       
  
   reg [63:0]M;
   reg [63:0]N;       
   wire [127:0]P;  
        
   array64 uut(.M(M),.N(N),.P(P));

   initial
   begin 
     M=10;
     N=12;
     #30 ;

     M=13;
     N=12;
     #30 ;
   
     M=10;
     N=22;
     #30 ;
   
     $finish;
   end 
endmodule
