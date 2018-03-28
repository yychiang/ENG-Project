clear
close all
warning off;
%I=imread('line2.jpeg');
%I=imread('b.jpg');
I=imread('fig1.png');
imshow(I);

if (length(size(I))==3)
    A=rgb2gray(I);
else
    A=I;
end

for i=1:size(I,1)
    for j=1:size(I,2)
        if I(i,j)==0
            I(i,j)=255;
        end
    end
       
end


figure
imshow(A)
for i=1:size(I,1)
    for j=1:size(I,2)
        if I(i,j)>=128
            A(i,j)=255;
        else
            A(i,j)=0;
        end
    end
       
end


figure
imshow(A)
A=255-A;
A=im2bw(A, 0.5); 

figure
imshow(A)

m=size(A,1);
n=size(A,2);

P=[];
counter=1;
for i=1:n %column
    for j=1:m %row
        if A(j,i)==1
            P(counter,:)=[i/n,m-j];
            counter=counter+1;
        end
    end
end

figure
hold on
for i=1:length(P)
    plot(P(i,1),P(i,2),'b.')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
svmStruct = svmtrain(P(:,1), P(:,2),'-s 4 -t 2')