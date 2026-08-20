# tr_err
Date 27 jun 2026
Split string in c
error handling (assert, errorno, perror, strerror)
getline , malloc_usable_size
regex (regcomp, regexec)
wildcard(fnmatch, glob, FNM_NOMATCH)
restrict Keyword(pointers must allocated separate area in mem, must not use same are, compiler optimization)
Compiler Explorer for mem view


Date 28 jun 2026
extern in c
Generics in c
contexpr in c
static assert in c
Complex numbers in c(creal, cimag) , sprint
struct padding in c (mem)
parsed command line argument , getopt,
Sorting algorithm (not complete)
Hash tables
diagraph and trigraph
detect overflow in variables ( stdckd.h)
Byte ordring

Date 29 jun 2026
Sorting algorith (not complete)
git connection with github


Date 30 jun 2026
started with bubble sort , got some errors ,


Date 01 jul 2026
Insertion sort
Vim modification
~/. file in linux
groups, id

Date 02 jul 2026
Shell scripting Basics , types, variables(local,environmental, shell),readonly , unset,


Date 03 jul 2026
Shell operators (arithmetic, relation, Boolean, string, filetest)
shell loops (while, for, the until loop, nested , loop control)

Date 04 jul 2026 / Saturday
W3 school bash practice / Sed command
check what is network monitoring systems ?
selection sort 

Date 05 jul 2026
Quick sort in c

Date 06 jul 2026
Struct basics , pointer struct members, pointer stuct variable

Date 07 jul 2026
Nested struct, 

Date 08 jul 2026
array of struct 

Date 09 jul 2026
memory management in c fom w3 school(static & dynamic & stack mem) 

Date 10 jul 2026
realloc, malloc

Date 11 jul 2026
time library , rand(), BareMetal, Arduino, Freertos(execution of them) 
things to do this weekend : c topics learning from word, IPC, Revision of week, plan to next week ,

Date 12 jul 2026
word report,(pre-processing, compiling, assembly, linking{static, dynamic})
Make file, (weather device exists, or older than source files)
	Rule(target > prerequisite != recipe)

Date 13 jul 2026
Done the sensor integration for the nxp imx95 board 
Learned about Doxygen Documentation 

Date 14 jul 2026
linked list are not like array which are in adjacent manner in memory , they are in separated in memory and connected through address , and the size can be growable ,
Queue has two options :Enqueue(add from back), Dequeue(remove from front)
Queue is made by signly LL , front node point to first node(dequeue) , rear point to last(enqueue) 
createQueue = check i/p, allocate mem, set front & rear=NULL, size =0, return pointer, 

Date 15 jul 2026
Done a code which implement queue menu , insertion ,deletion 
Linux process, ps command, init script 

Date 16 jul 2026 
Nothing

Date 17 jul 2026 
Doing Espressif setup, 
Goal : complete word document ---

Date 20 jul 2026

Date 21 jul 2026 IPC code in c IPC types :Shared mem(POSIX, System V, Mem-mapped files), Message Passing(Pipes, Mes Queue, Sockets, Signals, Remote Procedure call(RPC)) Shared mem"reading/writing , Mem. segment by kernel(faster) Message Passign:sending/receiving, system calls & data coping (slower), OS message queue problems in shared mem:Deadlock, Producer-consumer, Readers-Writers, Pipe code in c

Date 24 jul 2026:

Date 25 jul 2026:
socket code , server client code 
Shared mem ,a shared mem region reside in the address space of the process creating it segment 
other process must have to attach it in its address space 
Make Buffer and reside it in the shared mem region 
Bufferes can be two type [1.Unbonded buffer(no limit on size) 2.Bounded buffer(limit on size)]
shm_open(),mmap()

