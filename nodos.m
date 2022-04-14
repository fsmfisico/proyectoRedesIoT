function [x,y]=nodos(nn)
rng(23)
for k=1:nn
    x(k) = randi([0 1000],1,1); %valor en x
    y(k) = randi([0 1000],1,1); %Valor en y
end
end