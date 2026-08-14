module d_latch(
    input enb,rst,d,
    output reg q,q_bar

);

always @ (enb)begin
    if(!enb)begin
        //reset logic
        if(rst) begin
            q = 1'b0;
            q_bar = 1'b1;
        end

        else begin
            q <= d;
            q_bar <= ~d;
        end
    end
end
endmodule

`timescale 1ps/1ps
module tb;

reg enb,rst,d;
wire q,q_bar;

d_latch uut(enb,rst,d,q,q_bar);
initial begin
    {enb,rst,d} = 0;
end

always #5 enb = ~enb ;

initial begin
    $dumpfile("d_latch.vcd");
    $dumpvars(0,tb);
    rst = 1;
    #10;
    rst = 0;
    d = 1;
    #10;
    d =0;
    #10;
    rst = 1;
    #5;
    
    $finish ;
end
endmodule
