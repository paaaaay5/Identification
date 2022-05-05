function mem=get_invcow(csv_files)
    height=132;
    width=70;
    num_files=size(csv_files,2);
    mem(num_files).seq=[];
    
    for m=1:num_files
        %前処理
        seq_img=csv2img2(csv_files,m);
        norm_seq=nd(seq_img,3);
        norm_clean_BW=clean_image(norm_seq,0,1);
        norm_clean_seq=(norm_clean_BW>0.29).*norm_clean_BW;
        
        A=norm_clean_seq(:,:,1);
        BW=imbinarize(A);
        BW2 = bwareaopen(BW, 2000);
        s = regionprops(BW2,'centroid');
        centroids = cat(1, s.Centroid);
                
        a=size(centroids,1);
        
        for j=1:size(norm_clean_seq,3)
            %重心
            A=norm_clean_seq(:,:,j);
            BW=imbinarize(A);
            BW2 = bwareaopen(BW, 2000);
            s = regionprops(BW2,'centroid');
            centroids = cat(1, s.Centroid);
            
            %頭数によって条件
            if a==1 || 2
                p=1;
           
            elseif a==3
                p=2;
            else
                continue
            end
            
            %ターゲットの重心
            x=comp(round(centroids(p,1)-35));
            %ターゲットの領域
            lab=(bwlabeln(BW2)==p);
            I=A(1:height,x:width+x).*lab(1:height,x:width+x);
            mem(m).seq=cat(3,mem(m).seq,I);
        end
    end
end