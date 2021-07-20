 function D=distMat(P1, P2)
% Euclidian distances between vectors �� ��������֮���ŷ�Ͼ���
% ����һ������size=P1����*P2���У�����ÿ������ΪP1�е�ÿ���㣬��P2�е�ÿ�����ŷ�Ͼ���

if nargin == 2  % nargin���βεĸ���
    P1 = double(P1);
    P2 = double(P2);
    
     %sum(a,dim)�� dim=2��ʾ��ÿһ�н�����ͣ� size(a,dim)�� dim=1����������
    X1=repmat(sum(P1.^2,2),[1 size(P2,1)]); 
    X2=repmat(sum(P2.^2,2),[1 size(P1,1)]);
    R=P1*P2';
    D=real(sqrt(X1+X2'-2*R));
else
    P1 = double(P1);

    % each vector is one row
    X1=repmat(sum(P1.^2,2),[1 size(P1,1)]);
    R=P1*P1';
    D=X1+X1'-2*R;
    D = real(sqrt(D));
end


% ��P1��n*m����P2��n*m��Ϊ����ʱ��ÿ�д���һ�����ݵ�
% ����һ��n*n�ľ���A
% A(i,j)������P1��i�����ݵ㣬��P2�ĵ�j�����ݵ��ŷ�Ͼ���