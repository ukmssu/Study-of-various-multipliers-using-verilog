//Testbench for Verilog code for 64x64 bit booth multiplier
module booth64_tb;


    // Inputs
    reg [63:0] X;
    reg [63:0] Y;

    // Outputs
    wire [127:0] Z;

    // Instantiate the Unit Under Test (UUT)
    booth64 uut (
        .X(X), 
        .Y(Y), 
        .Z(Z)
    );

    initial begin
        // Initialize Inputs
        X = 0;
        Y = 0;

        // Wait 100 ns for global reset to finish
        #100;
        X=100;
          Y=-300;
        // Add stimulus here

    end
      
endmodule
