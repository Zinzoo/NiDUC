%Ustawienia
filename = "afterRepetition.txt";
ber = 0.3;

%Odczyz z pliku do wektora
A_vector = load(filename, '-ascii');
A = A_vector.'; 

%Wyliczanie parametrów
totalBIT = length(A);
toChange = floor(ber*totalBIT);


%Wytwarzanie b³êdów
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