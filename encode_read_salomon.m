function [ out ] = encode_read_salomon(sygnal, k,n )
%
%%wyliczamy ile zer trzeba dodaæ 
if(mod(length(sygnal),2*k)~=0)
    extra=2*k -mod(length(sygnal),2*k );
    vec_zeros = zeros(1,extra);
    sygnal=[sygnal vec_zeros]
    
end
%%%%

%sygnal=[1,2,3,4,5,6,1,2,3,4,5,6]; %% bity sygnalu musz¹ byæ parzyste  // musz¹ dzieliæ 
%% siê na 2k

%n=8;
m=log2(n+1);



%m = 3;           % Number of bits per symbol m>=3
%n = 2^m - 1;     % Codeword length
%k = 3;           % Message length // k musi byæ nieparzyste
                    %N i K musz¹ ró¿niæ siê dodatni¹ liczb¹ ca³kowit¹.
                    % K<M
                    final=[];
                    y=[];
q=0;              
  iteracja=ceil(length(sygnal)/(2*k));
        
          for ( i= 1 : iteracja)
                    s1=sygnal(q+1:q+k);    
                    s2=sygnal(q+k+1:q+2*k);
                    s3=[s1;s2]
                    msg = gf(s3,m)
                    code = rsenc(msg,n,k)
          
                    x=code (1:1 ,1:n)
                                % przekszta³cenie z Galois  na zwyk³e
                              for ( i= 1 : n) % nie wiem czy petla potrzebna
                                  myvar_dbl = double( x.x ); %jakaœ chora magia z neta od hindusów
                              end
                              %% nie dotykam tego na górze wa¿ne ¿e dzia³a
                              
                    final=[final myvar_dbl]
                    x=code (2:2 ,1:n)
                     % przekszta³cenie z Galois  na zwyk³e
                              for ( i= 1 : n) % nie wiem czy petla potrzebna
                                  myvar_dbl = double( x.x ); %jakaœ chora magia z neta od hindusów
                              end
                              %% nie dotykam tego na górze wa¿ne ¿e dzia³a
                    
                    final=[final myvar_dbl]
                    
                    q=q+2*k;
          end 
                    
                    out = final;

end