Date 26 jul 2026
Free rtos learning 
                ESP32 Chip
        +------------------------+
        | CPU (Xtensa/RISC-V)    |
        | RAM                    |
        | ROM (Boot ROM)         |
        | Peripherals            |
        +------------------------+
                  |
                  |
            SPI Flash Memory
        +------------------------+
        | Bootloader             |
        | Partition Table        |
        | Application            |
        | NVS                    |
        | OTA Slots              |
        | SPIFFS/LittleFS        |
        +------------------------+

when we write main() it act as app_main()(application)
then 
idf.py build --------------------------------------------------------------------------------------------
	complier(RISC-v ,xtensa) converts .c to .o --> machine codes
	compile every library (GPIO, UART, SPI, I2C, wifi, ble, freertos, tcp/ip, nvs) --> .o files
	Linker merge all .o files into --> application.elf , and assign mem/address,resolve function calls, 
	ELF -> BIN , elf file aslo contain debug info which not required for esp, so it make pure binary image .bin
	.bin files at the end , (bootloader.bin, partition-table.bin, ...)
	------------------------------------------------------------------------------------------------------------

idf.py flash -------------------------------------------------------------------------------------------------
	USB - UART chip - ESP32 UART
	ROM bootloader , goes to download mode & waits for command over UART
	Flash mem contains .bin file and according address 
	reset, CPU start from the ROM bootloader 	
		ROM bootloader --> initialize CPU, SPI FLASH , check boot mode, & basic hardware & shares to second-stage bootloader 
		Second-stage bootloader --> inside RAM storages(eMMc, SD card, SSD), then loads bootloader.bin in the mem 
			bootloader.bin --> configure major things like (clock, flash, mem, checks secure boot, read partition-table.bin)
			partition-table.bin --> contains application , load app
			application --> bootloader copies require part of apk into RAM and transfer control to apk's entry point 
		ESP-IDF startup (SDK), (ready made code), contais drivers file & etc
			ESP_IDF -->startup code, initialize heap, interrupt, drivers, C, FREERTOS and task creation 
			Free rtos --> start kernel , creates task, and calls app_main() and the apk starts via this task, also manages scheduler 


Date 31 jul 2026:
Started with verilog from YT
Basic , Abstraction level , Number specification 

Date 2 aug 2026:
data types : Net, reg, int, real, time, string
Verilog language is parallel or concurrent language , statements are running parallels 
Net : Physical connect modules , not store any values only driving data, 
    Net types : wire, wand, wor, 
	wire w1 = source driver ( a source module or reg which continuously or timely sends data ) 
	wire's by-default width(capacity) is 1 bit & default value is z (high impedance)  
	if negative value is assigned to the wire , then compiler make 2's complement on the source driver and then assign 
    if we don't mention any size to the var. , by default size is 32-bit, Base is decimal, value = 000..1. 
	if assign w = -1 , then value of w is 1 , because -1's 2's complement is 1 , default size is 32-bit, value is 111...111, LSB is store     to the w , HENECE wire is ut unsigned data type 
	if multiple drivers are driven on the same wire, then wire will get unknown value (x), to avoid this issue we use wor
	wor : multiple drivers then or operation will performed on source values 
	wand : AND operation 

reg : used for storing data 
    reg's defualt width is 1 bit , default value is x 
	if negative value is stored, then complier will do 2's complement and then stored 
	reg is also unsigned data type 

int : default size 32-bit, default value is x, signed data type 
float : default size 64-bit, value is x, signed data type, it is not synthesizable
vectors : collection of bits in a single location , 
    reg [2:0] = big endian , MSB at higher index ,
    reg [0:2] = little endian , MSB at lower index
	vector slicing = assigning perticular range to other reg or wire 
	vectors are used in the reg and wire , can't with int, real, others because reg and wire are 1 bit and can change size of it 

Date 3 aug 2026
port connection rules 
if you declared any input/output  port without its type , then it is by-default Net data type 
WHat data type is allowed at each port connection :
	| Port Direction | Inside Module     | Outside Module    |
	| -------------- | ----------------- | ----------------- |
	| input          | wire/net          | wire or reg       |
	| output         | wire or reg       | wire/net          |
	| inout          | wire/net only     | wire/net only     |
	
    Inputs receive values from outside, so they don't store data internally and are treated as nets.
	Outputs may either continuously reflect a signal (wire) or hold a value assigned in a procedural block (reg).
	Inouts represent shared buses with potentially multiple drivers, so they must be nets.

