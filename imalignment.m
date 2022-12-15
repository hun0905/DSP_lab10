function [image1,image2]=imalignment(image1,image2,degree,auto)
    if ~exist('degree', 'var')
        degree=0;
    end
    if ~exist('auto', 'var')
        auto=false;
    end
    if auto==false
        image2 = imrotate(image2,degree,'bilinear');
        figure(1)
        hold off
        imagesc(image1)
        [x1,y1]=ginput(2);
        figure(2)
        hold off
        imagesc(image2)
        [x2,y2]=ginput(2);
        x1=round(x1);
        x2=round(x2);
        y1=round(y1);
        y2=round(y2);
        image1=image1(y1(1):y1(2),x1(1):x1(2),:);
        image2=image2(y2(1):y2(2),x2(1):x2(2),:);
        image2=imresize(image2,[size(image1,1),size(image1,2)],'bilinear');
    elseif auto ==true
        tform = imregcorr(image2,image1)
        Rfixed = imref2d(size(image1));
        image2 = imwarp(image2,tform,"OutputView",Rfixed);
    end
end
