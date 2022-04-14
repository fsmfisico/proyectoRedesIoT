function [pesos,pesos2]=calculaPeso(P,L,lambda,radios)
for k=1:length(radios)
     pesos(k)=1/((P/L).*(lambda/(4*pi*radios(k))).^2);
     pesos2(k)=((P/L).*(lambda/(4*pi*radios(k))).^2);
end
end