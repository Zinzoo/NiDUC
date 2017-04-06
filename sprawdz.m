dlugosc=1000;
#[sygPrzed(dlugosc)] = load('sygnal.txt');
#disp(sygPrzed);
sygPrzed = zeros(1,dlugosc);
sygPo = zeros(1,dlugosc);
#file = fopen('sygnal.txt', 'rt');
#a=0;
#for k = 1 : dlugosc
#  
#  a = fscanf(file, '%d');
#  sygPrzed(k)=a;
#end
#fclose(file);
#fprintf('\n');
load('sygnal.txt');
for k = 1 : dlugosc
  sygPrzed(k)=sygnal(k);
end

load('sygnalPo.txt');
for k = 1 : dlugosc
  sygPo(k)=sygnalPo(k);
end
howMany = 0;
for k = 1 :dlugosc
  if sygPrzed(k) != sygPo(k)
    howMany = howMany + 1 ;
  end
end
difference = (howMany/dlugosc)*100;
fprintf('Ile procent bitow sie rozni: %d',difference);