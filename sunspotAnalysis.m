% Load sunspot data 
load sunspot.dat
year = sunspot(:,1);
relNums = sunspot(:,2);

% Plot data
plot(year,relNums)
xlabel('Year')
ylabel('Zurich Number')
title('Sunspot Data')

% Compute and plot fourier transform
y = fft(relNums);
y(1) = [];
figure;
plot(y,'ro')
xlabel('real(y)')
ylabel('imag(y)')
title('Fourier Coefficients')

% Compute and plot power spectrum
n = length(y);
power = abs(y(1:floor(n/2))).^2; % power of first half of transform data
maxfreq = 1/2;                   % maximum frequency
freq = (1:n/2)/(n/2)*maxfreq;    % equally spaced frequency grid
figure;
plot(freq,power)
xlabel('Cycles/Year')
ylabel('Power')

% Plot power as a function of period, measured in years per cycle. 
period = 1./freq;
figure;
plot(period,power);
xlim([0 50]); %zoom in on max power
xlabel('Years/Cycle')
ylabel('Power')