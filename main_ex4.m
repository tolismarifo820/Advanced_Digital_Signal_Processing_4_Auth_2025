clear all;
close all;
clc;

%% 1.Plot the Male and Female Vowels
FemaleA = 'FemaleA.wav';
FemaleE = 'FemaleE.wav';
FemaleI = 'FemaleI.wav';
FemaleO = 'FemaleO.wav';
FemaleU = 'FemaleU.wav';

MaleA = 'MaleA.wav';
MaleE = 'MaleE.wav';
MaleI = 'MaleI.wav';
MaleO = 'MaleO.wav';
MaleU = 'MaleU.wav';

% Read the audio files
[FemaleAy, Fs] = audioread(FemaleA);% Fs is the same for every sample from recording parameters
[FemaleEy] = audioread(FemaleE);
[FemaleIy] = audioread(FemaleI);
[FemaleOy] = audioread(FemaleO);
[FemaleUy] = audioread(FemaleU);

[MaleAy] = audioread(MaleA);
[MaleEy] = audioread(MaleE);
[MaleIy] = audioread(MaleI);
[MaleOy] = audioread(MaleO);
[MaleUy] = audioread(MaleU);

% Create time vectors for each signal
t = (0:length(FemaleAy)-1) / Fs; % Same for every signal because of 5sec truncation

% Plot the audio signals
figure(); 

subplot(5, 1, 1);
plot(t, FemaleAy(:, 1)); % We keep only the one channel  
title('Female A - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 1, 2);
plot(t, FemaleEy(:, 1));
title('Female E - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 1, 3);
plot(t, FemaleIy(:, 1));
title('Female I - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 1, 4);
plot(t, FemaleOy(:, 1));
title('Female O - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 1, 5);
plot(t, FemaleUy(:, 1));
title('Female U - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');

sgtitle('Female Vowel Audio Signals - Left Channel');

% Plot the audio signals
figure(); 

subplot(5, 1, 1);
plot(t, MaleAy(:, 1)); % We also keep the one channel
title('Male A - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 1, 2);
plot(t, MaleEy(:, 1));
title('Male E - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 1, 3);
plot(t, MaleIy(:, 1));
title('Male I - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 1, 4);
plot(t, MaleOy(:, 1));
title('Male O - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(5, 1, 5);
plot(t, MaleUy(:, 1));
title('Male U - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');

sgtitle('Male Vowel Audio Signals - Left Channel');

% Plotting both male and female
figure();

subplot(5, 1, 1);
plot(t, FemaleAy(:, 1), 'r', t, MaleAy(:, 1), 'b');
title('Vowel A - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Female', 'Male');

subplot(5, 1, 2);
plot(t, FemaleEy(:, 1), 'r', t, MaleEy(:, 1), 'b');
title('Vowel E - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Female', 'Male');

subplot(5, 1, 3);
plot(t, FemaleIy(:, 1), 'r', t, MaleIy(:, 1), 'b');
title('Vowel I - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Female', 'Male');

subplot(5, 1, 4);
plot(t, FemaleOy(:, 1), 'r', t, MaleOy(:, 1), 'b');
title('Vowel O - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Female', 'Male');

subplot(5, 1, 5);
plot(t, FemaleUy(:, 1), 'r', t, MaleUy(:, 1), 'b');
title('Vowel U - Left Channel');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Female', 'Male');

sgtitle('Male and Female Vowel Audio Signals - Left Channel');

%% 2.Cepstrum calculation and visualization
cepstrumFA = rceps(FemaleAy(:,1));% Calculating the real cepstrum for the left channel
cepstrumFE = rceps(FemaleEy(:,1));
cepstrumFI = rceps(FemaleIy(:,1));
cepstrumFO = rceps(FemaleOy(:,1));
cepstrumFU = rceps(FemaleUy(:,1));

cepstrumMA = rceps(MaleAy(:,1));
cepstrumME = rceps(MaleEy(:,1));
cepstrumMI = rceps(MaleIy(:,1));
cepstrumMO = rceps(MaleOy(:,1));
cepstrumMU = rceps(MaleUy(:,1));

cepstrumFA_truncated = cepstrumFA(1:1200); % 1200 samples are enough based on testing
cepstrumFE_truncated = cepstrumFE(1:1200);
cepstrumFI_truncated = cepstrumFI(1:1200);
cepstrumFO_truncated = cepstrumFO(1:1200);
cepstrumFU_truncated = cepstrumFU(1:1200);

cepstrumMA_truncated = cepstrumMA(1:1200);
cepstrumME_truncated = cepstrumME(1:1200);
cepstrumMI_truncated = cepstrumMI(1:1200);
cepstrumMO_truncated = cepstrumMO(1:1200);
cepstrumMU_truncated = cepstrumMU(1:1200);

% Quefrency vector for the first 1200 points
qt = (0:length(cepstrumFA_truncated) - 1) / Fs;

% Desired y-axis limits for better visualization
y_low_lim = -0.12;
y_up_lim = 0.12;

% Plot the cepstrum
figure()
plot(qt, cepstrumFA_truncated);
title('Female A Cepstrum - Left Segment');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);

figure()
plot(qt,cepstrumFE_truncated);
title('Female E Cepstrum - Left Segment');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);

figure()
plot(qt,cepstrumFI_truncated);
title('Female I Cepstrum - Left Segment');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);

figure()
plot(qt,cepstrumFO_truncated);
title('Female O Cepstrum - Left Segment');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);

figure()
plot(qt,cepstrumFU_truncated);
title('Female U Cepstrum - Left Segment');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);

% Plot the cepstrum
figure()
plot(qt, cepstrumMA_truncated);
title('Male A Cepstrum - Left Segment');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);

figure()
plot(qt,cepstrumME_truncated);
title('Male E Cepstrum - Left Segment');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);

figure()
plot(qt,cepstrumMI_truncated);
title('Male I Cepstrum - Left Segment');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);

