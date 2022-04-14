function [G] = creaGrafo(n,aristas)
G=graph;
%agregar nodos
G=addnode(G,n);
%agregar aristas
for k=1:length(aristas)
    G=addedge(G,aristas(k,1),aristas(k,2));
end
end