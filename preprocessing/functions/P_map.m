function Pimg=P_map(O2,O3)
%背景の統計モデル
BA=mean(O2,3);%バックグラウンドシーケンスの平均
BV=var(O2,0,3);%バックグラウンドシーケンスの分散

P_X_F=0.5;
P_X_B=0.5;

P_1_F=0.5;
P_1_B=0.5;

P_d_F=1/2;


%確率マップ
a=size(O3);
Pimg=[];
for k=1:a(3)
    for j=1:a(1)
        for i=1:a(2)
            P_d_B=exp( -((O3(j,i,k)-BA(j,i)).^2)/(2*BV(j,i))) /(sqrt(2*pi*BV(j,i)));
            Pimg(j,i,k)=(P_d_F*P_1_F)/((P_d_B*P_1_B)+(P_d_F*P_1_F));
        end
    end
end

end