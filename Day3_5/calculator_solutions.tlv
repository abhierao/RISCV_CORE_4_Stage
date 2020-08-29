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
   //2 Cycle Calculator with Validity and Memory - A 2 stage pipelined Calculator for basic arithmetic with memory.
   |calc
      @0
         $reset = *reset;
         //1 bit COUNTER - for valid/invalid every alternate cycles. 
         $valid[0] = $reset ? 0 : (>>1$valid + 1);
         $valid_reset = $valid || $reset;
      ?$valid_reset
         @1
            $val1[31:0] = >>2$out;
            $val2[31:0] = $rand2[3:0];
            //$op[1:0] = $rand3[1:0];
            //Arithmetic Computations
            $sum[31:0]  = $val1 + $val2;
            $sub[31:0]  = $val1 - $val2;
            $mul[31:0]  = $val1 * $val2;
            $div[31:0]  = $val1 / $val2;
         @2
            //A mux to choose the desired operation 
            $out[31:0] = ($op[2:0] == 3'b000)
                                ? $sum[31:0] :
                         ($op[2:0] == 3'b001)
                                ? $sub[31:0] :
                         ($op[2:0] == 3'b010)
                                ? $mul[31:0] :
                         ($op[2:0] == 3'b011)
                                ? $div[31:0] :
                         ($op[2:0] == 3'b100)
                                ? >>2$mem[31:0] :                               
                                0;
            //MEMORY to hold previous value 
            $mem[31:0] = ($op[2:0] == 3'b100)
                                ? >>2$mem[31:0] :
                         ($op[2:0] == 3'b101)
                                ? >>2$out[31:0] :
                                >>2$mem[31:0];

   m4+cal_viz(@3)
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 200;
   *failed = 1'b0;
\SV
   endmodule
