function [BA,BV,BM]=get_BSM(O2)
%背景の統計モデル
BA=mean(O2,3);%バックグラウンドシーケンスの平均
BA=BA(1:112,:);

BV=var(O2,0,3);%バックグラウンドシーケンスの分散
BV=BV(1:112,:);

BM=median(O2,3);
BM=BM(1:112,:);
end