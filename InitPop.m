function pop = InitPop(A, Pn)

nodes = length(A);

pop = zeros(Pn, nodes);
com = randi([2  nodes-1], Pn, 1);

for i=1:Pn
    pop(i,:) = randi(com(i), 1, nodes);
    
    %improved code... CCDE
    Pf=0.1; %probability of flipping
    for j=1:nodes
        P = rand;
        if(P<Pf)
            presentCom = pop(i,j);
            for k=1:nodes
                if (A(j,k)==1)
                    pop(i,k) = presentCom;
                end
            end
        end
    end %%End of Improvement...!!
        
    pop(i,:) = validateCom(pop(i,:));
end




end