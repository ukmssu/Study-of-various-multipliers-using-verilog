//Testbench for Verilog code of Baugh-Wooley Multiplier 
module baughwooley8_tb;


    // Inputs
    reg [7:0] x;
    reg [7:0] y;

    // Outputs
    wire [15:0] s;

    // Instantiate the Unit Under Test (UUT)
    baughwooley8 uut (
        .x(x), 
        .y(y), 
        .s(s)
    );

    initial begin
        // Initialize Inputs
        x = 0;
        y = 0;

        // Wait 100 ns for global reset to finish
        #100;
        x=-25;
        y=35;
        // Add stimulus here

    end
      
endmodule
