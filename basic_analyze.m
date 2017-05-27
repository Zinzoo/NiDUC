function [] = basic_analyze()
    %Analiza wynikow
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
      if sygPrzed(k) ~= sygPo(k) %"~=" w matlabie to to samo co "!=" w octavie
        howMany = howMany + 1 ;
      end
    end
    difference = (howMany/dlugosc)*100;
    fprintf('Ile procent bitow sie rozni: %d',difference);
 end