How connection is made , 1.connection by name, 2.connection by order 
1.connection by name : Instantiation by name 
	Make a design on rough , name wires or regs 
	on the design , make internal circuit using module , write logic of it 
	on the top level design use module's instants to connect directly to the ports using wire names or ports, uses .var_name()
	ex. =
	
2.connection by order  = Ports are connected in the same order as they are declared in the module.
example of both 
module adder (
    input  a,
    input  b,
    output sum
	);
	assign sum = a + b;
	endmodule 
	//connection by orderd  
	module top;
    wire s;
    reg x, y;
	adder u1 (x, y, s);   // a=x, b=y, sum=s
	endmodule 
	// connection by name 
	module top ;
			wire s; reg x,y;
			addr u1( .a(x), .b(y), .sum(s));
		  endmodule	
If we don't connect I/p port in the instantiation then got error , but this will not happenes in the o/p ports, why ? 
but in the instants , must declare arguments for connection 

Gate Level modeling 
For the Gate level modeling , there are some primitives are their which are used for coding the gates 
Primitives in Verilog are predefined, basic building blocks used to model digital logic circuits. 
syntax of the gates are : not n1(output, input) arguments 
Buffer gates :built-in gate-level primitives that pass an input signal directly to the output without changing its logic value,  bufif1 , bufif0 
	types : simple buffer(not controllable , just pass the values) , controlled buffers(bufif1, bufif0)
	bufif1 instance_name (output, input, control);
	bufif0 instance_name (output, input, control);
	controlled buffers contain tri state logic : a type of digital circuit output that can produce a high voltage (logic 1), a low voltage (logic 0), or a high-impedance (Hi-Z) state.
Fan-in : The total number of input signals that a single logic gate can accept. High fan-in increases internal resistance and delay.
Fan-out :  The maximum number of standard gate inputs that a single gate's output can safely drive without a drop in voltage or current. Exceeding this limit causes logic errors, Fan-out counts the number of input terminals that an output is connected to

Date 4 Aug 2026
Ripple carry adder, 4 bit binary adder, BCD adder
BCD adder , if we add two digits which are greater than 9 then a correction logic will add 6 to round of it single digit  
Ripple carry is combination of four 1 bit binary adder connected in the chain 
4 bit binary adder , a digital circuit that adds two 4-bit numbers (A and B) using four cascaded full adders.

Date 06 Aug 2026
Done code of half_adder, and full_adder which instantiate the half_adder code , used gate level modeling 

Date 07 aug 2026
input output port declaration , they we bydefault wire type 
but for the output : if assign is used with output then it can be wire only , but if output port is used with always then it must be reg because they store values assigned by procedural block 
2 bit comparator , 
A=B = A1’A0’B1’B0’ + A1’A0B1’B0 + A1A0B1B0 + A1A0’B1B0’
    : A1’B1’ (A0’B0’ + A0B0) + A1B1 (A0B0 + A0’B0’)
    : (A0B0 + A0’B0’) (A1B1 + A1’B1’)
    : (A0 Ex-Nor B0) (A1 Ex-Nor B1)
A>B = A1’B1 + A0’B1B0 + A1’A0’B0
A<B = A1B1’ + A0B1’B0’ + A1A0B0’

testbench write :
module designname_tb ; 
	//declaration wires , 
	//Instantiate design 
	//apply input stimulus 
	//observe outputs 
	//finish simulation 