figure()
plot(qt,cepstrumMO_truncated);
title('Male O Cepstrum - Left Segment');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);

figure()
plot(qt,cepstrumMU_truncated);
title('Male U Cepstrum - Left Segment');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);

% Plotting combined Male and Female Cepstrum for each Vowel
figure();
plot(qt, cepstrumFA_truncated);
hold on;
plot(qt, cepstrumMA_truncated, 'r');
hold off;
title('Comparison of Female A and Male A Cepstrum');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);
legend('Female', 'Male');
grid on;

figure();
plot(qt, cepstrumFE_truncated);
hold on;
plot(qt, cepstrumME_truncated, 'r');
hold off;
title('Comparison of Female E and Male E Cepstrum');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);
legend('Female', 'Male');
grid on;

figure();
plot(qt, cepstrumFI_truncated);
hold on;
plot(qt, cepstrumMI_truncated, 'r');
hold off;
title('Comparison of Female I and Male I Cepstrum');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);
legend('Female', 'Male');
grid on;

figure();
plot(qt, cepstrumFO_truncated);
hold on;
plot(qt, cepstrumMO_truncated, 'r');
hold off;
title('Comparison of Female O and Male O Cepstrum');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);
legend('Female', 'Male');
grid on;

figure();
plot(qt, cepstrumFU_truncated);
hold on;
plot(qt, cepstrumMU_truncated, 'r');
hold off;
title('Comparison of Female U and Male U Cepstrum');
xlabel('Quefrency (1/Hz)');
ylabel('Amplitude');
ylim([y_low_lim, y_up_lim]);
legend('Female', 'Male');
grid on;

%% 3. Lifter (filter) the cepstrum domain signal
% Female 
% Based on the first peak in each vowel's cepstrum plot
segment_length_FA = round(3 * 0.00296 * Fs);
segment_length_FE = round(3 * 0.0040 * Fs);
segment_length_FI = round(3 * 0.00369 * Fs);
segment_length_FO = round(3 * 0.00377 * Fs);
segment_length_FU = round(3 * 0.00346 * Fs);

% Targeting robust, high-amplitude, voiced segments to avoid noise parts
start_index_FA = round(1.9 * Fs);
start_index_FE = round(1.05 * Fs);
start_index_FI = round(1.8 * Fs);
start_index_FO = round(2.2 * Fs);
start_index_FU = round(1 * Fs);

% Derived from cepstrum plots
filterlimit_FA = round(0.0029 * Fs);
filterlimit_FE = round(0.0039 * Fs);
filterlimit_FI = round(0.0036 * Fs);
filterlimit_FO = round(0.0037 * Fs);
filterlimit_FU = round(0.0034 * Fs);

