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
%disp(tabSygnal);
#lub
%fprintf('Sygnal: \n');
%fprintf('%d',tabSygnal);

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


#Proces kodowania poprzez zwielokrotnienie kazdego elementu
%otworzenie pliku .txt oraz przeniesienie jego wartoœci do wektora

A_vector = load('sygnal.txt', '-ascii');
A = A_vector.';

%potrojenie ka¿dego elementu w macierzy A za pomoc¹ funkcji repmat
out=repmat(A,3,1)
out=out(:)';

%zapis macierzy z potrojonymi elementami do pliku
fid = fopen('afterRepetition.txt','wt');
for i = 1:size(out,1)
    fprintf(fid,'%d\n',out(i,:));
end
fclose(fid)


#Generowanie bledow
%Zmiana sygnalu zgonie z rozkladem rownomiernym
%Ustawienia
filename = "afterRepetition.txt";
ber = 0.3;

%Odczyz z pliku do wektora
A_vector = load(filename, '-ascii');
A = A_vector.'; 

%Wyliczanie parametrów
totalBIT = length(A);
toChange = floor(ber*totalBIT);


%Wytwarzanie bledow
for i = 1:toChange
    currIndex = randi(totalBIT);
    A(currIndex) = bitxor(1, A(currIndex));
end
    
   
A=A(:)';
%Zapis do pliku
fid = fopen('afterErrorsGeneration.txt','wt');
for i = 1:size(A,1)
    fprintf(fid,'%d\n',A(i,:));
end
fclose(fid)


#Dekodowanie
A = load('afterErrorsGeneration.txt', '-ascii');
A_vector = A.';

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


#Analiza wynikow
dlugosc=1000;

sygPrzed = zeros(1,dlugosc);
sygPo = zeros(1,dlugosc);

load('sygnal.txt');
for k = 1 : dlugosc
  sygPrzed(k)=sygnal(k);
end

load('output.txt');
for k = 1 : dlugosc
  sygPo(k)=output(k);
end
howMany = 0;
for k = 1 :dlugosc
  if sygPrzed(k) != sygPo(k)
    howMany = howMany + 1 ;
  end
end
difference = (howMany/dlugosc)*100;
fprintf('Ile procent bitow sie rozni: %d',difference);