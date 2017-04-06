clear all;

dlugoscSygnalu = 1000; #niech nasz sygnal ma 1000 bitow
tabSygnal = rand(1,dlugoscSygnalu); #losowanie liczby od 0 do 1
for k = 1 : dlugoscSygnalu
   if tabSygnal(k)> 0.5
      tabSygnal(k) = 1;
   else
      tabSygnal(k) = 0;
   end
end

#wyswietlamy nasz sygnal
disp(tabSygnal);
#lub
fprintf('Sygnal: \n');
fprintf('%d',tabSygnal);

#zapis naszego sygnalu do pliku

file = fopen("sygnal.txt", "wt");
for k = 1 : dlugoscSygnalu
  if(tabSygnal(k)==1)
	  fprintf(file,'%s\n','1');
   else
    fprintf(file,'%s\n', '0');
   end
end
fclose(file); 

%otworzenie pliku .txt oraz przeniesienie jego wartoœci do wektora

A_vector = load('sygnal.txt', '-ascii'); % read the data
A = A_vector.'; %' transpose

%potrojenie ka¿dego elementu w macierzy A za pomoc¹ funkcji repmat
out=repmat(A,3,1)
out=out(:)';

%zapis macierzy z potrojonymi elementami do pliku
fid = fopen('afterRepetition.txt','wt');
for i = 1:size(out,1)
    fprintf(fid,'%d\n',out(i,:));
end
fclose(fid)