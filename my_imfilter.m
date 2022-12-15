function output = my_imfilter(image, filter)
% This function is intended to behave like the built-in function imfilter()
% See 'help imfilter' or 'help conv2'. Terms like "filtering" and
% "convolution" can be used interchangeably, as they are basically the same
% thing.

% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' or 'help imfilter', you see that they have
% several options to deal with boundaries. Therefore, You should pad the input image with zeros, 
% and return a filtered image which matches the input resolution. 

% Built-in functions like imfilter, filter2, conv2 are forbidden to use. 
% Simply loop over all the pixels and do the actual computation.

% Potentially useful MATLAB functions: padarray()

%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%

ph = (size(filter,1)-1)/2 ;
pw = (size(filter,2)-1)/2;

%image=double(image)

%filter=flip(filter,2)
padimage = padarray(image,[ph pw],0,'both');

if size(image,3)==3
    output = zeros(size(image,1),size(image,2),3);
else
    output = zeros(size(image,1),size(image,2));
end
for i=1+ph:size(padimage,1)-ph
    for j=1+pw:size(padimage,2)-pw
        output(i-ph,j-pw,1)=sum(padimage(i-ph:i+ph,j-pw:j+pw,1).*filter,'all');
        if size(image,3)==3
            output(i-ph,j-pw,2)=sum(padimage(i-ph:i+ph,j-pw:j+pw,2).*filter,'all');
            output(i-ph,j-pw,3)=sum(padimage(i-ph:i+ph,j-pw:j+pw,3).*filter,'all');
        end
    end
end
%%%%%%%%%%%%%%%%
% Your code end
%%%%%%%%%%%%%%%%
