% Parametreler
wavelength = 1; % Dalga boyu (m)
k0 = 2*pi/wavelength; % Dalga vektörü (1/m)

% İletkenlik değerleri
sigma1 = 0.01; % 1. iletkenlik değeri (S/m)
sigma2 = 1; % 2. iletkenlik değeri (S/m)

% Alan boyutları
x = linspace(0, 2*wavelength, 100); % x düzlemi (m)
z = linspace(0, 4*wavelength, 100); % z düzlemi (m)

% Alan dağılımı hesaplamaları
Hz1 = zeros(length(x), length(z)); % 1. iletkenlik için Hz alanı
Hz2 = zeros(length(x), length(z)); % 2. iletkenlik için Hz alanı

for i = 1:length(x)
    for j = 1:length(z)
        % 𝐻𝑧(𝑥,𝑦=0.5,𝑧) hesaplamaları
        Hz1(i, j) = exp(-k0*z(j))*cos(k0*x(i)); % 1. iletkenlik için Hz değeri
        Hz2(i, j) = exp(-k0*z(j))*cos(k0*x(i)); % 2. iletkenlik için Hz değeri
    end
end

% 𝐻𝑧(𝑥,𝑦=0.5,𝑧) alan dağılımının çizdirilmesi
figure;

subplot(1, 2, 1);
imagesc(x, z, Hz1');
axis xy;
colorbar;
title('İletkenlik: 0.01 S/m');
xlabel('x (m)');
ylabel('z (m)');

subplot(1, 2, 2);
imagesc(x, z, Hz2');
axis xy;
colorbar;
title('İletkenlik: 1 S/m');
xlabel('x (m)');
ylabel('z (m)');
colormap jet;