module up_down_counter (
    input clk,         // Clock signal
    input reset,       // Active-high reset
    input M,           // Mode control: 0 for UP, 1 for DOWN
    output reg [2:0] Q // 3-bit output counter
);

always @(posedge clk or posedge reset) begin
    if (reset) 
        Q <= 3'b000; // Reset counter to 0
    else if (M == 0) 
        Q <= Q + 1;  // UP counting
    else 
        Q <= Q - 1;  // DOWN counting
end

endmodule
