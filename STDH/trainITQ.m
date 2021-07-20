function ITQparam = trainITQ(X, ITQparam)

% Input:
%          X: n*d, n is the number of images
%          ITQparam:
%                           ITQparam.pcaW---PCA of all the database
%                           ITQparam.nbits---encoding length
% Output:
%             ITQparam:
%                           ITQparam.pcaW---PCA of all the database
%                           ITQparam.nbits---encoding length
%                           ITQparam.r---ITQ rotation projection

pc = ITQparam.pcaW;     %�������ݿ��pca
nbits = ITQparam.nbits; %���볤��

V = X*pc;  %���ݾ��� * �������ݿ��pca ����ά

% initialize with a orthogonal random rotation���������ݿⶼ�����������ת���г�ʼ��
R = randn(nbits, nbits);  %����һ��nbits*nbits��������׼��̬�ֲ��ľ��� ����ʼ��RΪһ���������������
[U11 S2 V2] = svd(R); %��R��������ֵ����������һ����Rͬ��С�ĶԽǾ���S2�������Ͼ���U ��V
R = U11(:, 1: nbits); %U11���в��䣬��ȡ��1��nbits

% ITQ to find optimal rotation
for iter=0:500
    %��1���̶�R������B(B��UX��ʾ)
    Z = V * R; %��ά��ľ��� * �����������
    UX = ones(size(Z,1),size(Z,2)).*-1;  %ones(a,b) ones(a,b) ;  size(X,dim)�����ؾ����������������dim=1����������dim=2��������
    UX(Z>=0) = 1; 
    % ��2���̶�B������R
    C = UX' * V; % ��>0����Ϊ1��<0����Ϊ-1�� * ��ά��ľ���
    [UB, sigma, UA] = svd(C);    
    R = UA * UB';
    %fprintf('iteration %d has finished\r',iter);
end

% make B binary
%B = UX;
%B(B<0) = 0;

ITQparam.r = R;