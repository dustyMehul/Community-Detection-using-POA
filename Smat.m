function S = Smat(A)
a=0.97; % using from GA paper.. 

nodes = length(A);
D = zeros(nodes);

for i=1:nodes
   D(i,i) = sum(A(:,i)); 
end

Lambda = max(eig(A));

I = eye(nodes);
V= (a/Lambda )* A;
S = inv(D) * inv(I - V) * inv(D);

end

