//Verilog Code for Wallace Tree Multiplier 4x4 bit
module wallace(
    input [3:0] a,
    input [3:0] b,
    output [7:0] c
    );
	 wire [4:0]s1,d1,s,d;
	 wire v;
  //level 1
  assign c[0]=a[0]&b[0];
  ha ha1(a[0]&b[1],(a[1]&b[0]),c[1],d[0]);
  fa fa1(a[0]&b[2],a[1]&b[1],a[2]&b[0],s[0],d[1]);
  fa fa2(a[0]&b[3],a[1]&b[2],a[2]&b[1],s[1],d[2]);
  fa fa3(a[1]&b[3],a[2]&b[2],a[3]&b[1],s[2],d[3]);
  ha ha2(a[2]&b[3],a[3]&b[2],s[3],d[4]);
  //level 2
  ha ha3(s[0],d[0],c[2],d1[0]);
  fa fa4(a[3]&b[0],s[1],d[1],s1[0],d1[1]);
  ha ha4(s[2],d[2],s1[1],d1[2]);
  ha ha5(s[3],d[3],s1[2],d1[3]);
  ha ha6(a[3]&b[3],d[4],s1[3],d1[4]);
  assign s1[4]=0;
  //level3 adder
   adder5 aq(s1,d1,c[7:3],v);

endmodule


module ha(x,y,z,q);
input x,y;
output z,q;
assign z=x^y;
assign q=x&y;
endmodule

module fa(x,y,j,z,q);
input x,y,j;
output  z,q;
  assign z=(x^y)^j;
  assign q=(x&y)|(y&j)|(j&x);
endmodule

module adder5(
input [4:0]a,
input [4:0]b,
output [4:0]c,
output carry );
wire [4:0]p,g,c1;
assign p=a^b;
assign g=a&b;
assign c1[0]=0;
assign c1[1]= g[0];
assign c1[2]= g[1] | (p[1]&g[0]) ;
assign c1[3]= g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] ;
assign c1[4]= g[3] |  p[3]&g[2] | (p[3]&p[2]&g[1]) | p[3]&p[2]&p[1]&g[0] ;
assign carry= g[4]|p[4]&g[3] |  p[4]&p[3]&g[2] | (p[4]&p[3]&p[2]&g[1]) | p[4]&p[3]&p[2]&p[1]&g[0] ;
assign c=p^c1; 
endmodule
