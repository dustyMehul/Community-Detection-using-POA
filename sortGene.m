function pop1 = sortGene(pop1,A)
    S = Smat(A);
    [population, nodes] = size(pop1);
    
    for i=1:population
        ind2D = -1 * ones(nodes, nodes-1);
        com = max(pop1(i,:));
        ind2D(:,1:com) = 0;
        for j=1:nodes
            ind2D(j,pop1(i,j))=1;
        end
        
        ind2D = gene_sort(S,ind2D,com);
        
        for j=1:nodes
            pop1(i,j) = find(ind2D(j,:)==1);
        end
    end
    
end