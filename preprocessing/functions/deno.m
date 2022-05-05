function LLL= deno(ndimg,c)
    a=size(ndimg);
    LLL=zeros(a(1)-20,a(2),a(3));
    c=10/c;
    b=round(a(1)*a(2)/c);
    SE=strel("disk",10);
    
    for i=1:a(3)
        L=ndimg(:,:,i);
        %P=L-BA;
        %P=im2gray(P);
        %LL=imbinarize(P,0.8);
        I=imclose(L,SE);
        KKK=bwareaopen(I,b).*ndimg(:,:,i);
        LLL(:,:,i)=KKK(1:112,:);
    end   
end