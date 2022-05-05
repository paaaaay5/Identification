function n=get_size(a)
    root_path="D:\Project\Data\3D_sensor_data";
    inv_dir=get_dir(root_path);
    
    %日付ファイル
    name=inv_dir(a).name;
    path=root_path +"\"+ name;
    date_dir=get_dir(path);
    n=size(date_dir,1);
end