function I=predictcow(m,vec)
    E=[];
    for i=1:size(vec,2)
        err=immse(m,vec(i).maxh);
        E(i)=err;
    end
    [~,I]=min(E);
end