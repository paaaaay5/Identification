function value1=get_value(IN3,idx,IM)
    value1=[];
    for i=1:size(IN3,2)
        value1(i)= IM(IN3(i),idx(i));
    end    
end