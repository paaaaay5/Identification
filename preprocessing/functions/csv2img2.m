function A=csv2img2(signals,s)

    n=size(signals(s).data,1);
    if n==1
        img = signals(s).data;
        img(:,23233)=[];
        img=transpose(reshape(img,[176,132]));
        A=img;
    else
    
        A=zeros(132,176,n);

        for i=1:n
            img = signals(s).data(i,:);
            img(:,23233)=[];
            img=transpose(reshape(img,[176,132]));
            A(:,:,i)=img;
        end
    
    end
end