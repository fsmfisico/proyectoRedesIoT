function [nodoscercanos, radios]=dist(xx,yy,n)
c=1;
j=1;
for k=1:n %nodo 1
    for h=k:n %nodos despues del primero
        radio(c)=sqrt((xx(h)-xx(k)).^2+(yy(h)-yy(k)).^2);
        if radio(c)<=100 && radio(c)>0
            nodoscercanos(j,1)=k;
            nodoscercanos(j,2)=h;
            radios(j)=radio(c);
            j=j+1;
        end
        c=c+1;
    end
end
end