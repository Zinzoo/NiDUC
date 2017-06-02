function out = gen_fromWav(sygnal)
    [wave,fs]=audioread(sygnal); 
    t=0:1/fs:(length(wave)-1)/fs;  
    %plot(t,wave);
    %zamiana z "vaveread" na "audioread"
    wavdata = audioread(sygnal);
    %%%%%%%%%%%
    wavbinary = dec2bin( typecast( single(wavdata(:)), 'uint8'), 8 ) - '0';
    %orig_size = size(wavdata);

    sygl=length(wavbinary);
    %wavdata = reshape( typecast( bin2dec( uint8(wavbinary + '0') ), 'single' ), orig_size );


    fprintf('%d\n',sygl);
    out = [];
    %file = fopen('sygnal.txt', 'wt');
    for k = 1 : sygl
      if(wavbinary(k)==1)
	      %fprintf(file,'%s\n','1');
		  out = [out 1];
       else
			%fprintf(file,'%s\n', '0');
			out = [out 0];
       end
    end
	%fclose(file); 
 end