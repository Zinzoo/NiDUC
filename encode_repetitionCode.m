function [] = encode_repetitionCode()
    %Proces kodowania poprzez zwielokrotnienie kazdego elementu
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
 end