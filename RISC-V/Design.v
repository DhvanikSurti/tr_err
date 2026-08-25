
module Program_counter(clk,reset,Pc_in,Pc_out);
input clk,reset;
input [31:0] Pc_in;
output reg [31:0]Pc_out;

always @(posedge clk or posedge reset)
begin
    if(reset)
        Pc_out <= 32'b00;
    else
        Pc_out <= Pc_in;
end
endmodule

module PCplus4(fromPC,nextPC);
input [31:0] fromPC;
output [31:0] nextPC;
assign nextPC = 4 + fromPC;
endmodule

module Instruction_mem (clk,reset,read_address,instruction_out);
input clk,reset;
input [31:0] read_address;
output reg [31:0] instruction_out;
integer k;
reg [31:0] I_mem[63:0];

always @(posedge clk or posedge reset)
begin 
    if(reset)
        for(k=0;k<64;k=k+1) I_mem[k] <= 32'b00;
    else 
        instruction_out <= I_mem[read_address[7:2]];
end
endmodule

module reg_file(clk,reset,RegWrite,rs1,rs2,RD,Write_data,read_data1,read_data2 );
input clk, reset , RegWrite;
input [4:0] rs1,rs2,    RD;
input [31:0] Write_data;
output [31:0] read_data1, read_data2;
reg [31:0] Registers[31:0]; //reg file of 32x32 , 32 addresses 32 bit each , so it can store 1024 bits
integer k;
always @(posedge clk or posedge reset)
begin
    if(reset)
        for(k=0;k<32;k=k+1) Registers[k] <= 32'b00;
    else if(RegWrite) Registers[RD]<=Write_data; // 
end

assign read_data1 = Registers[rs1];
assign read_data2 = Registers[rs2];
endmodule

module ImmGen(Opcode , instruction, ImmExt);
input [6:0] Opcode;
input [31:0] instruction ;
output reg [31:0] ImmExt;
always @(*)
begin
    case(Opcode)
    7'b0000011 : ImmExt <= {{20{instruction[31]}},instruction[31:20]};
    7'b0100011 : ImmExt <= {{20{instruction[31]}},instruction[31:25],instruction[11:7]};
    7'b1100011 : ImmExt <= {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
    default: ImmExt = 32'b0;
    endcase
end
endmodule

module Control_Unit(instruction, Branch , MemRead, MemtoReg, ALUop, MemWrite, ALUSrc, RegWrite);
input [6:0] instruction;
output reg Branch , MemRead, MemtoReg, MemWrite, RegWrite,ALUSrc;
output reg [1:0] ALUop;
always @(*)
begin
    case(instruction)
    7'b0110011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop}<= 8'b00100001;
    7'b0000011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop}<= 8'b11110000;
    7'b0100011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop}<= 8'b10001000;
    7'b1100011 : {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop}<= 8'b00000101;
    default:     {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUop}<= 8'b00000000;
    endcase
end  
endmodule

module ALU_unit(A,B,Control_in, ALU_Result, zero);
input [31:0] A,B;
input [3:0] Control_in;
output reg zero;
output reg [31:0] ALU_Result;
always @(Control_in or A or B )
begin
    case(Control_in)
    4'b0000:begin zero <= 0; ALU_Result <= A & B; end
    4'b0001:begin zero <= 0; ALU_Result <= A | B; end
    4'b0010:begin zero <= 0; ALU_Result <= A + B; end
    4'b0110:begin ALU_Result <= A - B; zero <= (A == B); end
    endcase
end
endmodule

module ALU_Control(ALUOp, fun7,fun3,Control_out);
input fun7;
input [2:0] fun3;
input [1:0] ALUOp;
output reg [3:0] Control_out;
always @(*)
begin
    case({ALUOp, fun7 , fun3})
    6'b000000 : Control_out <= 4'b0010;
    6'b010000 : Control_out <= 4'b0110;
    6'b100000 : Control_out <= 4'b0010;
    6'b101000 : Control_out <= 4'b0110;
    6'b100111 : Control_out <= 4'b0000;
    6'b101110 : Control_out <= 4'b0001;
    default:    Control_out <= 4'b0000;
    endcase
end
endmodule

module Data_Memory(clk,reset,MemWrite, MemRead , read_address, Write_data, MemData_out);
input clk, reset, MemWrite, MemRead;
input [31:0] read_address, Write_data;
output [31:0] MemData_out;
reg [31:0] D_Memory[63:0];
integer k;

// Inside Data_Memory module
always @(posedge clk or posedge reset)
begin 
    if(reset)
        for(k=0;k<64;k=k+1) D_Memory[k]<= 32'b00;
    else if(MemWrite) D_Memory[read_address[7:2]] <= Write_data; // Use word address
end

assign MemData_out = (MemRead) ? D_Memory[read_address[7:2]] : 32'b00; // Use word address
endmodule

module Mux1(sel1,A1, B1, Mux1_out);
input sel1;
input [31:0] A1, B1;
output [31:0] Mux1_out;
assign Mux1_out = (sel1==1'b0) ? A1 : B1 ;
endmodule

module Mux2(sel2,A2, B2, Mux2_out);
input sel2;
input [31:0] A2, B2;
output [31:0] Mux2_out;
assign Mux2_out = (sel2==1'b0) ? A2 : B2 ;
endmodule

module Mux3(sel3,A3, B3, Mux3_out);
input sel3;
input [31:0] A3, B3;
output [31:0] Mux3_out;
assign Mux3_out = (sel3==1'b0) ? A3 : B3 ;
endmodule

module AND_logic(Branch,zero,and_out);
input Branch, zero;
output and_out;
assign and_out = Branch & zero;
endmodule

module Adder(in_1, in_2 , Sum_out);
input [31:0] in_1,in_2;
output [31:0] Sum_out;
assign Sum_out = in_1 + in_2;
endmodule