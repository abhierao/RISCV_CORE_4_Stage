\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  DAY3 LAB RISCV MYTH WORKSHOP
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
      @0
         //Sequential Calculator
         $reset = *reset;
         $val1[31:0] = >>1$out;
         $val2[31:0] = $rand2[3:0];
         $op[1:0]    = $rand3[1:0];
         $sum[31:0]  = $val1 + $val2;
         $sub[31:0]  = $val1 - $val2;
         $mul[31:0]  = $val1 * $val2;
         $div[31:0]  = $val1 / $val2;

         //A mux to choose the desired operation 
         $out[31:0] = $reset ? 32'b0 : 
                      ($op==2'b00)
                             ? $sum[31:0] :
                      ($op==2'b01)
                             ? $sub[31:0] :
                      ($op==2'b10)
                             ? $mul[31:0] :
                      $div[31:0];          
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
