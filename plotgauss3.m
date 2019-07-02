%% Weyl-Heisenberg Bases Toolbox
% Script "plotgauss3.m"
%% ��������:
% ��������� ������������� ���������� ��������� � ������ ���������� ������ 
% ������� �� ���������� ��������.
%% ���� ������:
M     = input('���������� ������� �� ������� M = ');
L     = input('���������� ������� �� ������� L = ');
sigma = input('�������������������� ���������� sigma = ');

% ����������� ��������� ����������:
N = L * M; % ���������� �������
disp('���������� �������� N:');
disp(N);

% ������������� ���������� ���������:
% �) ����� ��������� �� ������� �� ��������������������� ����������,
% �) ����� ��������� ������� �� ��������������������� ����������.

% g0 = discretfix(sigma, N, 1e-64); % ������ ������.
g0 = discret(sigma, N); % ������ ������.

% ���������� ���������� �������:
maximum = max(g0);
Z = g0' * g0./ maximum;
S = 1:N;
disp(Z);

set(0,'DefaultAxesFontSize',10,'DefaultAxesFontName','Times New Roman');

% ���������� ����������� ������� ������� ���������� ���������:
figure(1);
surf(S,S,real(Z));
shading interp;
title('��������� �������');
xlabel('������� n');
ylabel('������� n');
zlabel('���������');