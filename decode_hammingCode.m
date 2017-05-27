function[]  = decode_hammingCode(p)


    A = load('afterErrorsGeneration.txt', '-ascii');
    A_vector = A.';       
       m=3;
        while((2^m)-1 -m <p)  
        m=m+1;    
        end
       k=2^m-1 -m;
       n=2^m-1;
    
        q=0; % wielkorotnoœæ n 
        final=[]; % wektor na ostateczny wynik
        iteracja=ceil(length(A_vector)/n);

        
            for ( i= 1 : iteracja)

                    if(q+n<length(A_vector))
                             B=A_vector(q+1:q+n);    

                        out = decode(B,n,k,'hamming/binary');
                        out=out(1:p)    ;
                        final=[final out];
                        q=q+n;
                    else
                        B=A_vector(q+1:end)  ;  
                        n=length(B);
                        m=log2(n+1);
                        k=n-m;
                        
                      out = decode(B,n,k,'hamming/binary');

                        final=[final out];

                    end
                        
            end
         
   
    fid1=fopen('output.txt','wt');
    fprintf(fid1,'%d\n',final);
    fclose(fid1);



end

