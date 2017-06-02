function [] = basic_analyze(raw, decoded, fromMedium, analizeOutputFile,errors, p1, p2)
    %Analiza wynikow
        
    if(size(raw) ~= size(decoded))
        if(size(raw,1) ~= 1)
            raw = raw.';
        end
        if(size(decoded,1) ~= 1)
            decoded = decoded.';
        end
    end
    
    dlugosc=size(raw,2);

    %sygPrzed = zeros(1,dlugosc);
    %sygPo = zeros(1,dlugosc);

    
    howMany = numel(find(raw~=decoded));
 %   for k = 1 :dlugosc
   %   if raw(k) ~= decoded(k) %"~=" w matlabie to to samo co "!=" w octavie
     %   howMany = howMany + 1 ;
      %end
    %end

    difference = (howMany/dlugosc)*100;

  fid = fopen(analizeOutputFile,'at');  
  fprintf(fid, '%d;%d;%d;%d;%d;', size(fromMedium,2)/size(raw,2), difference,errors, p1, p2);
  fprintf(fid, '\n');
  fclose(fid);
    
 end