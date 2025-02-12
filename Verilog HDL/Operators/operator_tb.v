module simulation;
    reg [1:0] A, B;
    wire [1:0]out;

    // Instantiate the operators module
    operators op1(out, A, B);

    initial begin
 
        #10 A = 2'b0x; B = 2'b10;

        // Corrected $display syntax
        $display("A = %b | B = %b | Output = %b", A, B, out);
           $dumpfile("waveform.vcd");  // Create VCD file
    $dumpvars(0, simulation);

        // End simulation
        #10 $finish;
    end
endmodule