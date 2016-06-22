%% Minesweeper game
%Click on squares to display, right click to flag
%Press outside the playing area to quit

function [clicks,correct_flag]=Minesweeper(size,minecount)
%size=abs(ceil(real(size))); minecount=abs(ceil(real(minecount)));
%if size<1 | size>30
%    size=30;
%end
%if minecount>size^2
%    minecount=size^2-1;
%end

global a0 a1 a2 a3 a4 a5 a6 a7 a8 aflag amine aempty
[a0, map0]=imread('0.gif');  a0=ind2rgb(a0, map0);
[a1, map1]=imread('1.gif');  a1=ind2rgb(a1, map1);
[a2, map2]=imread('2.gif');  a2=ind2rgb(a2, map2);
[a3, map3]=imread('3.gif');  a3=ind2rgb(a3, map3);
[a4, map4]=imread('4.gif');  a4=ind2rgb(a4, map4);
[a5, map5]=imread('5.gif');  a5=ind2rgb(a5, map5);
[a6, map6]=imread('6.gif');  a6=ind2rgb(a6, map6);
[a7, map7]=imread('7.gif');  a7=ind2rgb(a7, map7);
[a8, map8]=imread('8.gif');  a8=ind2rgb(a8, map8);
[aflag, mapflag]=imread('flag.gif');  aflag=ind2rgb(aflag, mapflag);
[amine, mapmine]=imread('mine.gif');  amine=ind2rgb(amine, mapmine);
[aempty, mapempty]=imread('empty.gif');  aempty=ind2rgb(aempty, mapempty);



[A] = matrix_creation2(size,minecount);
[board] = board_cell(A,minecount);

%draw covered board
clf;
for x1=1:size
    for y1=1:size
        image_creation(aempty,x1,y1,size);
    end
end

%Game while loop
exit=minecount;
correct_flag=0;
clicks=0;

while exit~=0
    clicks=clicks+1;
    [x_mouse,y_mouse, button]=ginput(1);
    y=ceil(y_mouse/32);
    x=ceil(x_mouse/32);
    %allows interaction only if withing bounds of drawing
    if x>=1 & x<=size & y>=1 & y<=size
        %Data for current pt.
        spot=board{y,x};
        Cstate=spot{1,1};
        Cimage=spot{1,2};
        Cnumber=spot{1,3};
        if button==1 & Cstate~=2 & Cstate~=1
            %if hit a blank square
            if Cnumber==0
                Bx=x;By=y;
                blank_hit(Bx,By,size,board)
%                for change_x=-1:1
%                   for change_y=-1:1
%                       if change_x^2+change_y^2~=0 & x+change_x>=1 & x+change_x<=size & y+change_y>=1 & y+change_y<=size
%                           spot_now=board{y+change_y,x+change_x};
%                           image_now=spot_now{1,2};
%                           image_creation(image_now,x+change_x,y+change_y,size);
%                           board{y+change_y,x+change_x}{1,1}=1;
%                       end
%                   end
%               end
            end
            image_creation(Cimage,x,y,size);
            board{y,x}{1,1}=1;
            %if hit is mine
            if Cnumber==9
                exit=0;
            end
        end%end button 1
        %hit right button
        if button==3 & Cstate~=1
            if Cstate==0
                image_creation(aflag,x,y,size);
                board{y,x}{1,1}=2;
                if Cnumber==9
                    correct_flag=correct_flag+1;
                    exit=exit-1;
                end
            end
            if Cstate==2
                image_creation(aempty,x,y,size);
                correct_flag=correct_flag-1;
                exit=exit+1;
                board{y,x}{1,1}=0;
            end
        end
    else%click outside then exit
        exit=0;
    end
end %end while
if x_mouse>=0 & x_mouse<=32*size & y_mouse>=0 & y_mouse<=32*size%within square
    for x1=1:size
        for y1=1:size
            spot=board{y1,x1};Cimage=spot{1,2};
            image_creation(Cimage,x1,y1,size);
        end
    end
end
%clicks
%if correct_flag==minecount
%    disp('You win');
%else
%    disp('You lose');
%end
