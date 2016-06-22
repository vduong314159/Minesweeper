clf;
[aempty, mapempty]=imread('empty.gif');  aempty=ind2rgb(aempty, mapempty);

for x1=0:9
    for y1=0:9
        emptyimg=image(aempty);
        axis([0 320 0 320], 'square');
        set(emptyimg,'Xdata',[32*x1 32*x1])
        set(emptyimg,'Ydata',[32*y1 32*y1])
        hold on
    end
end