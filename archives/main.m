close all;
clear all;
clc;

%% Initialise varialbles
% Read A;
%A = Amat(50);

A=xlsread('karate.xls');

nodes = length(A)
vertices = sum(sum(A))/2

fprintf('Program Paused...\nPress Enter To Continue...\n');
pause;
%% Variables
%read Pn;
Pn=200;

% Read Group Size
M=5;

%Group members
L=Pn/M;

%% Initialize Population Randomly
pop = InitPop(A, Pn);

%% dividing population



fit = sorting(A, pop);
plot(0,0,'c.');
plot(0,sum(fit(:,2)),'k*');
hold;


pause

for qwerty=1:50
    qwerty
% Party Elections
Pop1 = zeros(Pn , nodes);
for i=1:M
    Pop1(L*(i-1)+1 : L*i, :) =PartyElections(A, pop(L*(i-1)+1 : L*i, :));
end

fit1 = sorting(A, Pop1);
plot(qwerty,sum(fit1(:,2)),'k*');


pop = Pop1;
end