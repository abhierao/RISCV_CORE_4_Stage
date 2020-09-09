# RISC-V Workshop

### A guide to Design a Microprocessor in 5 Days

# Overview 
RISC-V is a free and open ISA enabling a new era of processor innovation through open standard collaboration. Born in academia and research, RISC-V ISA delivers a new level of free, extensible software and hardware freedom on architecture, paving the way for the next 50 years of computing design and innovation.

"Microprocessor for You in Thirty Hours" is a Workshop offered by [VLSI System Design](https://www.vlsisystemdesign.com) and [Redwoord EDA](https://www.redwoodeda.com/) to help students, computer architecture enthusiasts and hobbyists to get a jumpstart into the world of RISCV.

# Workshop Outline 
The workshop was designed to be a 5 day coursework enabling participants to understand the Software-Hardware integration in architecting a Processor core.

This workshop delivers on the promise of 5 days to a microprocessor using the approach of minimal theory and maximum implmentation. Concepts and Theory is kept to as low as 20% and writing code finding out the answers to move the next level is at 80% time spent. 

The first two days was focussed on how an application written in higher level language (C, C++, JAVA, Python) communicates with the processor, details such as how a compiler / assembler works, interfaces between the Application layer --> OS and RTL, An introduction to RISC V ISA. 

Day3-5 was all about Computer Architecture, RISCV ISA and Implementing a 3 stage pipelined RISCV Core on [Makerchip IDE](https://www.makerchip.com/) using [TL-Verilog](https://tl-x.org/)

#### Key Takeaways - 
  - Understanding Compiler/Assembler and its importance
  - How an Assembly program works on a processor. 
  - RISCV ISA.
  - Computer Architecture
  - TL Verilog (An alternative to Verilog and Sys V).
  - Logic Design and RTL Design.
  - Makerchip IDE(An EDA tool used to design the RISC V Core). 

# Day 1 & 2- Introduction to ISA and Compiler

An Instruction Set Architecture (ISA) defines, describes, and specifies how a particular computer processor core works. The ISA describes the registers and 
describes each machine-level instruction. The ISA tells exactly what each instruction does and how it is encoded into bits. The ISA forms the interface between 
hardware and software. Hardware engineers design digital circuits to implement a given ISA specification. Software engineers write code (operating systems, 
compilers, etc.) based on a given ISA specification. 

The RISC-V specification is a collection of ISA options. A naming convention is used in which a particular ISA variation is given a code name telling which ISA 
options are present and supported. A particular hardware (chip) can be described or summarized with such a coded name, indicating which RISC-V features are 
implemented by the chip. 

For example - <ins>__RV32IMFD__</ins>

  - RV stands for RISC V and all code names start with RV. 
  - 32 indicates that registers are 32bit wide. 
    - RV64 - 64 bit wide registers used in 64bit machines.
    - RV128 - 128 bit wide registers used in 128bit machines.
  - I – Basic integer arithmetic is supported.
  - M – Multiply and divide are supported in hardware. 
  - F – Single precision (32 bit) 2loating point is supported. 
  - D – Double precision (64 bit) 2loating point is supported.
  
RV32I is the base integer instruction set which is included in all the designs, the rest are termed as extension sets which can be added as demanded by the design of microprocessor. 

#### COMPILER and TOOL CHAIN 
A <ins>__compiler__</ins> is a special program that processes statements written in a particular programming language (C, C++, JAVA etc) and turns them into 
machine language (ASM) or "code" that a computer's processor uses.

- __GCC COMPILER__ - The GNU Compiler Collection (GCC) is a compiler system produced by the GNU Project supporting various programming languages. 
Lets use this to see the output of a compiler converting C code to x86 or RISCV ASM code below snippet shows a program for computing sum of 1 to 9 numbers.



    

# Day3 

# Day4 

# Day5

# Acknowledgements 

# References 
