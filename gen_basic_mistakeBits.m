function [out , errors] = gen_basic_mistakeBits(p, signal)
    %Generowanie bledow
    %Zmiana sygnalu zgonie z rozkladem rownomiernym
    %Ustawienia

    %Odczyz z pliku do wektora
    %A_vector = load(filename, '-ascii');
    %A = A_vector.';
    A = signal;
    
    %Wyliczanie parametrów
    errors = 0;
    out = [];
    %Wytwarzanie bledow
    for i = 1:size(signal,2)
        isBad = rand(1) < p;
        if(isBad)
            errors = errors +1;
            out = [out bitxor(1, A(i))];
        else
            out = [out A(i)];
        end;
    end
     
 end