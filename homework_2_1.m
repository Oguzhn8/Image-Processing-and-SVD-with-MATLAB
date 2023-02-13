% Furkan Karlıtağ / 040170210
% Oğuzhan Karaarslan / 040170081

%%
clc ;
clear ;
close all ;
%%
% Reading the TarantulaNebula.jpg photo with imread() command
nasacolor = imread('TarantulaNebula.jpg') ;
%%
% Plotting the initial photo 
image(nasacolor)
title('Initial NASA Photo') ;
%%
% Ordering the colormap for gray plot
nasa=sum(nasacolor,3,'double'); %sum up red+green+blue
m=max(max(nasa)); %find the max value
nasa=nasa*255/m; %make this be bright white

%%
% Plotting the grayscale version of photo
figure
colormap(gray(256)) ;
image(nasa) ;
title('Grayscale NASA Photo') ;
%%
% Obtaining the svd of the photo and plotting the Singular Values
figure
[U, S, V] = svd(nasa) ;
semilogy(diag(S), '-r', 'LineWidth', 2 ) 
title('Singular Value Plot') ;
%%
% Constructing the new images with different resolution values
nasa100=U(:,1:100)*S(1:100,1:100)*V(:,1:100)';
nasa50=U(:,1:50)*S(1:50,1:50)*V(:,1:50)';
nasa25=U(:,1:25)*S(1:25,1:25)*V(:,1:25)';

% Plotting the images with new resolution in descending order
figure
colormap(gray(256)) ;
image(nasa100) ;
title('100*100 NASA Photo') ;

figure 
colormap(gray(256)) ;
image(nasa50) ;
title('50*50 NASA Photo') ;

figure 
colormap(gray(256)) ;
image(nasa25) ;
title('25*25 NASA Photo') ;



