function [x,period] = vowelProcess(y, fs, start, t_cut, twind, bandwidth)

% y: the signal
% fs: data sample rate
% start: the point at which the signal is cut
% t_cut:  the pitch period is included in the interval [t_cut, t_cut+1]
% twind: the hamming window is applied in the interval [twind, twind+3]
% bandwidth: low pass filter bandwidth / period
% x: synthesized signal
% period: pitch period in ms


m = length(y);
dt = 1/fs;
t = 0:dt:(m-1)*dt;


% Keep only 30ms of the signal
idy = (t>=start & t <= start + 0.03);  
t1 = (t(idy)-start)*1000;
y1 = y(idy);
figure
plot(t1,y1);
xlabel('Time[ms]');
ylabel('Amplitude');
title('Initial signal - Time domain');
c = cceps(y1);

% Find fundamental period --- pitch
trng = t1(t1>t_cut & t1<t_cut+1);
crng = c(t1>t_cut & t1<t_cut+1);
[~,I] = max(crng);
period = trng(I);

% Apply window
trng = (t1>= twind*period & t1<= (twind+3)*period);  % window length 3 periods
tnew = t1(trng);
ycut = y1(trng);
ynew = ycut.*hamming(length(tnew));

% Plot windowed result
t2 = tnew - twind*period;
figure
plot(t2,ynew)
xlabel('Time[ms]');
ylabel('Amplitude');
title('Vowel - Windowed - Time domain');

%Cepstrum
c1 = cceps(ynew);
c2 = fftshift(c1);

maxLim = max(abs(t2));
t3 = -maxLim/2:1000*dt:maxLim/2;

if length(t3) ~= length(c2')
    t3 = -maxLim/2 : 1000*dt : round((maxLim/2)*10000)/10000;
    if length(t3) ~= length(c2')
        t3 = [-round((maxLim/2)*10000)/10000: 1000*dt: round((maxLim/2)*10000)/10000];
    end

end

figure
plot(t3 ,c2)
xlabel('Quefrency[ms]');
ylabel('Amplitude');
title('Vowel - Cepstrum domain');

% Impulse response cepstrum domain
lpf = (t3> -bandwidth*period & t3< bandwidth*period);
h = c2.*lpf';

% Impulse response Time domain
h = ifftshift(h);
H = icceps(h);
%t2 = tnew - twind*period;
figure
plot(t2,H./max(H))
xlabel('Time[ms]');
ylabel('Amplitude');
title('Impulse response - Time domain');

% ----- Synthesize back the signal -----

for i =1:length(t2)
a(i) = abs(period-t2(i));
end
[~,j] = min(a);

for i =1:length(t2)
z(i) = abs(2*period-t2(i));
end
[~,q] = min(z);

v = abs(q-j);

% Create p[n]
p(1,1:length(y)) =0;
for i =1:v:length(p)
p(i) = 1;
end

% Correlation and alignment
[w,lag] = xcorr(H,p);
[~,I] = max(w);
r = lag(I);

if r>0
p = p(r+1:end);

elseif r<0
p = p(-r+1:end);
end

% Convolution
x = conv(p,H,'same');
x = repmat(x'./max(x), round(m/length(x)),1);

t4 = 0:dt:(length(x)-1)*dt;

% Plot 30 ms of the synthesized signal
idx = (t4>=0.2 & t4<=0.23);  
t5 = (t4(idx)-0.2)*1000;
s = x(idx);

figure
plot(t5,s)
xlabel('Time[ms]');
ylabel('Amplitude');
title('Synthesized signal');
