%dir()+[. , ..]消し
function folderInfo=get_dir(root_path)
    folderInfo=dir(root_path);
    folderInfo = folderInfo(~ismember({folderInfo.name}, {'.', '..','.MATLABDriveTag'}));
    %folderlist = folderInfo([folderInfo.isdir]);
end