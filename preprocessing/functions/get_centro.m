function [centroids,BW2]=get_centro(A)
%input :3Dimage
%output:centroids
    BW=imbinarize(A);
    BW2 = bwareaopen(BW, 2000);
    s = regionprops(BW2,'centroid');
    centroids = cat(1, s.Centroid);
end