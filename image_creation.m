function image_creation(image_in,x1,y1,size)

img=image(image_in);
axis([-1 32*size-1 -1 32*size-1], 'square');
axis off;
x1=x1-1;
y1=y1-1;
set(img,'Xdata',[32*x1 32*x1])
set(img,'Ydata',[32*y1 32*y1])
hold on