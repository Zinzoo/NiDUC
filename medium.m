%Ustawienia
filename = "afterRepetition.txt";

%Odczyz z pliku do wektora
A_vector = load(filename, '-ascii');
A = A_vector.'; 

display(A);

%Zapis do pliku
fid = fopen('afterErrorsGeneration.txt','wt');
for i = 1:size(out,1)
    fprintf(fid,'%d\n',out(i,:));
end
fclose(fid)