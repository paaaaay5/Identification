function J=rotate_cow(cof,img)
    %回転
    t=atand(cof);
    Q=affine2d([cosd(t) sind(t) 0;
        -sind(t) cosd(t) 0;
        0 0 1]);
    J=imwarp(img,Q);
end