function out  = encode_hammingCode(p, sygnal)


    A_vector = sygnal;
    A = A_vector.';
    %p-wielkos� paczki wchodzi do programu jako argument
    
    %encode( msk ,n ,k)
    %n-d�ugo�� kodu(wyjdzie po zakodowaniu) musi mie� posta� 2^m -1
    %k-d�ugo�� wiadomo�ci k=n-m
    % m - liczba naturalna wi�ksza,r�wna od 3 {3,4,5,6....}
    
    %musimy znale�� takie najbardzej optymalne n i k
    %k=2^m -1 -m  <- szukamy pierwszego k >= p
    
        q=0; % wielkorotno�� p 
        final=[]; % wektor na ostateczny wynik
        iteracja=ceil(length(A)/p);

        for ( i= 1 : iteracja)

        if(q+p<length(A))
        B=A(q+1:q+p);    

          m=3;
        while((2^m)-1 -m <p)  
        m=m+1;    
        end
    
        k=2^m-1 -m;
            n=2^m-1;
            
       out = encode(B,n,k,'hamming/binary');
        final=[final out];
        
    
        q=q+p;
        
        else
       B=A(q+1:end);

              m=3;
        while((2^m)-1 -m <length(B))  
        m=m+1;    
        end
    
        k=2^m-1 -m;
        n=2^m-1;
            

       out = encode(B,n,k,'hamming/binary');
        final=[final out];     
             
        end
    
     
       
        end
        
        n=length(final)/length(A);
        
    
	%fid = fopen('afterRepetition.txt','wt');
    %for i = 1:size(final,1)
     %  fprintf(fid,'%d\n',final(i,:));
    %end
    %fclose(fid)
    
	out = final;








end

