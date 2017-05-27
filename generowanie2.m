function [] = generowanie2();
  [wave,fs]=audioread('sygnal2.wav'); 
  t=0:1/fs:(length(wave)-1)/fs;  
  plot(t,wave);
  
  %dlugosc sygnalu wejsciowego
  dlugoscSygnalu = wavread('sygnal2.wav', 'size');   %Tutaj wywala ostrzezenie, ze wavread jest przestarzaly, niby liczy dalej ale cos z pakietami jest nie tak
  %Trzeba zamieniæ na coœ innego, audioread nie ma opcji 'size'
  
  max=sizemax()/2;
  fprintf('%d\n',dlugoscSygnalu);
  maks=int32 (max);
  pakiet= maks; %mozliwosc podzialu sygnalu na pakiety

  %wavdata1 = wavread('sygnal2.wav',10000); %wczytujemy sygnal wejsciowy
  %zamiana waveread na audioread
  wavdata1 = audioread('sygnal2.wav',10000); %wczytujemy sygnal wejsciowy
  
  
  wavbinary1 = dec2bin( typecast( single(wavdata1(:)), 'uint8'), 8 ) - '0';

  %orig_size = size(wavdata);
  %wavdata = reshape( typecast( bin2dec( uint8(wavbinary + '0') ), 'single' ), orig_size );
  %fprintf('%d\n',sygl);

  sygl=length(wavbinary1);                                                        %Tutaj nazwa zmiennej byla wavbinary, a nie wavbinary1, przez to nie chcialo w ogole funkcji dalej realizowac    
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