function [] = gen_gilbert_mistake()
  p = 0.02777;  % Good state to bad state
  r = 0.25;     % Bad state to good state

  A_vector = load('afterRepetition.txt', '-ascii');
  A = A_vector.';
  
  % Load from file if pattern file exists
  if(exist('gilbert_error_pattern.txt','file') == 2)
    error_pattern = load('gilbert_error_pattern.txt','-ascii')
  else
    error_pattern = [];
  end;
  
  % If sizes of data differ, generate new pattern
  if rows(error_pattern) != rows(A_vector)    
    check = 100;
    while check >= 10
      good = 1;
      error_pattern = [];
      size = 1;   
      
      
        % Generation of error pattern matrix
        while size <= columns(A)
          
            if good == 1
                error_pattern = [error_pattern good];
                good = rand(1) > p;
            elseif good == 0
                error_pattern = [error_pattern good];
                good = rand(1) > (1-r);
            else
                fprintf('Error\n');
                break;
            end
            size = size + 1;
          end
        
        received_packs = nnz(error_pattern);
        theo_pack_loss_rate = 1 - r / (p+r);
        act_pack_loss_rate = 1 - received_packs/columns(A);

        check = abs(theo_pack_loss_rate - act_pack_loss_rate) / theo_pack_loss_rate * 100;
        
        
      end    
      
    %zapis wzoru b³êdu do pliku
    fid = fopen('gilbert_error_pattern.txt','wt');
    for i = 1:size(error_pattern,1)
       fprintf(fid,'%d\n',error_pattern(i,:));
    end
    fclose(fid)
  end

    
  out = [];
  
  % Making errors on input matrix
  for i = 1:size(error_pattern,1)
    if error_pattern(i,:) == 0
      out(i,:) = bitxor(1, A(i));
    elseif error_pattern(1,:) == 1
      out(i,:) = A(i);
    end
  end  

  %zapis macierzy z potrojonymi elementami do pliku
  fid = fopen('afterErrorsGeneration.txt','wt');
  for i = 1:size(out,1)
     fprintf(fid,'%d\n',out(i,:));
  end
  fclose(fid)
end