endmodule
testbench : write module name as design_tb, use reg for inputs signal because it chnages the values "Design input  → Testbench reg",Design output → Testbench wire, 
instantiate connects circuit to the tester 
uut stands for unit under test , it is just name , it can be something else 
intial begin , this runs once when simulation starts
create waveform file : $dumpfile("filename"), $dumpvar(level,scope)
	dumpvar system task in verilog used to specify which variable should be recorded in a value change dump(VCD) 
	level 0=dump all var in specified scope, 1=dump only variables directly in the specified scope, >1=dumps var up to that specific hierarcy level below scope 
apply input test cases , $finish end simulation 

Date 08 aug 2026 
Made a testbench for the 2 bit comparator 
When design file is having [1:0] then in the testbench we also have to declared that in tb
compiling and executing verilog using icarus 
	iverilog -> compile
	vvp 	 -> simulation
	gtkwave  -> view waveforms 
	iverilog reads verilog file , checks verilog syntax, understand/elaborates the modules and their connections
	creates .out file , insort compile verilog code into a simulation program 
	vvp takes compiled file .out and executes it as a verilog simulation 
	vvp takes tb files test cases and starts simulation 
	vvp file also generates vcd file 

Date 09 aug 2026
DOne Mux desing with tb , 
Behaviour level modeling , Concert it as a black box which don't know the internal circuit , just know the i/p and o/p of it 
in it we have structure proceducers or sequencial blocks 
	always , initial blocks 
always = execute forever until simulation ends,
		Synthesizable block , at t=0 triggered ,and with simulation ends
		sindle line then no need to begin , multiple line need begin end
		if two always block return in the same module then both will execute at a time , hence verilog is concurant laguage parallel language at t=0 
		always blocks are sequencially , means statements written in the block will execute line by line
		sensitivity list == always @(sensitivity), which used for execute always block when the sensitivity is hit , otherwise block is not executes , always @(i0,i1,i2,i3) 
		always @(*) , * means implecation operator consider as all the input in the block 
		Rules for always block = 
			LHS variable can not be wire type 
			Nesting of always blocks can happnes 

Operators = Arithmetic , Logical , Relational , equality opearator , bitwise , reduction , Shift , conditional 
	if variable is having don't care value(x) output is unknow 
equality opearator= logical(== , !=) , case(=== , !==)
Reductionn(&,~&,|,~|,^,~^) = internal bits operation , every output will have single value 
Shift = logical = RS, >> , LS , <<
		arithmetic = >>>, <<<
conditional : condition ? true_value : false_value. 

Delay type : inter assignment (delay before assignment)
			intra assignment (delay after assignment )
Blocking and non blocking :
Blocking sing is '=', in blocking operator block the execution until it executes 
			a=0; b=0;, b will not executes until a 
Non blocking sing is '<=', in this statements are executing parallel 
			a <= 0; b<=0; , both will executes parallel, does not have to wait 

System task : built in function is having $ sign then it is system task, primary for display, debugging , tb
				not sysnthesizable 	
				$display, $write, $monitor, $strobe, $time, $stop, $finish, $random, $dumpvars, $dumpfile

Event Scheduler : Simulator data structure , manages dynamic scheduling , execution , ensure deterministic and pridictable simulation 
				It operates on a discrete event driven modle where simulation time is divided into slots and each time slot is subdivided into ordered event region 
				Event Scheduler has a structure like 
				Active, InActive, Non-blocking Assignment, Postpond at t=0 and this same structure will happnes with t=2 or another tick 
				After completing all the state of event scheduler it goes to another time unit 
		Active: Blocking assingment will executes, Evalution of RHS of Non-blocking, continuouse assigment , $statments execution, Evaluation of I/p's and updates of o/p's gate primitives happnes 
		ACTIVE REGION , NO UPDATED RHS to LHS
		├── Execute initial/always procedural statements
		├── Evaluate RHS of blocking assignments but not update the variable 
		├── Update blocking-assignment LHS
		├── Evaluate continuous assignments
		├── Evaluate gate primitives
		└── Trigger/schedule more events

		Inactive region contains events delayed by #0; they execute after the Active events of the current scheduling cycle but without advancing simulation time.

		NBA REGION , Non-blocking states got updated values , Evaluation of NBA is happned in t=0 , updated values will assign in t=1 in the variable 
		Postpond region , $monitor will execute and $display executes in active region , $strobe will execute in postpond 


