`timescale 1ns/1ps

module SR_Latch_TB();
    reg S, R;
    wire Q, Qbar;

    // Instantiate SR Latch
    sr_latch DUT(Q, Qbar, S, R);

    initial begin
        // Initialize inputs
        S = 0; R = 0;
        #10 S = 1; R = 0;
        #10 S = 0; R = 1;
        #10 S = 0; R = 0;
        #10 S = 1; R = 1;
        #10 S = 0; R = 0;

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | S=%b | R=%b | Q=%b | Qbar=%b", 
                  $time, S, R, Q, Qbar);
    end
endmodule
