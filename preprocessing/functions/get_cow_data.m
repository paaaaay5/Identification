function train_csv_files=get_cow_data(a,b)
    %b=1 =>train  b=0 =>val
    if b==1
        path="G:\MAIN\Data\DATA5\3D_TRAIN_DATA";
    elseif b==0
        path="G:\MAIN\Data\DATA5\3D_VAL_DATA";
    elseif b==2
        path="G:\MAIN\Data\DATA6";
    end
    
    %a:個体
    train_files=get_dir(path);
    folder_path=path+"\"+train_files(a).name;
    csv_files=get_dir(folder_path);
    
    for i=1:size(csv_files,1)
        csv_path = folder_path +'\'+csv_files(i).name;
        train_csv_files(i).data = csvread([csv_path]);
        train_csv_files(i).name = csv_files(i).name;
    end    
end