Date 12 aug 2026
Latches: level sensitive devices, works on postivve(enable) signals 
For Combinational design we use blocking assignments, and for sequential design we use non blocking assignment 

| Feature               | Combinational Design                             | Sequential Design                            |
| --------------------- | ------------------------------------------------ | -------------------------------------------- |
| **Output depends on** | Present inputs only                              | Present inputs **+ previous state**          |
| **Memory**            | No memory                                        |  Has memory                                  |
| **Clock**             | Usually not required                             | Usually uses a clock                         |
| **Feedback**          | Generally absent                                 | Often present                                |
| **Examples**          | Adder, subtractor, multiplexer, decoder, encoder | Flip-flop, counter, register, shift register |
| **State**             | No state                                         | Has a state                                  |

Reset Circuit a structural control mechanism used to force all sequential elements (such as flip-flops and registers) into a known, predictable initial state (usually all zeros or ones) upon power-up, system recovery, or external command . Without it, storage components would initialize to random or unstable logic values. Types: Synchronous Reset, Asynchronous Reset
Synchronous Reset: The reset signal is sampled only on the active edge of the clock.
Asynchronous Reset: The reset signal forces the circuit into a reset state instantly, completely independent of the clock.
Advantages of reset circuits 
Initializing registers
Starting counters from zero
Putting FSMs into their initial state
Recovering from abnormal conditions
Bringing a chip into a known state after power-up
Latch = level-sensitive storage
Flip-flop = edge-triggered storage

S-R Latch , Set = Q , Reset = Q' using NOR gate 
S-R Latch , set 1 = Q =0, using nand gate 
if else, while, case statements, for
for example if you making a mux , and using if-else for it ,then you have to assign priority in if,else-if , but if you use case then not prioroty is used 

