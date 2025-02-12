    module D_Flip_Flop(Q, Qbar, D, clk, clear);
        input D, clk, clear;
        output Q, Qbar;
        wire S,Sbar,R,Rbar,Cbar;

        assign Cbar = ~clear;

        assign Sbar = ~(Rbar & S),
            S = ~(Sbar & Cbar & ~clk),
            R = ~(Rbar & ~clk &S),
            Rbar = ~(R & Cbar & D);

        assign Q = ~(S & Qbar),
                Qbar = ~(Q & R & Cbar);      
    endmodule


    module T_Flip_Flop(Q,clk, clear);
        input clk, clear;
        output Q;
        D_Flip_Flop D1(Q, ,~Q,clk,clear);
    endmodule


module ripple_carry_counter(Q,clk,clear);
output [3:0]Q;
input clk,clear;

T_Flip_Flop T1(Q[0],clk,clear);
T_Flip_Flop T2(Q[1],Q[0],clear);
T_Flip_Flop T3(Q[2],Q[1],clear);
T_Flip_Flop T4(Q[3],Q[2],clear);

endmodule;