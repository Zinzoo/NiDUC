clear all;

p=11; %
b=0.1;
sygnal=[1;1;1;1;1;1;1];
sygnal=sygnal';
%gen_repetitionCode();
%gen_fromWav();
%generowanie2();
 sygnal=encode_read_salomon(sygnal,3,15);
%sygnal=encode_hammingCode(p,sygnal);
%n=encode_repetitionCode();

sygnal=gen_basic_mistakeBits(b,sygnal);
 sygnal=decode_read_salomon(sygnal,3,15);

%gen_gilbert_mistake(); 
%sygnal=decode_hammingCode(p,sygnal)
sygnal
%decode_repetitionCode();

%basic_analyze();
%n