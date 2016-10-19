X = zeros(1,50);
for i=1:50
    X(i)=i;
end

pt=5;
for j=1:20
    close all;
    plot(X,bestValuekarate(j,:));
    bestValuekarate(j,50)
    pause(pt);
end
    