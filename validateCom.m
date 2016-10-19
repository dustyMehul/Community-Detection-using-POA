function ind = validateCom(ind)
    nodes = length(ind);
    
    num = 1;
    for i=1:nodes-1
        [I J]  = find(ind == i);
        if isempty(J)==0
            ind(J)=num;
            num=num+1;
        end
        
    end
end