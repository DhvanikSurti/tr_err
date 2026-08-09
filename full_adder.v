
module full_adder(
    input a_fa,b_fa,cin_fa,
    output reg sum , carry 
);

always @(*) begin
    sum = a_fa ^ b_fa ^ cin_fa;
    carry = (a_fa&b_fa) | (cin_fa & (a_fa ^ b_fa));
end
endmodule

`timescale 1ps/1ps
module tb;
reg a,b,c;
wire sum,carry;

full_adder uut (
    .a_fa(a),
    .b_fa(b),
    .cin_fa(c),
    .sum(sum_tb),
    .carry(carry_tb)
);
initial begin
    $dumpfile("half.vcd");
    $dumpvars(0,tb);
    
    a = 0; b=0; c=0;
    #10;a=0;b=0;c=1;
    #10;a=0;b=1;c=0;
    #10;a=0;b=1;c=1;
    #10;a=1;b=0;c=0;
    #10;a=1;b=0;c=1;
    #10;a=1;b=1;c=0;
    #10;a=1;b=1;c=1;
    #10;
    $finish;

end

endmodule