[p_f_a,h_f_a] = getDeconvolution(FemaleAy(:,1), Fs, start_index_FA, min(start_index_FA + segment_length_FA - 1, length(FemaleAy(:,1))), filterlimit_FA, 'Vowel A - Female');
[p_f_e,h_f_e] = getDeconvolution(FemaleEy(:,1), Fs, start_index_FE, min(start_index_FE + segment_length_FE - 1, length(FemaleEy(:,1))), filterlimit_FE, 'Vowel E - Female');
[p_f_i,h_f_i] = getDeconvolution(FemaleIy(:,1), Fs, start_index_FI, min(start_index_FI + segment_length_FI - 1, length(FemaleIy(:,1))), filterlimit_FI, 'Vowel I - Female');
[p_f_o,h_f_o] = getDeconvolution(FemaleOy(:,1), Fs, start_index_FO, min(start_index_FO + segment_length_FO - 1, length(FemaleOy(:,1))), filterlimit_FO, 'Vowel O - Female');
[p_f_u,h_f_u] = getDeconvolution(FemaleUy(:,1), Fs, start_index_FU, min(start_index_FU + segment_length_FU - 1, length(FemaleUy(:,1))), filterlimit_FU, 'Vowel U - Female');

% Male
% Same approach as before after inspection
male_segment_length_MA = round(3 * 0.00779 * Fs);
male_segment_length_ME = round(3 * 0.00743 * Fs);
male_segment_length_MI = round(3 * 0.00704 * Fs);
male_segment_length_MO = round(3 * 0.00729 * Fs);
male_segment_length_MU = round(3 * 0.00681 * Fs);

start_index_MA = round(0.775 * Fs);
start_index_ME = round(3.627 * Fs);
start_index_MI = round(3.7 * Fs);
start_index_MO = round(2 * Fs);
start_index_MU = round(1 * Fs);

filterlimit_MA = round(0.0077 * Fs);
filterlimit_ME = round(0.0074 * Fs);
filterlimit_MI = round(0.007 * Fs);
filterlimit_MO = round(0.0072 * Fs);
filterlimit_MU = round(0.0068 * Fs);

[p_m_a,h_m_a] = getDeconvolution(MaleAy(:,1), Fs, start_index_MA, min(start_index_MA + male_segment_length_MA - 1, length(MaleAy(:,1))), filterlimit_MA, 'Vowel A - Male');
[p_m_e,h_m_e] = getDeconvolution(MaleEy(:,1), Fs, start_index_ME, min(start_index_ME + male_segment_length_ME - 1, length(MaleEy(:,1))), filterlimit_ME, 'Vowel E - Male');
[p_m_i,h_m_i] = getDeconvolution(MaleIy(:,1), Fs, start_index_MI, min(start_index_MI + male_segment_length_MI - 1, length(MaleIy(:,1))), filterlimit_MI, 'Vowel I - Male');
[p_m_o,h_m_o] = getDeconvolution(MaleOy(:,1), Fs, start_index_MO, min(start_index_MO + male_segment_length_MO - 1, length(MaleOy(:,1))), filterlimit_MO, 'Vowel O - Male');
[p_m_u,h_m_u] = getDeconvolution(MaleUy(:,1), Fs, start_index_MU, min(start_index_MU + male_segment_length_MU - 1, length(MaleUy(:,1))), filterlimit_MU, 'Vowel U - Male');

%% 4. Synthesize back the voiced signals
synthesize(p_f_a,h_f_a,Fs,'Vowel A - Female');
synthesize(p_f_e,h_f_e,Fs,'Vowel E - Female');
synthesize(p_f_i,h_f_i,Fs,'Vowel I - Female');
synthesize(p_f_o,h_f_o,Fs,'Vowel O - Female');
synthesize(p_f_u,h_f_u,Fs,'Vowel U - Female');

synthesize(p_m_a,h_m_a,Fs,'Vowel A - Male');
synthesize(p_m_e,h_m_e,Fs,'Vowel E - Male');
synthesize(p_m_i,h_m_i,Fs,'Vowel I - Male');
synthesize(p_m_o,h_m_o,Fs,'Vowel O - Male');
synthesize(p_m_u,h_m_u,Fs,'Vowel U - Male');