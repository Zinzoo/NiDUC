function [ out ] = decode_read_salomon( sygnal,k,n )
%DECODE_READ_SALOMON Summary of this function goes here
%   Detailed explanation goes here
final=[];
m=log2(n+1);
q=0;              
  iteracja=ceil(length(sygnal)/(2*n));
        
          for ( i= 1 : iteracja)
                    s1=sygnal(q+1:q+n);    
                    s2=sygnal(q+n+1:q+2*n);
                    s3=[s1;s2]
                    msg = gf(s3,m)
                    decode = rsdec(msg,n,k);
                    x=decode (1:1 ,1:k)
                           % przekszta�cenie z Galois  na zwyk�e
                                  myvar_dbl = double( x.x ); %jaka� chora magia z neta od hindus�w
                              %% nie dotykam tego na g�rze wa�ne �e dzia�a
                              
                    final=[final myvar_dbl]
                    x=decode (2:2 ,1:k)
                           % przekszta�cenie z Galois  na zwyk�e
                                  myvar_dbl = double( x.x ); %jaka� chora magia z neta od hindus�w
                              %% nie dotykam tego na g�rze wa�ne �e dzia�a
                              
                    final=[final myvar_dbl]
                    
                    q=q+2*n;
          end 
                    
                    out = final;




end

