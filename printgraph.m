X = zeros(1,25);
for i=1:25
    X(i)=i;
end

pt=3;
for j=1:20
    close all;
    plot(X,bestValueKarate(j,:));
    axis([0 25 0 0.5])
    fprintf('%d\n',bestValueKarate(j,25));
    pause(pt);
end
    