function [p,h] = getDeconvolution(signal,fs,llimit,ulimit,filterlimit,figtitle)

    x = signal(llimit:ulimit); % Extract the segment defined by llimit and ulimit
    xwin = x.*hamming(ulimit-llimit+1); % Apply Hamming window to the segment
    t = (0:length(xwin)-1)/fs; % Time vector for the windowed signal
    
    figure();
    subplot(4,1,1);
    plot(t,x);
    hold on;
    plot(t,xwin);
    xlabel('Time (s)');
    legend('Original segment','Windowed segment');
    title(figtitle);

    [ccep,nd] = cceps(xwin);% Calculation of complex cepstrum
    
    subplot(4,1,2);
    quefrency_axis = (0:length(ccep)-1)/fs;
    plot(quefrency_axis,ccep);
    xlabel('Quefrency (s)');
    title('Complex Cepstrum');

    len_ccep = length(ccep);
    lifter_mask_h = zeros(len_ccep, 1);
    lifter_mask_h(1:filterlimit) = 1; 
    ccep_h = ccep .* lifter_mask_h;
    ccep_p = ccep - ccep_h;

    p = icceps(ccep_p,nd); % Inverse complex cepstrum for pitch
    subplot(4,1,3);
    plot(t,p); % Plot over the same time axis as the windowed signal
    xlabel('Time (s)');
    title('Pitch Signal (Excitation)');

    h = icceps(ccep_h,nd); % Inverse complex cepstrum for vocal tract
    subplot(4,1,4);
    plot(t,h); % Plot over the same time axis as the windowed signal
    xlabel('Time (s)');
    title('Impulse Response (Vocal Tract)');

    sgtitle(figtitle);
end