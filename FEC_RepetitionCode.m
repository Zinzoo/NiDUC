clear all;

%gen_repetitionCode();
gen_fromWav();
%generowanie2();


encode_repetitionCode();

%gen_basic_mistakeBits();
gen_gilbert_mistake();


decode_repetitionCode();


basic_analyze();