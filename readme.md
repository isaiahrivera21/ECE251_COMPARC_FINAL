## Isaiah and Effie 

## BIT BUSTERS 
## 32-bit CPU in MIPS 


The Von Neumann architecture is a computer architecture that is based on the concept of a single memory unit for both data and instructions. The architecture was proposed by John von Neumann, and it has been widely used in modern computers. In this write-up, we will discuss a 32-bit MIPS implementation based on the Von Neumann architecture.

The purpose of this project is to design and implement a 32-bit MIPS CPU. The objective is to create a CPU that can execute a subset of the MIPS instruction set, while adhering to the basic principles of the Von Neumann architecture.

The overall design includes several main components, such as the ALU, control unit, registers, and memory. The ALU performs arithmetic and logical operations, the control unit manages the flow of data between the components, the registers store data and instructions, and the memory stores the program and data.

 The CPU is designed to fetch instructions and data from a single memory unit. The instruction set is based on a subset of the MIPS instruction set, which includes arithmetic, logical, load word /store word, branch,  and jump instructions.

The ISA 
    Our ISA is based off of MIPS 

![1](1.jpg)

ALU control 

![2](https://github.com/isaiahrivera21/ECE251_COMPARC_FINAL/assets/99307808/48abafeb-8855-4632-a46b-ccf828c86c88)

Choices for our design 
 
![3](https://github.com/isaiahrivera21/ECE251_COMPARC_FINAL/assets/99307808/98fb5d88-ed0b-48ac-9e19-b9a039a6ff78)

Our ISA supports R, I, and J Type instructions. 

Our implemenatation uses this diagram 
![4](https://github.com/isaiahrivera21/ECE251_COMPARC_FINAL/assets/99307808/5e4b82e4-8767-4d9a-94ae-ec148f9377d2)

Each module was and tested with its own testbench individually then integrated with each other to create the CPU with all the modules working together. 
The lists of modules include: 
 Adder, PC adder, ALU Decoder, Clock, Control Unit, CPU, data memory, Data Path, instruction decode, instruction Memory, The ALU, CPU      control, PC mux, program counter, Register file, and sign extender. 


#### TESTING 

We generated 3 different codes to test our CPU on. We hand compiled based off our ISA and ran them all successfully. 

The first being leaf procedure: 
![6](https://github.com/isaiahrivera21/ECE251_COMPARC_FINAL/assets/99307808/e8e00105-94da-45fa-b697-4160d0fb366d) 
with out put succesful on gtk wave  
![5](https://github.com/isaiahrivera21/ECE251_COMPARC_FINAL/assets/99307808/2f14b0d5-051d-4736-9cc3-3391941476c7)

The second being a nested procedure: 


The third being fibbinocci: 




Improvements for future: 
Pipelining – take in multiple instructions instead of single cycle 
Assembler – generate the code for us instead of hand compiling 


