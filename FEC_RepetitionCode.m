clear all;

p=11; %
%gen_repetitionCode();
gen_fromWav();
%generowanie2();

encode_hammingCode(p);
%encode_repetitionCode();

gen_basic_mistakeBits();
%gen_gilbert_mistake(); 
decode_hammingCode(p)

%decode_repetitionCode();

basic_analyze();