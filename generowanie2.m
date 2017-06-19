function [] = generowanie2();
  [wave,fs]=audioread('sygnal.wav'); 
t=0:1/fs:(length(wave)-1)/fs;  
plot(t,wave);

dlugoscSygnalu=wavread('sygnal.wav','size'); %dlugosc sygnalu wejsciowego
max=intmax('int32');
maxpaczka = max/4;
fprintf('%d\n',dlugoscSygnalu);
maks=int32 (max);
pakiet= maks; %mozliwosc podzialu sygnalu na pakiety

wavdata1 = wavread('sygnal.wav',2018616); %wczytujemy sygnal wejsciowy
wavbinary1 = dec2bin( typecast( single(wavdata1(:)), 'uint8'), 8 ) - '0';
%plot(t,wavdata1);
%orig_size = size(wavdata);
%wavdata = reshape( typecast( bin2dec( uint8(wavbinary + '0') ), 'single' ), orig_size );
%fprintf('%d\n',sygl);

sygl=length(wavbinary1);
file = fopen('sygnal.txt', 'wt');
for k = 1 : sygl
  if(wavbinary1(k)==1)
	  fprintf(file,'%s\n','1');
   else
    fprintf(file,'%s\n', '0');
   end
end
fclose(file); 
end