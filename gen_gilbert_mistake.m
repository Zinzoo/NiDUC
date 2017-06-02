function [out , errors] = gen_gilbert_mistake(p, r, A)

  A_vector = A;
    
  
  good = 1;
  errors = 0;   
 
  out = [];
    for n = 1:size(A_vector,2)
        if good == 1
            good = rand(1) > p;
            out = [out A_vector(1,n)];
        elseif good == 0
            out = [out ~A_vector(1,n)];
            good = rand(1) > (1-r);
            errors = errors +1;
        else
            fprintf('Error\n');
            break;
        end
    end
end
