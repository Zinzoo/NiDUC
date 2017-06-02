function out = decode_repetitionCode(input)
    %Dekodowanie
	A = input;
    %A = load('afterErrorsGeneration.txt', '-ascii');
    A_vector = A.';

    B_vector=[];
   % for i=0:(size(A_vector)(2)/3)-1
  % for i=0:(size(A_vector)/3)-1
  %i=0;
  x= size(A_vector);
  for i=0:((x(1)/3)-1)
    s1=A_vector(3*i +1) ;
    s2=A_vector(3*i +2);
    s3=A_vector(3*i +3);
      if s1+s2+s3>1
         
        B_vector = [B_vector 1] ;
      else
         
        B_vector = [B_vector 0];
      end
  
  end

    %zapis wektora do pliku .txt
 
    %fid1=fopen('output.txt','wt');
    %fprintf(fid1,'%d\n',B_vector);
    %fclose(fid1);
	out = B_vector;
	
 end