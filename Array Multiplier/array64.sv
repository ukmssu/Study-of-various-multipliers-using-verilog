// Verilog code for 64x64 bit array multiplier

module array64(M,N,P); 
 input [63:0]M,N;
 output [127:0]P;
 
 wire [63:0]q0,q1,q2,q3,q4,temp1;
 wire [95:0]q5,q6,temp2,temp3,temp4;
 
 array32 Z1(M[31:0],N[31:0],q0[63:0]);
 array32 Z2(M[63:32],N[31:0],q1[63:0]);
 array32 Z3(M[31:0],N[63:32],q2[63:0]);
 array32 Z4(M[63:32],N[63:32],q3[63:0]);
 
 assign temp1 = {32'b0,q0[63:32]};
 assign q4 = q1[63:0]+temp1;
 assign temp2 = {32'b0,q2[63:0]};
 assign temp3 = {q3[63:0],32'b0};
 assign q5 = temp2+temp3;
 assign temp4 = {32'b0,q4[63:0]};
 assign q6 = temp4+q5;
 
 assign P[31:0] = q0[31:0];
 assign P[127:32] = q6[95:0];
endmodule

module array2(M,N,P);
 input [1:0]M,N;
 output [3:0]P;
 
 wire [3:0]temp;
 
 assign P[0]=M[0]&N[0];
 assign temp[0]=M[1]&N[0];
 assign temp[1]=M[0]&N[1];
 assign temp[2]=M[1]&N[1];
 
 HA Z1(temp[0],temp[1],P[1],temp[3]);
 HA Z2(temp[2],temp[3],P[2],P[3]);
 
endmodule

module array4(M,N,P);
 input [3:0]M,N;
 output [7:0]P;
 wire [3:0]q0,q1,q2,q3,q4,temp1;
 wire [5:0]q5,q6,temp2,temp3,temp4;
 
 array2 Z1(M[1:0],N[1:0],q0[3:0]);
 array2 Z2(M[3:2],N[1:0],q1[3:0]);
 array2 Z3(M[1:0],N[3:2],q2[3:0]);
 array2 Z4(M[3:2],N[3:2],q3[3:0]);
 
 assign temp1 = {2'b0,q0[3:2]};
 assign q4 = q1[3:0]+temp1;
 assign temp2 = {2'b0,q2[3:0]};
 assign temp3 = {q3[3:0],2'b0};
 assign q5 = temp2+temp3;
 assign temp4 = {2'b0,q4[3:0]};
 assign q6 = temp4+q5;
 
 assign P[1:0] = q0[1:0];
 assign P[7:2] = q6[5:0];
endmodule

module array8(M,N,P);
 input [7:0]M,N;
 output [15:0]P;
 
 wire [7:0]q0,q1,q2,q3,q4,temp1;
 wire [11:0]q5,q6,temp2,temp3,temp4;
 
 array4 Z1(M[3:0],N[3:0],q0[7:0]);
 array4 Z2(M[7:4],N[3:0],q1[7:0]);
 array4 Z3(M[3:0],N[7:4],q2[7:0]);
 array4 Z4(M[7:4],N[7:4],q3[7:0]);
 
 assign temp1 = {4'b0,q0[7:4]};
 assign q4 = q1[7:0]+temp1;
 assign temp2 = {4'b0,q2[7:0]};
 assign temp3 = {q3[7:0],4'b0};
 assign q5 = temp2+temp3;
 assign temp4 = {4'b0,q4[7:0]};
 assign q6 = temp4+q5;
 
 assign P[3:0] = q0[3:0];
 assign P[15:4] = q6[11:0];
endmodule

 module array16(M,N,P);
 input [15:0]M,N;
 output [31:0]P;
 
 wire [15:0]q0,q1,q2,q3,q4,temp1;
 wire [23:0]q5,q6,temp2,temp3,temp4;
 
 array8 Z1(M[7:0],N[7:0],q0[15:0]);
 array8 Z2(M[15:8],N[7:0],q1[15:0]);
 array8 Z3(M[7:0],N[15:8],q2[15:0]);
 array8 Z4(M[15:8],N[15:8],q3[15:0]);
 
 assign temp1 = {8'b0,q0[15:8]};
 assign q4 = q1[15:0]+temp1;
 assign temp2 = {8'b0,q2[15:0]};
 assign temp3 = {q3[15:0],8'b0};
 assign q5 = temp2+temp3;
 assign temp4 = {8'b0,q4[15:0]};
 assign q6 = temp4+q5;
 
 assign P[7:0] = q0[7:0];
 assign P[31:8] = q6[23:0];
endmodule

 module array32(M,N,P);
 input [31:0]M,N;
 output [63:0]P;
 
 wire [31:0]q0,q1,q2,q3,q4,temp1;
 wire [47:0]q5,q6,temp2,temp3,temp4;
 
 array16 Z1(M[15:0],N[15:0],q0[31:0]);
 array16 Z2(M[31:16],N[15:0],q1[31:0]);
 array16 Z3(M[15:0],N[31:16],q2[31:0]);
 array16 Z4(M[31:16],N[31:16],q3[31:0]);
 
 assign temp1 = {16'b0,q0[31:16]};
 assign q4 = q1[31:0]+temp1;
 assign temp2 = {16'b0,q2[31:0]};
 assign temp3 = {q3[31:0],16'b0};
 assign q5 = temp2+temp3;
 assign temp4 = {16'b0,q4[31:0]};
 assign q6 = temp4+q5;
 
 assign P[15:0] = q0[15:0];
 assign P[63:16] = q6[47:0];
endmodule

module HA(M,N,P,c);
 input M,N;
 output P,c;
 assign P = M^N;
 assign c = M&N;
endmodule
