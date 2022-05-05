function signals=get_csv(path,a)
    path_file=dir(path);
    dirName = path +'\'+path_file(a).name;
    files = dir(dirName);
    m = 1;
    
    for n = 1:10%numel(files)
        if strfind(files(n).name, '.csv') > 0
            sprintf('%s', files(n).name);
            signals(m).filename = files(n).name;
            signals(m).data = csvread([dirName+'\'+files(n).name]);
            m = m+1;
        end
    end
 end