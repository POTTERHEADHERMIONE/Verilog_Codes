`timescale 1ns/1ps

module ripple_carry_counter_tb;
    reg clk, clear;
    wire [3:0] Q;

    // Instantiate the ripple carry counter
    ripple_carry_counter RCC (.Q(Q), .clk(clk), .clear(clear));

    // Clock generation
    always #5 clk = ~clk; // Toggle clock every 5ns (10ns period => 100MHz)

    initial begin
        // Initialize signals
        clk = 0;
        clear = 1;
        
        // Apply reset
        #10 clear = 0;
        #10 clear = 1;

        // Run simulation for some time
        #100;

        // End simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t | Q = %b", $time, Q);
    end

    // Display output on terminal
    always @(posedge clk) begin
        $display("At time %0t: Counter Value = %b", $time, Q);
    end
endmodule
