// module half_adder(input a,b,output s,c);

// assign s = a ^ b;
// assign c = a & b ;
// endmodule

// module tb;

// reg a,b;
// wire s,c;
// half_adder dut(a,b,s,c);
// initial begin
//     #10;
//     a=1;b=1;#10;
//     a=0;b=1;#10;
// end
// initial begin
//     $monitor("time=%0t a=%0b b=%0b sum=%0b carry=%0b",$time,a,b,s,c);#10;

// end
// endmodule

//fulladder
// module full_adder(input a,b,c,output s,carry);

// assign s = a ^ b ^c ;
// assign carry = a&b | b&c | c&a;
// endmodule

// module tb;

// reg a,b,c;
// wire s,carry;
// full_adder dut(a,b,c,s,carry);
// initial begin
//     #10;
    
//     {a,b,c} = 3'b101;#10;
//     {a,b,c} = 3'b000;#10;
//     {a,b,c} = 3'b111;#10;
//     {a,b,c} = 3'b001;#10;
// end
// initial begin
//     $monitor("time=%0t a=%0b b=%0b c=%0b sum=%0b carry=%0b",$time,a,b,c,s,carry);#10;

// end
// endmodule
// //----------------------------------

//FA using two half_adder
module half_adder1(input a,b,output s,c);

assign s = a ^ b;
assign c = a & b;
endmodule

module half_adder2(input a,b,output s,c);

assign s = a ^ b;
assign c = a & b;
endmodule

module full_adder(input a,b,cin, output fa_sum,fa_carry);

wire w1,w2,w3;
half_adder1 dut1(.a(a),.b(b),.s(w1),.c(w2));
half_adder2 dut2(.a(w1),.b(cin), .s(fa_sum),.c(w3));
assign fa_carry = w2 | w3;
endmodule

module tb;

reg a,b,cin;
wire fa_carry, fa_sum;

full_adder dut(a,b,cin,fa_sum,fa_carry);
initial begin
    #10;
    {a,b,cin} = 3'b101;#10;
    {a,b,cin} = 3'b000;#10;
    {a,b,cin} = 3'b111;#10;
    {a,b,cin} = 3'b110;#10;
end

initial begin
    $monitor("values are a=%0b b=%0b c=%0b sum=%0b carry=%0b",a,b,cin,fa_sum,fa_carry);
end
endmodule

