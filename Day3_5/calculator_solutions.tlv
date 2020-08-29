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
   //6-Stage Error Pipeline 
   |comp
      @1
         $err1[7:0] = $bad_input | $illegal_op; 
      @3
         $err2[7:0] = $err1 | $over_flow;
      @6
         $err3[7:0] = $err2 | $div_by_zero;
         
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
