%% The following function creates a radomly generated matrix that contains
%% values representing the squares of a minesweeper board.
% Variables:
%   Output:
%     A - a matix representing the minesweeper board
%     minecount - the number of mines
%   Input:
%     dimA - dimension of matrix A, matrix a is square
%     difficulty - controls the number of mines
%   Used within:
%     y1,x1,e,f - for loop variables
%     I - a count varaible
%     B - a matrix used to store non-mine numbers

function [A,minecount] = matrix_creation (size)
A = random('norm',-1,1,size,size);%EXPLORE MORE
minecount=0; %counts # of mines
% The following creates a matrix with only mines represented
for y1=1:size
    for x1=1:size
        if A(y1,x1)>=.1
            A(y1,x1)=(9);
            minecount=minecount+1;
        else
            A(y1,x1)=(0);
        end
    end
end

B=zeros(size,size);
midy=-(1-size)/2;
midx=-(1-size)/2;

%the following creates the numbers around the mines
for y1=1:size
    for x1=1:size
        if A(y1,x1)==9
            for e=-1:1
                for f=-1:1
                    if e^2+f^2~=0 & abs(y1+e-midy-1)<=midy & abs(x1+f-midx-1)<=midx
                        if A(y1+e,x1+f)~=9
                            B(y1+e,x1+f)=B(y1+e,x1+f)+1;
                        end
                    end
                end
            end
        end
    end
end
A=A+B;

if minecount==0
    [A,minecount] = matrix_creation;
end
