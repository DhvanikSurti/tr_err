module ram(
    input clk,rst,w_enb,
    input [2:0]w_addr,
    input [2:0]r_addr,
    input [7:0]data_in,
    output reg [7:0]data_out
);
reg [63:0] block;
always @(posedge clk) begin
    if(rst)begin
        data_out <= 0;
        
    end

    else if(w_enb)begin
        case(w_addr)
            3'b000:begin
                block[7:0] <= data_in[7:0];
            end
             3'b001:begin
                block[15:8] <= data_in[7:0];
            end
             3'b010:begin
                block[23:16] <= data_in[7:0];
            end
             3'b011:begin
                block[31:24] <= data_in[7:0];
            end
             3'b100:begin
                block[39:32] <= data_in[7:0];
            end
             3'b101:begin
                block[47:40] <= data_in[7:0];
            end
             3'b110:begin
                block[55:48] <= data_in[7:0];
            end
             3'b111:begin
                block[63:56] <= data_in[7:0];
            end
        endcase
    end        
    else if(w_enb == 0)begin
        case(r_addr)
             3'b000:begin
                data_out[7:0] <= block[7:0]; 
            end
             3'b001:begin
                data_out[7:0] <= block[15:8];
            end
             3'b010:begin
                data_out[7:0] <= block[23:16];
            end
             3'b011:begin
                data_out[7:0] <= block[31:24];
            end
             3'b100:begin
                data_out[7:0] <= block[39:32];
            end
             3'b101:begin
                data_out[7:0] <= block[47:40];
            end
             3'b110:begin
                data_out[7:0] <= block[55:48];
            end
             3'b111:begin
                data_out[7:0] <= block[63:56];
            end
        endcase
    end
end
endmodule

`timescale 1ps/1ps

module tb;

reg clk,rst,w_enb;
reg [2:0]w_addr,r_addr;
reg [7:0]data_in;
wire [7:0]data_out;

ram dut(
    clk,rst,w_enb,w_addr,r_addr,data_in,data_out
);

initial begin
    {clk,rst,w_enb,w_addr,r_addr,data_in} = 0;
end
always #5 clk = ~clk;
initial begin
    $dumpfile("ram.vcd");
    $dumpvars(0,tb);
    rst =1;#10; rst =0;
    w_enb =1 ;
    #10;
    w_addr = 3'b000;
    
    data_in = 8'b01010101;
    #10;
    w_enb =0;
    //#10; don't use because it will take another upper adderess data 
    r_addr = 3'b001;
    #50;
    $finish;


end
endmodule