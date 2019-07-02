%% Weyl-Heisenberg Bases Toolbox
% Script "imwhcolor.m"
%% ��������:
% ��������� ������ �������� �����������, ��������������� � �������� 
% ��������, �������� � ������ �������, � �������������� ������������
% ������ �����-�����������.
%
%% ���� ������:
M = 8;  % ���������� ������� �� ������� 
L = 32; % ���������� ������� �� �������
a = 3;  % �������� �����
sigma = 0.025; % �������������������� ����������
t = 20; % ��������� ��������

% ���������� ������� ������������ ������ �����-�����������:
W = weylhzp(M, L, a, sigma);

% ������������ ������� �����������:
I = double(imread('Images/lena256.png'));
figure(1);
imshow(uint8(I));
title('�������� �����������');

% ������ ��������������:
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
R = real(W' * R * W);
G = real(W' * G * W);
B = real(W' * B * W);

% ������ ������ �� ���������� ��������:
R = compress(R, t);
G = compress(G, t);
B = compress(B, t);

% ������������ �����������:
I = cat(3,R,G,B);
figure(2);
imshow(uint8(I));
title('������ �������������� �����-�����������');

% �������� ��������������:
% ����� �� 2 ��� ���������� �������� �����������. ��������� ��������
% ������ "unitar.m".
R = real(W * R * W')./2;
G = real(W * G * W')./2;
B = real(W * B * W')./2;
I = cat(3,R,G,B);
figure(3);
imshow(uint8(I));
title('�������� �������������� �����-�����������');