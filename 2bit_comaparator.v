module two_bit_comparator(
    input [1:0] a,b, 
    output gt,eq,lt
);
wire[12:0] w;
not n1(w[0],a[1]); //a1'
not n2(w[1],a[0]); //ao'
not n3(w[2],b[1]); //b1'
not n4(w[3],b[0]); //b0'



and a1(w[5],a[0],w[2],w[3]);
and a2(w[6],a[1],w[2]);
and a3(w[7],a[1],a[0],w[3]);

xnor xn1(w[8],a[0],b[0]);
xnor xn2(w[9],a[1],b[1]);

and a4(w[10],w[0],w[1],b[0]);
and a5(w[11],w[1],b[1],b[0]);
and a6(w[12],w[0],b[1]);


or or1(gt,w[5],w[6],w[7]);
and eq1(eq,w[8],w[9]);
or or3(lt,w[10],w[11],w[12]);

endmodule
