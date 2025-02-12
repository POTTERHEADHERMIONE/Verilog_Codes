`timescale 1ns/1ps

module T_Flip_Flop_TB();
    reg clk, clear;
    wire Q;

    // Instantiate T Flip-Flop
    T_Flip_Flop DUT(Q, clk, clear);

    // Clock Generation
    always #5 clk = ~clk; // Generate clock with 10ns period

    initial begin
        // Initialize signals
        clk = 0; clear = 1;
        #10 clear = 0;  // Release clear
        
        // Toggle Test
        #10; // Expect Q toggles
        #10;
        #10;
        #10;
        
        // Test Case: Asynchronous Clear
        #5 clear = 1; // Expect Q=0
        #5 clear = 0; 

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | clk=%b | clear=%b | Q=%b", 
                  $time, clk, clear, Q);
    end
endmodule
