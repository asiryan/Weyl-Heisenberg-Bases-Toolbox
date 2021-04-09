%% Weyl-Heisenberg Bases Toolbox
% Function "dzakt.m"
%% Description:
% Function that implements a fast algorithm of orthogonalization
% WH-function using discrete Zak-transforms (H. Bolcskei).
%
%% Input:
% g - input vector of samples of the function.
% M - number of frequency shifts (even number).
%
%% Output:
% gopt - output vector of samples of the WH-function.
function [ gopt ] = dzakt( g, M )
N  = length(g); % samples
L  = N / M;     % number of time shifts
L2 = L * 2;
G  = zeros(L2,N);
dZ = zeros(L2,N);
gopt = zeros( 1,N);

%% 1. Forward discrete Zak transform
% Construction of shift matrix
for i = 0:1:L2-1
    for j = 0:1:N-1
        G(i+1,j+1) = g(mod(j+fix(M/2)*i,N)+1);
    end
end

% Forward Fourier transform
F = dftmtx(L2); % Fourier matrix (2L, 2L)
Z = F * G; % DFT
%Z = fft(G); % FFT

%% 2. Construction of orthogonal matrix
dZ(  1:L ,:) = Z(L+1:L2,:);
dZ(L+1:L2,:) = Z(  1:L ,:);
Zo = 2.*Z./sqrt(M.*abs(Z).^2 + M.*abs(dZ).^2);

%% 3. Backward discrete Zak transform
gopt(:) = sum(Zo)./(L2);