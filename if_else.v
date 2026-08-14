module mux_if(
    input a,b,
    input reg s,
    output reg y
);
always@(*)begin
    if(s == 1) begin
        y = b;
    end
    else begin
        y=a;
    end
end

endmodule
`timescale 1ps/1ps

module tb;

    reg a,b;
    reg s;
    wire y;

    mux_if uut(.a(a),.b(b),.s(s),.y(y));
    initial begin
        $dumpfile("if.vcd");
        $dumpvars(0,tb);
        a=0;b=0;s=0;
        forever begin
            for (integer i=0;i<4;i=i+1)begin
            a=i[1];
            b=i[0];
            s=i[0];
            s=i[1];
            #10;
        end
 
        end
       
        s = 0;
        #10;
        s = 1;
        #10;
        s = 0;
        #10;
        s = 1;
        #10;
    end
endmodule