function IMG=resized_cow(cropped)
    SI=size(cropped,2);
    ee=1;
    for e=1:SI
        img=cropped(e).img;
        si=size(img);
        [~,a2]=max(img(1,:));
        
        if si<75
            continue
        end
        
        B=[];
        for j=1:10
            [b,~]=max(img(si(1)-10+j,:));
            B(j)=b;
        end

        [~,index]=max(B);
        [~,b2]=max(img(si(1) - 10 + index,:));

        if abs(b2-a2)<=2
              cof=0;
        else
            cof=(b2-a2)/(si(1)-10+index);
        end
        
        %回転
        J=rotate_cow(cof,img);

        %横方向切り抜き
        if size(J,2) ~=71
            marge=size(J,2)-71;
            if rem(marge,2)==0
                J=J(:,marge/2+1:size(J,2)-marge/2);
            else
                marge=marge-1;
                J=J(:, marge/2+1:size(J,2)-(marge/2+1));
            end
        end
        
        
        %縦方向切り抜き
        S=sum(J,2);

        for i=1:(size(S,1)-1)
            diff=S(i+1) -S(i);

            if diff<0 && S(i+1) == 0
                start=i-70;
                IMG(ee).img=J(start:i,:);
                ee=ee+1;
                break

            elseif i == size(S,1)-1
                IMG(ee).img=J(i-69:i+1,:);
                ee=ee+1;
            end
            
        end
    end
end