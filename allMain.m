it = 20;
bestValuekarate = zeros(it,25);
allPartyKarate = zeros(25,10,it); 
bestinds = zeros(it,34);

for i=1:it
    fprintf('KarateSet running, Run = %d\n',i);
    A=xlsread('karate.xls');
    [bestValue, allParty, bestInd]=main(A);
    bestValueKarate(i,:) = bestValue;
    allPartyKarate(:,:,i) = allParty;
    bestinds(i,:)= bestInd;
end
    

bestValueUSPol = zeros(it,25);
allPartyUSPOL = zeros(25,10,it); 

for i=1:it
    fprintf('booksUSPol running, Run = %d\n',i);
    A=xlsread('booksUSPol.xls');
    [bestValue, allParty]=main(A);
    bestValueUSPol(i,:) = bestValue;
    allPartyUSPol(:,:,i) = allParty;
end
    


bestValueDolphin = zeros(it,25);
allPartyDolphin = zeros(25,10,it); 

for i=1:it
    fprintf('DolphinSet running, Run = %d\n',i);
    A=xlsread('dolphin.xls');
    [bestValue, allParty]=main(A);
    bestValueDolphin(i,:) = bestValue;
    allPartyDolphin(:,:,i) = allParty;
end
  



bestValueFootball = zeros(it,25);
allPartyFootball = zeros(25,10,it); 

for i=1:it
    fprintf('ftball running, Run = %d\n',i);
    A=xlsread('football.xls');
    [bestValue, allParty]=main(A);
    bestValueFootball(i,:) = bestValue;
    allPartyFootball(:,:,i) = allParty;
end
    



bestValuejazz = zeros(it,25);
allPartyjazz = zeros(25,10,it); 

for i=1:it
    fprintf('jazz running, Run = %d\n',i);
    A=xlsread('jazz.xls');
    [bestValue, allParty]=main(A);
    bestValuejazz(i,:) = bestValue;
    allPartyjazz(:,:,i) = allParty;
end
    


bestValuestrike = zeros(it,25);
allPartystrike = zeros(25,10,it); 

for i=1:it
    fprintf('strike running, Run = %d\n',i);
    A=xlsread('strike.xls');
    [bestValue, allParty]=main(A);
    bestValuestrike(i,:) = bestValue;
    allPartystrike(:,:,i) = allParty;
end
    
