`timescale 1ns/1ps

module SR_Latch_TB();
    reg S, R,clk;
    wire Q, Qbar;

    // Instantiate SR Latch
    sr_flip_flop SF1(Q, Qbar, S, R,clk);

    initial begin
        // Initialize inputs
        clk =0;S = 0; R = 0;
        #10 clk=0; S = 0; R = 0;
        #10 clk=0; S = 1; R = 0;
        #10 clk=0; S = 0; R = 1;
        #10 clk=0; S = 1; R = 1;
        #10 clk=1; S = 0; R = 0;
        #10 clk=1; S = 1; R = 0;
        #10 clk=1; S = 0; R = 1;
        #10 clk=1; S = 1; R = 1;
      

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t |clk=%b | S=%b | R=%b | Q=%b | Qbar=%b", 
                  $time, clk,S, R, Q, Qbar);
    end
endmodule


