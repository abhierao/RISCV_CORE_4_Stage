# RISC-V Workshop

### A guide to Design a Microprocessor in 5 Days

# Overview 
RISC-V is a free and open ISA enabling a new era of processor innovation through open standard collaboration. Born in academia and research, RISC-V ISA delivers a new level of free, extensible software and hardware freedom on architecture, paving the way for the next 50 years of computing design and innovation.

"Microprocessor for You in Thirty Hours" is a Workshop offered by [VLSI System Design](https://www.vlsisystemdesign.com) and [Redwood EDA](https://www.redwoodeda.com/) to help students, computer architecture enthusiasts and hobbyists to get a jumpstart into the world of RISCV.

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

# Day 1 & 2- Introduction to ISA, Compiler, RISCV TOOL CHAIN and more...

## Instruction Set Architecture
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

## RISCV TOOL CHAIN 
__COMPILER__
  - A <ins>__compiler__</ins> is a special program that processes statements written in a particular programming language (C, C++, JAVA etc) and turns them into 
    machine language (ASM) or "code" that a computer's processor uses. We use a GCC Compiler in the below example. 
  - __GCC COMPILER__ - The GNU Compiler Collection (GCC) is a compiler system produced by the GNU Project supporting various programming languages. 

**1. To compile with RISC-V GCC compiler:**
```
riscv64-unknown-elf-gcc <compiler option -O1 ; Ofast> <ABI specifier -lp64; -lp32; -ilp32> <architecture specifier -RV64 ; RV32> -o <object filename> <C filename> 
```
**2. To compile using existing x86 on your machine just use GCC:**
```
gcc -o <object filename> <C-filename> 
```
**3. To view the disassembly aka assembly code - RISC V :**
```
riscv64-unknown-elf-objdump -d <object filename> | less 
```
**4. To view the disassembly aka assembly code - RISC V :**
```
objdump -d -M intel -s <object filename compiled using gcc> 
```


__SIMULATOR__
  - __SPIKE SIMULATOR__ - Spike is the golden reference functional RISC-V ISA C++ sofware simulator. It provides full system emulation, It serves as a starting 
    point for running software on a RISC-V target. Spike can also be used to debug the ASM code below image highlights step by step execution using SPIKE 
    DEBUGGER.

**5. Step 1/2 generates an object file aka EXE file which most of us are familiar with, below code helps run the object file to provide us the expected output:**
```
spike pk <Object Filename>
```
**6. As mentioned earlier SPIKE can also be used to debug Assembly code step by step below commands helps to do that:**
```
spike -d pk <Object Filename>
```

__TOOL CHAIN FOR RISC V can be found__ [here](http://hdlexpress.com/RisKy1/How2/toolchain/toolchain.html) __and SPIKE__ [here](https://chipyard.readthedocs.io/en/latest/Software/Spike.html). 


Lets use the above tool chain to see the output of a compiler converting C code to RISCV ASM and x86 ASM code, below snippet shows the output of a program written 
in C to compute sum of 1 to 9 numbers and SPIKE outputs.


__SUM OF 1 to 9 OUTPUT using SPIKE__

![sum_of_n_numbers_RV64_output](https://user-images.githubusercontent.com/14968674/92629425-ed424100-f2eb-11ea-8a04-53dc0b77e37e.png)


__A DIFFERENTIATION OF x86 ASM vs RISCV ASM__ - Clearly RISCV has lesser instructions for the same C code. 
![x86_vs_RISCV_Disassembly](https://user-images.githubusercontent.com/14968674/92628266-2974a200-f2ea-11ea-8351-3c9b10e6bc0a.png)


__SPIKE DEBUG ENVIRONMENT__ - Showcasing step by step debug capability. 
![Spike_debug](https://user-images.githubusercontent.com/14968674/92629442-f16e5e80-f2eb-11ea-9f94-25146160b835.jpg)


## APPLICATION BINARY INTERFACE 
System programming(*3) involves designing and writing computer programs that allow the computer hardware to interface with the programmer and the user, leading to  the effective execution of application software on the computer system.Typical system programs include the operating system and firmware, compilers assemblers etc.

In order to achieve systems programming there needs to be an interface which communicates between software and hardware which is where the APPLICATION BINARY 
INTERFACE comes into play. 

Application Binary Interface is an interface that allows application programmers to access hardware resources. RISC-V specification has 32 registers whose width 
is defined by XLEN which can be 32/64 for RV32/RV64 respectively.The data can be loaded from memory to registers or directly sent, Application programmer can 
access each of these 32 registers through its ABI name seen below

__Check References(2) for detailed article on ABI__

![ABI NAME](https://www.vlsisystemdesign.com/wp-content/uploads/2017/12/32-registers.png)


# Day3 - MAKERCHIP, TL VERILOG & DIGITAL DESIGN

#### TL VERILOG 
Transaction Level Verilog or TL-Verilog is an extension to existing Verilog HDL and a huge step forward in coding HDL languages. TL-Verilog introduces simpler syntaxes and adds powerful constructs which makes Logic Design fun and easy. (Also can say its a Higher Abstraction to Sys V)

Features of TL-Verilog making it unique - 
  - TL-Verilog supports "timing abstraction" or pipelining as a fundamental language construct. Pipelines provide context for sequential logic. 
  - TL-V eliminates the need to code sequential elements, such as flip-flops, explicitly. 
  - Logic pipelining can be easily and safely modified to meet cycle-time targets for a particular implementation of a design, even for logic you might not think of as pipelined. (Easiest way to implement pipeline is acheived in TL-V) 
  - Generally, high-speed designs are less than half the size in TL-Verilog versus SystemVerilog without any loss in detail! More about it [here](https://www.redwoodeda.com/tl-verilog)

#### MAKERCHIP 
Makerchip is a free online environment by Redwood EDA for developing high-quality integrated circuits. The online platform can be used to code, compile, simulate and debug Verilog designs all in just one tool. Access and learn from [here](http://makerchip.com/)

#### DIGITAL DESIGN 
Below are a set of images from Makerchip showcasing the TL-V code and Simulation Output. Most of the basic circuits examples can be found in Makerchip Tutorials an exhaustive list to get anyone enough information to learn the platform and TL-Verilog. 

**1. GATES and MUX (AND , OR , NOT etc) 

/home/abhierao/Documents/RISCV/DAY3_Snips/Gates_mux.png

**2. Multiply Operator Implementation and what is the magic behind TL-Verilog

What is so special about TL-V is its integration with SandPiper. SandPiper is a code generator which converts code written in TL_Verilog code to a well-structured SystemVerilog code. More about Sandpiper [here](https://www.redwoodeda.com/products).

/home/abhierao/Documents/RISCV/DAY3_Snips/code_comparison_multiply.png

**3. Ease of PIPELINING in TL-V Pythagorean Theorem Implementation - Single Stage v/s 3 Stage Pipeline

Single Stage
/home/abhierao/Documents/RISCV/DAY3_Snips/Pythagorean_single_stage.png

3 Stage Pipeline - Just an @ and voila the design is split into different stages, An exercise would be to check the amount of code saved by TL Verilog it would be astonishing improvement. Simpler the code lesser the bugs is the mantra. 

/home/abhierao/Documents/RISCV/DAY3_Snips/Pythagorean_3_stage.png


**4. Power of Validity in TL-V - 2 Cycle Sequential Calculator with Validity 

Validity in code is an important feature as it acts as Guardian of a piece of module to be executed when a particular condition gets hit, this makes the code easier to debug, cleaner implmentation of the code and helps in Automatic Clock Gating. @Valid construct in TL-V helps achieve. The code for this implementation is present [here](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-abhierao/blob/master/Day3_5/calculator_solutions.tlv)

file:///home/abhierao/Documents/RISCV/DAY3_Snips/2_Cycle_Calculator_with_validity.png

file:///home/abhierao/Documents/RISCV/DAY3_Snips/2_cycle_calculator_validity_diagram.png



# Day4 & 5 - RISC V CORE IMPLMENTATION
Below is a split of tasks which will help design a basic RISCV Core.  

**1. Program Counter Implementation 

The program counter (PC), commonly called the instruction pointer (IP) is a counter in a processor that indicates where a computer is in its program. PC jumps 4bytes at a time as each instruction is 32bits in RV32.  

/home/abhierao/Documents/RISCV_CPU_PC_Implmentation.png

**2. Instruction Fetch

The instruction fetch unit (IFU) in a central processing unit (CPU) is responsible for organising program instructions to be fetched from memory, and executed, in an appropriate order. This makes the control logic of the core. 

file:///home/abhierao/Documents/CPU_Instruction_cycle_diagram.png


**3. Instruction Decode

The decoding stage allows the CPU to determine what instruction is to be performed so that the CPU can tell how many operands it needs to fetch in order to perform the instruction. The opcode fetched from the memory is decoded for the next steps and moved to the appropriate registers. Below image shows hoe decode is determining the TYPE OF RISC V instructions set (Various types of Instructions in RV32 are I, R, S, J, U) 

file:///home/abhierao/Documents/Screenshot%20from%202020-08-30%2003-52-41.png

Waveform focussed on BLT (Branch if less than) Toggle. 

file:///home/abhierao/Documents/Instruction_Decode_Waveform.png

**4. ALU and Register Write of output

An arithmetic-logic unit (ALU) is the part of the CPU that carries out arithmetic and logic operations. Below image shows an ADDI (ADD Immediate) instruction computation.
A unique feature of makerchip yet to be released to public is VIZ (Visualization), it helps analyze the implementation visually thereby developers can understand how instructions are executed and which registers is at play during transactions and the final register output. 

file:///home/abhierao/Documents/ADD_register_write.png


**5. Single Stage RISC V Core 

A single stage implmentation of the above modules put together looks like below. 

file:///home/abhierao/Documents/RISCV_CORE_SINGLE_STAGE.png


**6. RISC V 3 Stage Pipelined Core

The above single stage Core was enhanced to be staged across 3 stages in a pipeline, Final output where the core is computing Sum of 9 numbers. The code for the same is available [here](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-abhierao/blob/master/Day3_5/risc-v_solutions.tlv).

file:///home/abhierao/Documents/RISCV/Day5_Snips/RISCV_CPU_CORE.png

# Acknowledgements 

All this wouldn't have been possible without a great set of mentors guiding throughout the workshop, few notable mentions below 

  - [Kunal Ghosh](https://www.linkedin.com/in/kunal-ghosh-vlsisystemdesign-com-28084836/) (Founder VSD)
  - [Steve Hoover](https://www.linkedin.com/in/steve-hoover-a44b607/) (Founder Redwood EDA)
  - [Shivam Potdar](https://www.linkedin.com/in/shivampotdar99/) 
  - [Vineeth Jain](https://www.linkedin.com/in/vineet-jain-3b4a24150/)

# References 

**1. To understand more about Compiler options refer to [RISC V OPTIONS](https://www.sifive.com/blog/all-aboard-part-1-compiler-args) and [GCC OPTIONS](https://gcc.gnu.org/onlinedocs/gcc/Option-Index.html#Option-Index_op_letter-O)

**2. A simplified understanding of ABI by Kunal [here](https://www.vlsisystemdesign.com/abi-get-this-one-right-risc-v-is-all-yours/)

**3. [Systems Programming](https://en.wikipedia.org/wiki/Systems_programming)

**4. RISC V Calling Convention for systems programmers [here](https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf)

**5. [Redwood EDA](https://www.redwoodeda.com/)

**6. [TL-X org](https://tl-hdl.wixsite.com/tl-x)

