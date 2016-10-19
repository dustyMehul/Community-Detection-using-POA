function y = fitness(A,ind)

nodes = length(ind);
com= max(ind);

individual = -1*ones(nodes, nodes-1);
individual(:,1:com)=0;
for i=1:nodes
    individual(i,ind(1,i))=1;
end


Q = 0;


edges = 0;

for i = 1:nodes
    for j = 1:nodes
        if(A(i,j)==1)
            edges = edges+1 ;
        end
    end
end

edges = sum(sum(A))/2;


for i = 1:com
    vert = zeros(1,nodes); 
    for j =1:nodes
        vert(j) = -1;
    end
    ind = 1;
    for j = 1:nodes
        if(individual(j,i) == 1)
            vert(ind) = j;
            ind = ind + 1;
        end
    end
    ind = ind -1;
   
    for j = 1:ind
        for k =j+1:ind
            Q = Q + (A(vert(j),vert(k)) - (del(A,vert(j))*del(A,vert(k))/(2*edges)));
        end
    end

end

Q = Q /(edges);
y = Q;
end

