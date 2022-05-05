function A=imcon(cam1_cow1)
    n=size(cam1_cow1);
    A=csv2img2(cam1_cow1,1);
    
    for i=2:n(2)
        B=csv2img2(cam1_cow1,i);
        A=cat(3,A,B);
    end
    
end