Mux using case and if statements 
timescale : timescale tells the Verilog simulator what a # delay means and how precisely time can be represented.
example : `timescale   1ns / 1ps
						│      │
						│      └── time precision(smallest time resolution )
						└───────── time unit

Date 13 aug 2026
why we use behavioural flow sequential design ?

T= 0 , q=0 
T=1 , q = ~q 

jk=00, q=hold
jk=01, q=reset
jk=10, q=set
jk=11, q=toggle
Done coding for T_latch , D_latch , jk_latch


Shift Register : 
it is a combination of flipflops mainly D , register is a circuit which can store data but shift register can shift it in serial or parallel manner 
Features : Data storage, Data transfer, Multiplication ,Division 
SISO, SIPO, PISO, PIPO
	Load	Read
SISO= n 	 n-1
SIPO= n 	 0
PISO= 1		 n-1
PIPO= 1 	 0

PISO circuit is different, it contains 2 and gate connected to 1 or gate , control= shift/load' , shift=0 then load operation , shift=1 then load disable 

Shifting can be made by two ways : 1.shift operator, 2.concatination operator 

Verilog Coding Style : 
for shifting and loading operation we use enb input which determined wheather to shift or load 
SISO = 1.right shift 2.left shift 
		
Code Logic = for SISO no shift / load mode is required by the enb
			temp <= temp >> 1'b1 //uses logical shift operator 
			 temp[0] <= s_in
			 s_out <= temp[3]
SIPO = for SIPO, enb is used for shift / load operation because type is different 
		shifting logic is same as siso 
		loading is , p_out<=temp

PISO = for PI load signal is used for load / shift operation 
		load = 1 , temp[3:0] <= p_in[3:0]; s_out<=temp[0];
		load = 0 , temp <= temp >> 1'b1/0;

PIPO = for PIPO 
		load =1, temp[3:0] <= p_in[3:0] 
		load =0, p_out[3:0] <= temp[3:0]

Date 14 aug 2026
Done coding for Registers , siso,sipo,piso,pipo, and Universal shift register 
use the logic of above and the enb pin for required logics, 
used switch cases in the USR , and for the tb of it make sure to gave intermediate times to settle down output, rst the case starting in tb  , rst the temp reg .

Counters : set of flip flop , whose state change in respose to pulses applied at the i/p 
	n bit counter = n ff , 2^n state, divides i/p freq by 2^n
	mode(modulus) counter = 2 bit , 4 state , mode-4 counter 

N = number of states , n = number of ff, if for mod 8 , then N=8{0,7} , n = 3{2^3=8} for this one rule 
N<=2^n

Mostly negetive edge trigger counters are used because , Negative-edge triggering is commonly used in ripple counters because the output transition of one flip-flop can conveniently provide the falling-edge clock for the next flip-flop.

Synchronous counter : same clock to every ff , output of each is independent 
	design will complex, High speed
Asynchronous counter : one clock to start , output is gated to second ff's block 
	low speed, also called ripple counter 

There are also types which are 
	Full modulus , Variable modulus, Hybrid modulus counters 
	Cascading ripple counter 
	Binary counter, BCD, Gray code, Ring, Jhonson, Decade 

ALso remeber , when to apply posedge clk in tb , negedge clk to dut , to settle down the tb inputs 

PCIE bus workshop : 
	serial point to point connected bus 
	scalable, symmetric(same number of lanes in each direction), dual simplex connection, Gb/s transfer data rate , packate based tranfer 

	Link width and lanes 
	Performance can be scable on the number of signal lanes implementation
	Lane & link 

	PCLe gen1,2,3 , increase number of lanes 

	NO common clock , one clock at tx, and embedded in the link and took by the rx.

	Example architecture 
	CPU --> switch, PCLe endpoint, PCIe bridge to PCI or PCI-X

	Root complex 

	PCIe specification gen3/5 book \

	Device Layers 
		Device A =Device core --> PCIe core Hardware/software -->{transactional , Data link, Physical} --Link --=  device B
	

Asynchronous counter : 
Done code for it , 
only first input q[0] will got clk , then q[1] and rest got clk via q[0] used another always block 
Each flip-flop toggles when its clock edge occurs, producing the binary counting sequence.”
always @(negedge clk) → FF0 toggles
always @(negedge q[0]) → FF1 toggles
always @(negedge q[1]) → FF2 toggles
always @(negedge q[2]) → FF3 toggles


Date 16 aug 2026
Multiple mode counter :
for mode 2,4,8,16
in the case , just check the codition if it under 2,4,8,15, and then increament the counter ,
and for reset the counter when new mode is selected , made a prev_mode , which make the counter 0 if the current  mode is not the previous mode , and in the case at last assign prev_mode <= mode.
Frequency division in the counter : we uses mode counter to view all the type the frquency division 55

RSIC v series 
https://www.youtube.com/watch?v=cDrVaS88ukg&list=PLqPfWwayuBvPNORfjuL46aL45-rYnDrM-

UART protocol 
https://www.youtube.com/watch?v=XaCBetvZjAs&list=PLqPfWwayuBvPNEejEgA82Xq_n4gk8f0Kk

UVM 
https://www.youtube.com/watch?v=yFlMGNQKs5U&list=PLqPfWwayuBvPb3keSEbSqTmkdowC-OL6M

Dataflow modeling 
assign <net data type > = <any data type>
assign , is a continous assignment , where the multiple assign blocks are running concurrantenly 

FSM design : is abstract model of describing sequencial circuit 
FSM is a logic circuit which can be in one state at a time and it will change state depending on 
	its current state and the input it receives 
IT is called machine because it define how circuit is behaves in resposnse to input over time 
IT is widely used in control logic, embedded systems , protocols 
Mainly used for 
	When the system behaviour depends on sequence of input, not just on the current input 
	TO model control flow in hardware 
	TO reduce complexity by dividing behavior into states, 
	To implement system that need memory of past actions (not possible with combinational logic alone)
	TO synchronize sequencial operations in digital circuits 

Finite : 
	Finite means that the machine can be only a limited number of state 

FSMs are mainly of two types , based on how outputs are generated 
	1.Mealy machine : o/p depends on I/P and P/s , Asynchronous o/p , no clock dependent , for change clk && i/p , it is combination of Combinational Circuit(Input state) + sequencial circuit (present state)
	2.moore machine : o/p depends on P/s only , Synchronous o/p , clock dependent , for change clk || input, Sequencial circuit (present state)

How to represent the fsm 
State Transition Diagram -> pictorial representation
State Table -> Tabular Representation
State Equations -> Algebraic Representation 

Seqence detactor 
Overlapping : It does not discard the previous bits when it finds the sequence 
	detect 101, 0010101, it does not discard 5 bits 
Non -overlapping : It discard the previous bits when it finds the sequence and resume bits 
	IN sequence detector , when we find sequence state will go to the previsious state , so that countinuosly detecting ongoing bits 
	detect 101, 0010101, it does discard the 5 bit and continue from 6th bit ,
	In sequence detector , when we find sequence state will go to IDLE 


Date 17 aug 2026 
FSM coding for sequence detector , used overlapping structure and mealy machine 

8x8 RAM project :::::
	8 number of position , 8 width of each location 
	used [63:0]block reg , for storing values [7:0] bits in each line(address)
	also faces challanges of clock ,and case will executes if read operation is having delay , because case statements will executes upper addresses during the delay 
	First used switch statements for it , then another things also present in the verilog 


Date 19 aug 2026 
FIFO : 
	Declared fifo as [7:0] mem[7:0] , measn 8 x8 mem
	w_ptr , r_ptr for location in mem

Date 20 aug 2026
UART Implementation 
	tx : parallel Byte -> serial UART bits 
	rx : serial UART bits -> paralle byte 

	LSB first in Uart bits transfer 
	Tx = 0(start) | 10000001 (data bits ) | 1(stop)

	module tx 
		i/p = clk, start ,[7:0]data_in, 
		o/p = tx, busy 

		BAUD_TICKS , this makes wait 10 clock ticks for every UART bits (problems i faced )

		frame <= {1'b1, data_in, 1'b0};//stop,data,start 
		busy =1 , bit_index=1, counter =10;
		so it did not accept another byte that time 

		else if (busy), counter decrement to 0 , when counter = 0 , tx=frame[bit_frame] , increment bit_index, and again set counter = 10 for another bit 

		bit_index tells TX which bit of frame it should output, bit_index
		bit_index = 0 ,tx=frame[0], start bit 
		bit_index==9, busy = 0, tx return to idel 

		tx = 1 , when nothing is transmitted, so that the stop condition(1) is fullfilled (Problems i faces )

		MEANS , counter count 10 clock cycle , set 1 bit_index bit , bit_index tells frame to set on every bit , frame executes start data_in stop operation 
TX:

      IDLE        UART FRAME             IDLE
       1       0 101... 1                1
       │       └──────────┘              │
       │           10 bits               │
       └─────────────────────────────────┘


	module rx 
		i/p = clk,rx,
		o/p = [7:0]data_out,done

	module test 
		#1 clk =~clk , means clk period is 2 simulation time units 

		Actual Hardware baud rate = 
			Baud Rate = clock frequency / Baud_TICKS 
			FPGA clock = 10 MHz
			BAUD_TICKS = 10	
			baud = 10 MHz / 10 = 10 Mbps
		.tx(tx_new) , .rx(tx_new), which creates connection in the initialization of the instantiation tx----------rx 
		
		by this instantiation , the rx wait for tx to set low , and then start reading data 
		but rx does not immediately assume it is valid it waits half a bit ,
		when rx detects edge at the beginning of the start bit , it sample near the middle
		this happnes in state=0

		state =1 
		

