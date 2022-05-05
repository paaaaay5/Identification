%行or列の最大値プロット
function [b,IN]=maxplot(img)
    [b,IN]=max(img,[],2);
end