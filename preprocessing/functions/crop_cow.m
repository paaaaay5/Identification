function resized_cow=crop_cow(inv_cow)

    for j=1:size(inv_cow,2)
        
        img=inv_cow(j).seq;
        sizu=size(img,3);
        m=zeros(1,sizu);
        
        if size(size(img),2)==3
            %面積最大のフレームを取得
            for k=1:sizu
                a=img(:,:,k);
                BW=imbinarize(a);
                m(1,k)=int32(bwarea(BW));
            end

            [~,index]=max(m);
            
            F=img(:,:,index);
        else
            F=img;
            
        end
            
        
        S=sum(F,2);
        
        
        
         for i=1:(size(S,1)-1)
            diff=S(i)-S(i+1);
            
            if diff == S(i)

                resized_cow(j).img=F(1:i,:);
                break
                
            elseif i == size(S,1)-1
                resized_cow(j).img=F(1:i+1,:);
            end
        end
        
    end
end