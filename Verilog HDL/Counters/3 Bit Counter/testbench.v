module tb_up_down_counter;
    reg clk, reset, M;
    wire [2:0] Q;

    up_down_counter uut (
        .clk(clk),
        .reset(reset),
        .M(M),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Generate a clock with 10 time-unit period
    end

    initial begin
        reset = 1; M = 0;
        #10 reset = 0;  // Deactivate reset

        // UP Counting
        #100 M = 1;  // Switch to DOWN counting

        // DOWN Counting
        #200 $stop;  // Stop simulation
    end

    initial begin
        $monitor("Time: %0t | M: %b | Q: %b", $time, M, Q);
    end
endmodule
