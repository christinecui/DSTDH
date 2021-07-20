function [E]=L21_solver(Y,lambda)
% this function solves the equation
%  min 1/2||W-Q||_F^2+lambda*||W||_2,1

E=zeros(size(Y));
for i=1:size(Y,2)  % dim = 2����������
    temp=norm(Y(:,i),2); % Euclid������ŷ����÷��������ü����������ȣ���������Ԫ�ؾ���ֵ��ƽ�����ٿ���
    if temp<lambda
        E(:,i)=0;
    else E(:,i)=(temp-lambda)/temp*Y(:,i);
    end
end
