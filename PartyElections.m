function pop1 = PartyElections(A, pop)


[population, nodes] = size(pop);
pop = sortGene(pop,A);
fit = sorting(A, pop);

PL = ceil(population/5);    %partyLeader

%%partyPop=pop;
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
    temp = 0.5*temp;
    pop1(index,:) = pop1(index,:) + temp;
    
    for j=1:nodes
       pop1(index,j) = round(pop1(index,j));
       if pop1(index,j)<=0
           pop1(index,j) = pop(index,j);
       end
    end
    
    
  
    
    %improved code... CCDE
    S = Smat(A);
    for asd=1:nodes
        S(asd,asd)=0;
    end
    Pf = 0.6;
    for j=1:nodes
        P = rand;
        if(P<Pf)
            [Stemp, Sind] = max(S(j,:));
            pop1(index,j) = pop1(index, Sind);
        end
    end

    
    
    pop1(index,:) = validateCom(pop1(index,:));
    
end

for i=1:PL
    index = fit(i,1);
    tempLeaderInd=pop1(index,:);
    S = Smat(A);
    for asd=1:nodes
        S(asd,asd)=0;
    end
    Pf=0.6;
    for j=1:nodes
        P=rand;
        if(P<Pf)
            [Stemp, Sind]=max(S(j,:));
            tempLeaderInd(1,j)=tempLeaderInd(1,Sind);
        end
    end
    
    tempLeaderInd = validateCom(tempLeaderInd);
    
    newFit = sorting(A,tempLeaderInd);
    oldFit = sorting(A, pop1(index,:));
    
    if(newFit(1,2)>oldFit(1,2))
        pop1(index,:) = tempLeaderInd;
    end
    %pop1(index,:) = validateCom(pop1(index,:));
end


end