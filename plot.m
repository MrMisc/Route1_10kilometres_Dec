


figure

U=rdmds('T',900);
RC=rdmds('RC');
XC=rdmds('XC');

hfac=rdmds('hFacC');



nx=84;
nz=129;

for i=1:nx
for k=1:nz
depth_2d(i,k)=RC(1,1,k);
length_2d(i,k)=XC(i,1);
plotter_2d(i,k)=U(i,1,k);
mask_2d(i,k)=hfac(i,1,k);
end
end
plotter_2d(mask_2d==0)=NaN;

pcolor(length_2d,depth_2d,plotter_2d);
shading flat
colorbar
%caxis([ 4.75 5.25])
hold on
%v=[1000:5:1040];
%[c,h]=contour(length_2d,depth_2d,plotter_2d,v,'LineColor','r');

% clabel(c,h)

%%

figure
%T=rdmds('T',13260);
T=rdmds('T',13080);
RC=rdmds('RC');
XC=rdmds('XC');

nx=84;
nz=129;

for i=1:nx
for k=1:nz
depth_2d(i,k)=RC(1,1,k);
length_2d(i,k)=XC(i,1);
plotter_2d(i,k)=T(i,1,k);
end
end
 
pcolor(length_2d,depth_2d,plotter_2d);
shading flat
colorbar
%caxis([ 4.75 5.25])
hold on
contour(length_2d,depth_2d,plotter_2d);
%%


figure
S=rdmds('S',13260);
RC=rdmds('RC');
XC=rdmds('XC');

nx=84;
nz=129;

for i=1:nx
for k=1:nz
depth_2d(i,k)=RC(1,1,k);
length_2d(i,k)=XC(i,1);
plotter_2d(i,k)=S(i,1,k);
end
end
 
pcolor(length_2d,depth_2d,plotter_2d);
shading flat
colorbar
%caxis([ 34 36])
hold on
contour(length_2d,depth_2d,plotter_2d);

%%



figure
T=rdmds('T',2400);
U=rdmds('U',2400);
RC=rdmds('RC');
XC=rdmds('XC');

nx=84;
nz=129;

for i=1:nx
for k=1:nz
depth_2d(i,k)=RC(1,1,k);
length_2d(i,k)=XC(i,1);
plotter_2d(i,k)=U(i,1,k);
plotter_2d_T(i,k)=T(i,1,k);
end
end
 
pcolor(length_2d,depth_2d,plotter_2d_T);
shading flat
colorbar
caxis([ 4.75 5.25])
hold on
v=[-0.05:0.01:0.05];
contour(length_2d,depth_2d,plotter_2d,v);

%% SAMPLE TO SHOW WHAT THE WAVES LOOK LIKE AT DIFFERENT ITERATIONS. JUST CHANGE THE VALUE OF 'NUMBER' TO A VALUE BETWEEN AND INCLUDING 0 AND 180
 tmp = matlab.desktop.editor.getActive;
 cd(fileparts(tmp.Filename));

iter = 9240;
iter = 420;
iter = 1320;
iter = 1500;
iter = 1860;
iter = 1920;
iter = 1980;
iter = 2220;
iter = 46080;
iter = 64800;
% iter = 720;


clear all

NUMBER= 3  %For route 1 simulation in this file location, we can go up to 180 because this is a 180 iteration results 
iter=360*NUMBER
T=rdmds('T', iter);
S=rdmds('S', iter);
RC=rdmds('RC');

nx=96;
nz=129;
ny=1

for i=1:nx
for j=1:ny
for k=1:nz
depth_3d(i,j,k)=-RC(1,1,k);
end
end
end

density=densjmd95(S,T,depth_3d);




figure

RC=rdmds('RC');
XC=rdmds('XC');

hfac=rdmds('hFacC');



nx=92;
nz=129;

for i=1:nx
for k=1:nz
depth_2d(i,k)=RC(1,1,k);
length_2d(i,k)=XC(i,1);
plotter_2d(i,k)=density(i,1,k);
mask_2d(i,k)=hfac(i,1,k);
end
end
plotter_2d(mask_2d==0)=NaN;

pcolor(length_2d,depth_2d,plotter_2d);
shading flat
colorbar
%caxis([ 4.75 5.25])
hold on
v=[1015:1:1045];
[c,h]=contour(length_2d,depth_2d,plotter_2d,v,'LineColor','r');

 clabel(c,h)
%%  WHERE GIF IS BEING MADE
 tmp = matlab.desktop.editor.getActive;
 cd(fileparts(tmp.Filename));


% cd('..')
clear all

filename = "myfile.gif";
f = figure; % or your figure handle
dt = 1/20; % 20 frames per second
for o = 1:10
  % plot stuff
 
NUMBER= o  %For route 1 simulation in this file location, we can go up to 180 because this is a 180 iteration results 
iter=360*NUMBER
T=rdmds('T', iter);
S=rdmds('S', iter);
RC=rdmds('RC');

nx=96;
nz=129;
ny=1

for i=1:nx
for j=1:ny
for k=1:nz
depth_3d(i,j,k)=-RC(1,1,k);
end
end
end

density=densjmd95(S,T,depth_3d);




figure

RC=rdmds('RC');
XC=rdmds('XC');

hfac=rdmds('hFacC');



nx=92;
nz=129;

for i=1:nx
for k=1:nz
depth_2d(i,k)=RC(1,1,k);
length_2d(i,k)=XC(i,1);
plotter_2d(i,k)=density(i,1,k);
mask_2d(i,k)=hfac(i,1,k);
end
end
plotter_2d(mask_2d==0)=NaN;

pcolor(length_2d,depth_2d,plotter_2d);
shading flat
colorbar
%caxis([ 4.75 5.25])
hold on
v=[1015:1:1045];
[c,h]=contour(length_2d,depth_2d,plotter_2d,v,'LineColor','r');

clabel(c,h)
 % gif writing code
 frame = getframe(figure);
 im = frame2im(frame);
 [A,map] = rgb2ind(im,256);
 if i == 1
   imwrite(A,map,"myfile.gif",'gif','LoopCount',Inf,'DelayTime',1/20);
 else
   imwrite(A,map,"myfile.gif",'gif','WriteMode','append','DelayTime',1/20);
  end
end
 
%%
u=rdmds('U',2400); 
dum(:,:)=u(:,1,:);

dum(dum==0)=NaN;

t=rdmds('T',2400);
dum2(:,:)=t(:,1,:);
dum2(dum2==0)=NaN;

figure
 pcolor(dum');
 shading flat
 colorbar

hold on

v=[-0.05:0.01:0.05];
 [c,h] =contour(dum2',v)
 clabel(c,h)

%%

RC=rdmds('RC');
XC=rdmds('XC');

figure 
 pcolor(XC,RC,dum);
 shading flat
 colorbar

hold on

v=[-0.05:0.01:0.05];
 [c,h] =contour(XC,RC,dum2,v)
 clabel(c,h)

%%

nx=60;
ny=1;
nz=20;

prec='real*8';
ieee='b';

for i=1:nx
    for j=1:ny
        
      bathy1(i,j)=-600;
        bathy2(i,j)=i*2;
    end
end
fid=fopen('bathy.box','w',ieee); fwrite(fid,bathy2,prec); fclose(fid);

%%

gebko=-800*ones([1000 1000]);

bathy3=gebko( 200:299,300);
fid=fopen('bathy_from_gebko.box','w',ieee); fwrite(fid,bathy3,prec); fclose(fid);

