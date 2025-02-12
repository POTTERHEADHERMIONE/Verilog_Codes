module jk(Q, Qbar, J, K, clk);
  input J, K, clk;
  output reg Q, Qbar;  // Use reg to hold state

  initial begin
    Q = 0; 
    Qbar = 1;
  end

  always @(posedge clk) begin
    case ({J, K})
      2'b00: begin  // No change
        Q <= Q;
        Qbar <= Qbar;
      end
      2'b01: begin  // Reset (Q = 0)
        Q <= 0;
        Qbar <= 1;
      end
      2'b10: begin  // Set (Q = 1)
        Q <= 1;
        Qbar <= 0;
      end
      2'b11: begin  // Toggle
        Q <= ~Q;
        Qbar <= ~Qbar;
      end
    endcase
  end
endmodule
