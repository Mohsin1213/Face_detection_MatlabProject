faceDetector=vision.CascadeObjectDetector(); %Create a detector object

img=imread('img2.jpg'); %Read input image

BB=step(faceDetector,img); % Detect faces

iimg = insertObjectAnnotation(img, 'rectangle', BB, 'Face'); %Annotate detected faces.

figure(1);
imshow(iimg); 
title('Detected face');

counter=1;
for i=1:N
    face=imcrop(img,BB(i,:));
    baseDir  = 'C:\Users\glab\Desktop\Project\Pic.jpg';
    newName  = [baseDir num2str(counter) '.jpg'];
    while exist(newName,'file')
        
        counter = counter + 1;
        newName = [baseDir num2str(counter) '.jpg'];
    end
    fac=imresize(face,[110,92]);
    imwrite(fac,newName);

figure(2);
imshow(face); 
title('crop pic');
   
    pause(1);

end
n = size(BB,1);
strn=num2str(n);
msgbox(strcat('Detected Faces = ' , strn));