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

