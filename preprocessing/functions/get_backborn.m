function X=get_backborn(img)
    si=size(img);
    [~,a2]=max(img(1,:));
   
    B=[];
    for j=1:10
        [b,~]=max(img(si(1)-10+j,:));
        B(j)=b;
    end
        [~,index]=max(B);
        [~,b2]=max(img(50+index,:));
        
     if abs(b2-a2)<=2
         
        for i=1:size(img,1)
            x=b2;
            X(i).value=img(i,x);
            X(i).pix=x;
        end
     else
        cof=(b2-a2)/(61+index);
        
        for i=1:size(img,1)
            x=round(cof*i+a2);
            X(i).value=img(i,x);
            X(i).pix=x;
        end
        
     end
        

    
end