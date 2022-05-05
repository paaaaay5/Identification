function [P,pix]=exzero(b2_2,IN2_2) 
    n=1;
    P=[];
    for i=1:size(IN2_2,2)
        if b2_2(i) > 0.2
            P(n)=IN2_2(i);
            pix(n)=i;
            n=n+1;
        end
    end
end