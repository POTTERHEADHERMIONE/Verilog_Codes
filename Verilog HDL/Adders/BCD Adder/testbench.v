module tb_bcd_adder;

  // Inputs
  reg [3:0] A, B;
  reg Cin;

  // Outputs
  wire [3:0] S;
  wire Cout;

  bcd_adder B1(A,B,Cin,S,Cout);

  // Stimulus
  initial begin
    // Initialize inputs
    A = 4'b0000; B = 4'b0000; Cin = 0;
    
    // Display headers
    $display("A   B   Cin   |   Sum   CarryOut");
    $display("------------------------------");
    $dumpfile("testbench.vcd");
    $dumpvars(0,tb_bcd_adder);
    
    // Test case 1: 0 + 0
    #10 A = 4'b0000; B = 4'b0000; Cin = 0;
    #10 $display("%b   %b    %b   |   %b   %b", A, B, Cin, S, Cout);
    
    // Test case 2: 5 + 3
    #10 A = 4'b0101; B = 4'b0011; Cin = 0;
    #10 $display("%b   %b    %b   |   %b   %b", A, B, Cin, S, Cout);
    
    // Test case 3: 7 + 2
    #10 A = 4'b0111; B = 4'b0010; Cin = 0;
    #10 $display("%b   %b    %b   |   %b   %b", A, B, Cin, S, Cout);
    
    // Test case 4: 9 + 6
    #10 A = 4'b1001; B = 4'b0110; Cin = 0;
    #10 $display("%b   %b    %b   |   %b   %b", A, B, Cin, S, Cout);
    
    // Test case 5: 5 + 7 with carry in
    #10 A = 4'b0101; B = 4'b0111; Cin = 1;
    #10 $display("%b   %b    %b   |   %b   %b", A, B, Cin, S, Cout);
    
    // Test case 6: 9 + 9 with carry in
    #10 A = 4'b1001; B = 4'b1001; Cin = 1;
    #10 $display("%b   %b    %b   |   %b   %b", A, B, Cin, S, Cout);
    
    // Test case 7: 8 + 8
    #10 A = 4'b1000; B = 4'b1000; Cin = 0;
    #10 $display("%b   %b    %b   |   %b   %b", A, B, Cin, S, Cout);

    // Test case 8: 1 + 9
    #10 A = 4'b0001; B = 4'b1001; Cin = 0;
    #10 $display("%b   %b    %b   |   %b   %b", A, B, Cin, S, Cout);
    
    // Finish simulation
    #10 $finish;
  end

endmodule
