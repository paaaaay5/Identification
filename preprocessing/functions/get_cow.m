function [csv_files,name] =get_cow(a)
%a : 個体番号
%個体ファイル

    root_path="E:\Project\Data\3D_sensor_data";
    inv_dir=get_dir(root_path);

    %日付ファイル
    name=inv_dir(a).name;
    path=root_path +"\"+ name;
    date_dir=get_dir(path);
    n=1;

    %CSVファイル
    for j=1:size(date_dir,1)
        csv_path = path +'\'+date_dir(j).name;
        files = get_dir(csv_path);

        %csvread  
        for i=1:size(files,1)
            if files(i).bytes >0
                csv_files(n).data = csvread([csv_path+'\'+files(i).name]);
                if size(csv_files(n).data,2)==23233 && (size(csv_files(n).data,1)==5 || size(csv_files(n).data,1)==1)
                    n=n+1;
                end
            end
        end

    end
    
end