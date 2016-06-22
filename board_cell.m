function [board] = board_cell(A,minecount)
global a0 a1 a2 a3 a4 a5 a6 a7 a8 aflag amine aempty

for x1=1:size(A,2)
    for y1=1:size(A,2)
        switch A(y1,x1)
            case 1
                image=a1;
            case 2
                image=a2;
            case 3
                image=a3;
            case 4
                image=a4;
            case 5
                image=a5;
            case 6
                image=a6;
            case 7
                image=a7;
            case 8
                image=a8;
            case 9
                image=amine;
            otherwise
                image=a0;
        end      
        spot={0,image,A(y1,x1)};% {state,type pic,#}
        board(y1,x1)={spot};
    end
end