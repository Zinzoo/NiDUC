clear all;

%otworzenie pliku .txt oraz przeniesienie jego wartoœci do wektora
file = fopen('input.txt', 'r');
A_vector = fgets(file);
A=sscanf(A_vector,'%d', Inf);
A=A(:)';
fclose(file);

%potrojenie ka¿dego elementu w macierzy A za pomoc¹ funkcji repmat
out=repmat(A,3,1)
out=out(:)';

%zapis macierzy z potrojonymi elementami do pliku
fid = fopen('Mymatrix.txt','wt');
for i = 1:size(out,1)
    fprintf(fid,'%d ',out(i,:));
end
fclose(fid)