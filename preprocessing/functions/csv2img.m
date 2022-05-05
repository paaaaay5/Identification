function A=csv2img(signals,n)
    img=signals(n).data;
    a=size(img)/132;
    A=zeros(132,177,round(a(1)));
     for i =1:a(1)
        A(:,:,i)=img((1+(i-1)*132):132*i,1:177);
     end
 end