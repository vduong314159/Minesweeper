function blank_hit(Bx,By,size,board)
global a0 a1 a2 a3 a4 a5 a6 a7 a8 aflag amine aempty

disp([Bx By])

drawnow

if Bx>=1 & Bx<=size & By>=1 & By<=size
    if board{By,Bx}{1,1}==1
        return
    end
    if board{By,Bx}{1,1}==0
        image_creation(board{By,Bx}{1,2},Bx,By,size);
        board{By,Bx}{1,1}=1;
    end
    if board{By,Bx}{1,3}~=0
        return
    end
    if By+1<=size
        blank_hit(Bx,By+1,size,board)
    end
    if Bx+1<=size
        blank_hit(Bx+1,By,size,board)
    end
    if By-1>=1
        blank_hit(Bx,By-1,size,board)
    end
    if Bx-1>=1
        blank_hit(Bx-1,By,size,board)
    end
end
return