function partyPop = PartyElections(A, pop)


[population, nodes] = size(pop);

fit = sorting(A, pop);

PL = floor(population/3 -1);    %partyLeader

partyPop=pop;
pop1 = pop;

for i=PL+1:population
    index=fit(i,1);
    
    temp = zeros(1,nodes);
    
    for j=1:PL
        indexlead = fit(j,1);
        temp = temp + (pop1(indexlead,:) -  pop1(index,:))*fit(j,2);
    end
    
    temp = temp/(sum(fit(1:PL,2)));
    
    % multiply temp by "n" temp = n*temp;
    
    pop1(index,:) = pop1(index,:) + temp;
    
    for j=1:nodes
       partyPop(i,j) = floor(pop1(index,j));
       if partyPop(i,j)<=0
           partyPop(i,j) = pop(i,j);
       end
    end
    
    partyPop(i,:) = validateCom(partyPop(i,:));
    
end

end