module simulate;
  reg J, K, clk;
  wire Q, Qbar;

  // Instantiate the JK flip-flop module
  jk jk1(Q, Qbar, J, K, clk);

  // Generate clock signal (T = 10 time units, toggles every 5 units)
  always #5 clk = ~clk; 

  initial 
  begin
    // Initialize values
    clk = 0; J = 0; K = 0;

    #10 J = 1; K = 0;  // Set condition (Q → 1)
    #10 J = 0; K = 1;  // Reset condition (Q → 0)
    #10 J = 1; K = 1;  // Toggle condition
    #10 J = 1; K = 1;  // Toggle again
    #10 J = 0; K = 0;  // Hold condition
    #10 J = 1; K = 0;  // Set condition
    #10 J = 1; K = 1;  // Toggle again

    #20 $finish;  // End simulation
  end 

  initial
  begin 
    $monitor("Time: %0t | clk: %b | J: %b | K: %b | Q: %b | Qbar: %b", 
              $time, clk, J, K, Q, Qbar);
  end
endmodule
