function [bestValue, allParty, bestInd]=main(A)

%close all;
%clear all;
%clc;

%% Initialise varialbles
% Read A;
%A = Amat(50);

%A=xlsread('karate.xls');

nodes = length(A);
vertices = sum(sum(A))/2;

%fprintf('Program Paused...\nPress Enter To Continue...\n');
%pause;
%% Variables
%read Pn;
Pn=100;

% Read Group Size
M=10;

%Group members
L=Pn/M;

%MergeProbability
Pm= 0.25;                 %   30% probability
%DiscardProbability
Pd= 0.5;                %   01% probability

%power weights
m=0.58;
n=0.23;

%iterations
iter = 25;

%%
bestValue = zeros(1,iter);
qaz = zeros(1,iter);
allParty = zeros(iter,M);

%% Initialize Population Randomly
pop = InitPop(A, Pn);
partyPower = zeros(iter,M);
popParty = zeros(Pn,1); %matrix for denoting party number

%% assigning parties to population

for i=1:M
    popParty(L*(i-1)+1 : L*i,1) = i;
end


%% partyElections
for it=1:iter
    
 %   fprintf('\n````````````````````````````````````````````````````\ni= %d\n',it);
[pop, partyPowerMat, popParty] = doPartyElections(A, pop, popParty, M,m,n);

%partyPowerMat
allParty(it,:) = partyPowerMat;
%% MainElections 

%Merging of Parties
MergeProbability = rand(1);
if(MergeProbability>Pm)
  %  fprintf('Merging Probability LOW...!!!\n');
elseif (nnz(partyPowerMat==0)<M-3)
   % fprintf('Merging Probability HIGH...!!!\n');
    
    temp = sort(partyPowerMat);
    zer = nnz(temp==0);
    min1 = temp(1,1+zer);
    min2 = temp(1,2+zer);
    ind1 = find(partyPowerMat==min1);
    ind2 = find(partyPowerMat==min2);
    
    for i=1:Pn
       if(popParty(i)==ind1(1))
           popParty(i)=ind2(1);
       end
    end
    
end


% deleting the parties
discardProbability = rand(1);
if(discardProbability+1>Pd)
    %fprintf('discarding probability is LOW...!!!\n');
else
    
    temp = sort(partyPowerMat);
    
    i=0;
    min=temp(1,i);
    
    while(min~=0)
        i=i+1;
        min=temp(1,i);
    end
    
    indmin = find(partyPowerMat==min);
    
    for i=1:Pn
       if(popParty(i)==indmin)
           popParty(i)=0;
       end
    end

end

%pop = parliamentryElection(pop, A, M, Pn);

fit1 = sorting(A,pop);
%fit1(1,2)
bestValue(1,it) = fit1(1,2);
bestInd = pop(fit1(1,1),:);
qaz(1,it) = it;
end

%%finding best Solution
%fit1 = sorting(A,pop);
%fprintf('\nBest fitness value = %d',fit1(1,2));
%fprintf('\n2nd Best fitness value = %d',fit1(2,2));
%fprintf('\n3rd Best fitness value = %d',fit1(3,2));

%plot(qaz,bestValue);

end