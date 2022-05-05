 function signals=get_precsv(path,a)
    %ファイルのパス
    path_file=dir(path);
    dirName = path +'\'+path_file(a).name;
    
    files = dir(dirName);
    f=size(files);
    
    dirName_pp=path +'\'+path_file(a).name+"\"+files(f(1)).name; 
    files_pp=dir(dirName_pp);
    
    %csvfileのみ抽出し構造体を作成。
     m = 1;
    for n = 1:numel(files_pp)
        if strfind(files_pp(n).name, '.csv') > 0
            sprintf('%s', files_pp(n).name);
            signals(m).filename = files_pp(n).name;
            signals(m).data = csvread([dirName_pp+'\'+files_pp(n).name]);
            m = m+1;
        end
    end
end