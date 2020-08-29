\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  DAY3 LAB RISCV MYTH WORKSHOP
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/bd1f186fde018ff9e3fd80597b7397a1c862cf15/tlv_lib/calculator_shell_lib.tlv'])

   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   //2 Cycle Calculator - A pipelined Calculator with every alternate valid cycles.
   |calc
      @0
         $reset = *reset;
      @1
         $val1[31:0] = >>2$out;
         $val2[31:0] = $rand2[3:0];
         //$op[1:0] = $rand3[1:0];
         //Arithmetic Computations
         $sum[31:0]  = $val1 + $val2;
         $sub[31:0]  = $val1 - $val2;
         $mul[31:0]  = $val1 * $val2;
         $div[31:0]  = $val1 / $val2;
         //1 bit COUNTER - for valid/invalid every alternate cycles. 
         $valid[0] = $reset ? 0 : (>>1$valid + 1);
      @2
         //A mux to choose the desired operation 
         $out[31:0] = (!$valid || $reset) ? 32'b0 : 
                      ($op[1:0] == 2'b00)
                             ? $sum[31:0] :
                      ($op[1:0] == 2'b01)
                             ? $sub[31:0] :
                      ($op[1:0] == 2'b10)
                             ? $mul[31:0] :
                      ($op[1:0] == 2'b11)
                             ? $div[31:0] :
                             0;
         
   m4+cal_viz(@3)
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
