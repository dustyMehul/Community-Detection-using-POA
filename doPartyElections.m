function [newpop, partyPowerMat, newpopParty] = doPartyElections(A, pop, popParty, M,m,n)

parties = max(popParty);
[totalPop,nodes] = size(pop);
newpop = zeros(totalPop,nodes);
index=1;
newpopParty = zeros(totalPop,1);
partyPowerMat = zeros(1,M);
for j=1:parties
    if(nnz(popParty==j)~=0)  %nnz(popParty==j) returns no. of elements of popParty with value 'j'
        members = zeros(nnz(popParty==j),nodes);  %making another 2-D array with only party population
        count =1;
        for i=1:totalPop            %filling  2-D array
            if(popParty(i)==j)
                members(count,:)=pop(i,:);
                count=count+1;
            end
        end
        
        pop1  = PartyElections(A, members);
        
        for ind=index:index+nnz(popParty==j)-1
           newpop(ind,:) = pop1(ind-index+1,:);
           newpopParty(ind,1) = j;
        end
        
        index=index+nnz(popParty==j);
        
        fit = sorting(A, pop1);
        PL = floor(nnz(popParty==j)/3 -1);
        
        avgLeadPower = sum(fit(1:PL,2))/PL;
        avgfollowPower = sum(fit(PL+1:nnz(popParty==j),2))/(nnz(popParty==j)-PL);
        
        partyPowerMat(1,j) = (m*avgLeadPower + n*avgfollowPower)/(n+m);
    end

end


end