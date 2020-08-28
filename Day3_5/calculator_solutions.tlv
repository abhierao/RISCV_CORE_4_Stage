//Calculator labs solutions here
\TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  DAY3 LAB RISCV MYTH WORKSHOP
   // =========================================
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);    /* verilator lint_save */ /* verilator lint_off UNOPTFLAT */  bit [256:0] RW_rand_raw; bit [256+63:0] RW_rand_vect; pseudo_rand #(.WIDTH(257)) pseudo_rand (clk, reset, RW_rand_raw[256:0]); assign RW_rand_vect[256+63:0] = {RW_rand_raw[62:0], RW_rand_raw};  /* verilator lint_restore */  /* verilator lint_off WIDTH */ /* verilator lint_off UNOPTFLAT */   // (Expanded in Nav-TLV pane.)
\TLV

   $reset = *reset;


   //Combinational Calculator
   $val1[31:0] = $rand1[3:0];

   $val2[31:0] = $rand2[3:0];

   $op[1:0]    = $rand3[1:0];
   $sum[31:0]  = $val1 + $val2;
   $sub[31:0]  = $val1 - $val2;
   $mul[31:0]  = $val1 * $val2;
   $div[31:0]  = $val1 / $val2;

   
   //A mux to choose the operation 
   $out[31:0] = ($op==2'b00)
                   ? $sum[31:0] :
                ($op==2'b01)
                   ? $sub[31:0] :
                ($op==2'b10)
                   ? $mul[31:0] :
                ($op==2'b11)
                   ? $div[31:0] :
                   32'b0;
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
