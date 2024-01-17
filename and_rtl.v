module and_rtl(a,b,y);
input a,b;
output y;
//assign y=a & b;
assign y=a | b; //or
//assign y=a ^ b;// exor
//assign y=~(a ^ b); // exnor
endmodule
