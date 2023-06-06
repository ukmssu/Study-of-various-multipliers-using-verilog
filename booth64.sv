//Verilog code for 64x64 bit booth multiplier
module booth64(X,Y,Z);
      input signed [63:0] X, Y;
       output signed [127:0] Z;
       reg signed [127:0]Z;
       reg [1:0] temp;
       integer i;
       reg E1;
       reg [63:0] Y1;
       always @ (X, Y)
       begin
       Z = 64'd0;
       E1 = 1'd0;
       for (i = 0; i < 64; i = i + 1)
       begin
       temp = {X[i], E1};
       Y1 = - Y;
  case (temp)
       2'd2 : Z [127 : 64] = Z [127 : 64] + Y1;
       2'd1 : Z [127 : 64] = Z [127 : 64] + Y;
       default : begin end
       endcase
       Z = Z >> 1;
       
       Z[127] = Z[126];
       
      
       E1 = X[i];
           end
       if (Y == 64'd9223372036854776000)
      
      
           begin
               Z = - Z;
           end
      
       end
      
       
endmodule
