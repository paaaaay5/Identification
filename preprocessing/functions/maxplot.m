%行or列の最大値プロット
function [idx,idy,max_v]=maxplot(img)
    idx=zeros(1,71);
    idy=zeros(1,71);
    max_v=zeros(1,71);
    
    for i=1:71
        [value,pix]=max(img(i,:));  
         idx(1,i)=pix;
         idy(1,i)=i;

         if value>=0
            max_v(1,i) = value;       
         else
             max_v(1,i)=0;       
         end
    end
end