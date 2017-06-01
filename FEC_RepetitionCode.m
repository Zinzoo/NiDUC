clear all;

p=11; %
b=0.9
%gen_repetitionCode();
gen_fromWav();
%generowanie2();

n=encode_hammingCode(p);
%n=encode_repetitionCode();

gen_basic_mistakeBits(b);
%gen_gilbert_mistake(); 
decode_hammingCode(p)

%decode_repetitionCode();

basic_analyze();
n