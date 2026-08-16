module multi_mode(
    input clk,rst,
    input [1:0] mode,
    output reg [3:0]count
);

reg [1:0] prev_mode;
always @(negedge clk)begin
    if(rst)begin
        count<=4'b0000;
    end
    else if (mode != prev_mode) begin
        count     <= 4'b0000;
        prev_mode <= mode;
    end
    else begin
        case(mode)
            2'b00:begin
               
                if(count == 4'd1) count <= 4'b0;
                else count <= count + 1'b1; 
            end

            2'b01:begin
                if(count == 4'd3) count <= 4'b0;
                else count <= count + 1'b1;
            end

            2'b10:begin
                if(count == 4'd7) count <= 4'b0;
                else count <= count + 1'b1;
            end

            2'b11:begin
                if(count == 4'd15) count <= 4'b0;
                else count <= count + 1'b1;
            end
        endcase 
        prev_mode <= mode;
    end
end
endmodule


`timescale 1ps/1ps
module tb;

reg clk,rst;
reg [1:0]mode;
wire [3:0]count;

multi_mode dut(
    clk,rst,mode,count
);

initial begin
    $dumpfile("multi_mode.vcd");
    $dumpvars(0,tb);
    {clk,rst,mode} = 0;
end

always #5 clk =~clk;

initial begin
    rst = 1;
    #10;
    rst =0;

    mode = 2'b00;
    #10;
   // rst =1; #10;rst= 0;
    mode = 2'b01;
    #30;
   // rst =1; #10;rst= 0;
    mode = 2'b10;
    #70;
   // rst =1; #10;rst= 0;
    mode = 2'b11;
    #150;

    #10;
    $finish;

end
endmodule