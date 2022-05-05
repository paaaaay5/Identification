%牛領域の抽出を行う関数denoise(3Ddata,背景平均,消す割合)
function LLL= denoise(ndimg,BA,c)
    ndimg=ndimg(1:112,:,:);
    a=size(ndimg);
    LLL=zeros(a(1),a(2),a(3));
    c=10/c;
    b=round(a(1)*a(2)/c);
    SE=strel("disk",10);
    
    for i=1:a(3)
        L=ndimg(:,:,i);
        P=L-BA;
        P=im2gray(P);
        LL=imbinarize(P,0.8);
        I=imclose(LL,SE);
        KKK=bwareaopen(I,b).*ndimg(:,:,i);
        LLL(:,:,i)=KKK(:,:);
    end   
end