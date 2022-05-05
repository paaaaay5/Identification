function mem=invcow(csv_files)
height=132;
width=70;
num_files=size(csv_files,2);

n=0;
for m=1:num_files
    %前処理
    seq_img=csv2img2(csv_files,m);
    norm_seq=nd(seq_img,3);
    norm_clean_BW=clean_image(norm_seq,0,1);
    norm_clean_seq=(norm_clean_BW>0.29).*norm_clean_BW;
    
    %頭数を確認する
    op=size(size(norm_clean_seq),2);
    
    if op==3
        
        A=norm_clean_seq(:,:,1);
        [centroids,~] = get_centro(A);
        
        a=size(centroids,1);
        
        %3頭の時のみ個体を取得
        if a==3|| a==1
                   
            n=n+1;
            mem(n).seq=[];
            for j=1:size(norm_clean_seq,3)
                %重心
                A=norm_clean_seq(:,:,j);
                [centroids,BW2]=get_centro(A);
                a=size(centroids,1);
                
                if a==3
                    p=2;
                elseif a==1
                    p=1;
                else
                    break
                end
                %ターゲットの重心
                x=comp(round(centroids(p,1)-35));
    
                %ターゲットの領域を保存
                lab=(bwlabeln(BW2)==p);
                I=A(1:height,x:width+x).*lab(1:height,x:width+x);
                mem(n).seq=cat(3,mem(n).seq,I);
    
                
            end
            
        else
            continue
        end
        
    else
        A=norm_clean_seq;
        [centroids,~] = get_centro(A);
        
        a=size(centroids,1);
        
        %3頭の時のみ個体を取得
        if a==3 ||a==1
            
            if a==3
                p=2;
            elseif a==1
                p=1;
            end
            n=n+1;
        
            %重心
            A=norm_clean_seq;
            [centroids,BW2]=get_centro(A);
            %ターゲットの重心
            x=comp(round(centroids(p,1)-35));

            %ターゲットの領域を保存
            lab=(bwlabeln(BW2)==p);
            I=A(1:height,x:width+x).*lab(1:height,x:width+x);
            mem(n).seq= I;
            
        else
            continue
        end
    end
end
end