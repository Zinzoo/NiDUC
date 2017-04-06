clear all;


A = load('input.txt', '-ascii'); % read the data
A_vector = A.'; %' transpose


B_vector=[];

for i=0:(size(A_vector)(2)/3)-1

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
 
 fid1=fopen('output.txt','wt');
fprintf(fid1,'%d\n',B_vector);
fclose(fid1);
 

