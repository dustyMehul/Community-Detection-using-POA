function pop = parliamentryElection(pop, A, M, Pn)
    L = Pn/M;
    Nodes = length(A);
    PL = floor(L/5 +1);
    TPL = M*PL;
    fit1 = sorting(A,pop);
    
    leaderPop = zeros(TPL,Nodes);
    for i=1:TPL
        leaderPop(i,:) = pop(fit1(i,1));
    end
    
    leaderPop = doParliamentryElec(A, leaderPop);
    
    for i=1:TPL
        pop(fit1(i,1),:) = leaderPop(1,:);
    end
    
end