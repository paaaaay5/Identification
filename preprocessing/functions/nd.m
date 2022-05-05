  function true_img=nd(img,h)
  %paramatar
    n=size(img);
    theta1=45/2;
    theta2=60/2;
    a=h*tand(theta1);%%Height[m]
    b=h*tand(theta2);%Width[m]
    H=round(n(1)/2);%Height[pix]
    W=round(n(2)/2);%Width[pix]
    
  %coefficient [m/pix]
    c1=a/H;
    c2=b/W; 
    
  %main roop 
    if size(n,2) ==3
        true_img=zeros(n(1),n(2),n(3)); 
        for k=1:n(3)
            for i=1:n(1)
                for j=1:n(2)          
                    l=sqrt(((c1*(i-H)).^2)+((c2*(j-W)).^2));
                    theta3=atan(l/h);
                    dtrue=img(i,j,k)*cos(theta3);
                    true_img(i,j,k)=(h-dtrue)/h;
                end
            end
        end
        
    else
        true_img=zeros(n(1),n(2)); 
            for i=1:n(1)
                for j=1:n(2)          
                    l=sqrt(((c1*(i-H)).^2)+((c2*(j-W)).^2));
                    theta3=atan(l/h);
                    dtrue=img(i,j)*cos(theta3);
                    true_img(i,j)=(h-dtrue)/h;
                end
            end
    end
    
end
