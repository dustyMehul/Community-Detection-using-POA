function leaderPop = doParliamentryElec(A,leaderPop)
    
    [TPL,Nodes] = size(leaderPop);
    
    Pf =0;
    for i=1:TPL
        for j=1:Nodes
            p=rand;
            if(p<Pf)
                com = leaderPop(i,j);
                for k=1:Nodes
                    if(A(j,k)==1)
                        leaderPop(i,k) = com;
                    end
                end
            end
        end
        leaderPop(i,:) = validateCom(leaderPop(i,:));
    end

end