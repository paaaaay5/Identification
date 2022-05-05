function I=predictcow(X,vec)
    [~,~,max]=maxplot(X);
    max=exp(max);
    E=[];
    for i=1:size(vec,2)
        err=immse(max,vec(i).mean);
        E(i)=err;
    end
    [~,I]=min(E);
endval_csv_files