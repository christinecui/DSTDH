function PCAHparam = trainPCAH(X, PCAHparam)

% Input:
%          X: features matrix [Nsamples, Nfeatures]
%          PCAHparam.nbits: number of bits (nbits do not need to be a multiple of 8)
%
% Output:
%          PCAHparam:
%             PCAHparam.pcaW---princele component projection
%             PCAparam.nbits---encoding length

npca = PCAHparam.nbits;
% cov(X)��   �����X��Э�������
% [V, D] = eigs(A,k)�����ؾ���A��k�������������V��������ֵD
[pc, ~] = eigs(cov(X), npca);

% 20180228 �����ô���
%XX = cov(X);
%[pc, D] = eigs(cov(XX), npca);

PCAHparam.pcaW = pc; % no need to remove the mean

%{ 
PCAʵ�ַ���
��1������һ��ֱ�ӵ���Matlab������princomp( )����ʵ��
    [COEFF SCORE latent]=princomp(X)
    ����˵����
    1��COEFF �����ɷַ�����������Э������������������
    2��SCORE���ɷ֣�������X�ڵ�ά�ռ�ı�ʾ��ʽ��������X�����ɷݷ���COEFF�ϵ�ͶӰ ������Ҫ��kά����ֻ��Ҫȡǰk�����ɷַ�������
    3��latent��һ����������Э�����������ֵ��������

��2�����������Լ����ʵ��
    PCA���㷨���̣���һ�仰��˵�����ǡ�����������X��ȥ������ֵm���ٳ���������Э�������C����������V����ΪPCA���ɷַ������������������£�
    [1].��ԭʼ���ݰ�����ɣ��У�����������X��ÿ��һ��������ÿ��Ϊһά������
    [2].�������X��Э�������C��������ֵm����Matlab��ʹ��cov()������������Э�������C����ֵ��mean������
    [3].���Э������������ֵD����Ӧ����������V����Matlab��ʹ��eigs()��������������ֵD����������V��
    [4].��������������Ӧ����ֵ��С���ϵ��°������гɾ���ȡǰk����ɾ���P����eigs()��������ֵ���ɵ�����������ǴӴ�С����ģ�
    [5].Y=(X-m)��P��Ϊ��ά��kά������ݣ�
��3����������ʹ�ÿ���PCA����
    [pcaData3 COEFF3] = fastPCA(X, k )��
%}
