%%%Proyecto de Redes IoT
%%%Fernando Serrano Monroy
%%%Marzo 2022
%%%Simulador de redes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all
tic
%Constantes
c=3*10^8;
%%%%%%%%parametros
P=1;       %Potencia de transmición
L=1;           %Perdidas
freq=2000.*10^6;       %Frecuencia
lambda=c/freq;%Longitud de onda
n=1000;          %Numero de nodos o numero de estaciones

%Código
%     Busco aleatoriamente los nodos
[x,y]=nodos(n);
%     Calculo entre que nodos hay aristas y su distancia
[aristas,radio]=dist(x,y,n);
%     Creo el grafo con sus nodos y aristas
G=creaGrafo(n,aristas);
G2=creaGrafo(n,aristas);
%     Calculo los pesos
[peso,peso2]=calculaPeso(P,L,lambda,radio);

% %   Agregar peso al grafo
G.Edges.Weight=peso';
G2.Edges.Weight=peso2';
%     Matriz de adyacencia
%A = adjacenci(G,'weighted');
%A = adjacency(G)';
nn = numnodes(G);
[s,t] = findedge(G);
A = full(sparse(s,t,peso,nn,nn));
% %type dijkstra;
% % %Calculo la distancia minima con dijkstra
di = dijkstra(A,1) %algoritmo de Dijkstra

for i=1:10
[P,d] = shortestpath(G,1,i,'Method','positive');
[P2,d2] = shortestpath(G2,1,i,'Method','positive');
po(i)=d2;
fprintf('la potencia total entre 1 y %.f es: %f . Y el camino es \n',i,d2)
disp(P)
end
figure
plot(G)
title('Grafo')

figure
scatter(x,y)
title('Nodos distribuidos en todo el área')
xlabel('Distancia en x (m)')
ylabel('Distancia en y (m)')
toc
[P,d] = shortestpath(G,1,2,'Method','positive');
[P2,d2] = shortestpath(G2,1,2,'Method','positive');
po(i)=d2;
fprintf('la potencia total entre 1 y 2 es: %f . Y el camino es \n',d2)
disp(P)