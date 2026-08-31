//have to detect 1010 sequece using overlapping sequence counter using mealy machine

module sequence(
    input clk,rst,din,
    output reg q
);
reg [3:0] ps, ns;
parameter idle = 2'b00 ;
parameter s1 = 2'b01;
parameter s2 = 2'b10 ;
parameter s3 =  2'b11;

always @(posedge clk)begin //Sequencial Block 
    if(rst)begin
        q <= 0;
        ps <= idle;
    end
    else ps <= ns;
end
always@(*)begin //NextState combinational block
        case(ps)
            idle:begin
                if(din == 1'b1) begin
                    ns = s1; 
                end
                else ns = idle;
            end
            s1:begin
                if(din == 1'b0)begin
                    ns = s2;
                end
                else ns = s1;
            end

            s2:begin
                if(din == 1'b1)begin
                    ns = s3;
                end
                else ns = s2;
            end

            s3:begin
                if(din == 1'b0)begin
                    ns = s2;
                   // q  = 1;
                end
                else begin
                    ns = s1;
                    q = 0;
                end 
            end

        endcase
 end    

 always @(posedge clk) begin // Present state combinational block /o/p block 
    if(rst)begin
        q <= 0;
        ps <= idle;
    end
    else begin
        case(ps)
            idle: q <= 0;
            s1: q<= 0;
            s2: q<=0;
            s3: begin
                if(din == 1'b0) q <= 1;
                else q <= 0;

            end 
            default: q <= 0;
        
        endcase

    end

 end

endmodule

`timescale 1ps/1ps

module tb;
reg clk,rst,din;
wire q;

sequence dut(
    clk,rst,din,q
);

initial begin
    $dumpfile("sequence.vcd");
    $dumpvars(0,tb);
    {clk,rst,din} =0;
    
end

always #5 clk = ~clk;

initial begin
    rst = 1;
    din = 0;

    #10;
    rst = 0;

    din = 1;
    #10;
    din = 0;
    #10;
    din = 1;
    #10;
    din = 0;
    #10;

    // Overlapping occurrence
    din = 1;
    #10;
    din = 0;
    #10;

    $finish;
end
endmodule
