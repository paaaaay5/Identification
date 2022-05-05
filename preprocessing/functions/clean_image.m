function J=clean_image(ndimg,a,b)
    O=ndimg.*(ndimg<b);
    J=O.*(ndimg>a);
    J=medfilt3(J,[5 5 1]);
end