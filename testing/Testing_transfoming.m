%% using this script to see if it works
clear variables

eeglab 
%close all
data_path  = 'C:\Users\dohorsth\Documents\GitHub\Interpolating_160ch_to_64ch_eeglab\testing\';
cd(data_path) %wherever the script is

 EEG = pop_loadset('filename', '160.set', 'filepath', data_path);%loading participant file with 160 channels
%  EEG  = pop_creabasiceventlist( EEG , 'AlphanumericCleaning', 'on', 'BoundaryNumeric', { -99 }, 'BoundaryString', { 'boundary' } ); 
%     EEG = eeg_checkset( EEG );
%     EEG  = pop_binlister( EEG , 'BDF', 'C:\Users\dohorsth\Documents\GitHub\Interpolating_160ch_to_64ch_eeglab\testing\binlist_main.txt', 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' ); 
%     EEG = pop_epochbin( EEG , [-100  700],  [-100 0]);
%   ERP = pop_averager( EEG , 'Criterion', 1, 'DSindex',1, 'ExcludeBoundary', 'on', 'SEM', 'on' );
%   ERP = pop_savemyerp(ERP, 'erpname', '160_original.erp', 'filename', '160_original.erp', 'filepath', data_path);
% %  
%    pop_topoplot(EEG, 1, [0 100]);
 EEG2 = pop_loadset('filename', '64.set', 'filepath', data_path);%loading participant file with 64 channels
 %figure();plot(EEG.data(1,:)); title('160 A1/cz')
 %figure();plot(EEG.data(105,:)); title('160 D9/fp1')
% pop_eegplot( EEG, 1, 1, 1);
 EEG = transform_n_channels(EEG,EEG2.chanlocs,64, 'keep');
   %EEG = transform_n_channels(EEG,EEG2.chanlocs,64, 'keep');
 %figure();plot(EEG.data(48,:)); title('64 A1/cz')
 %figure();plot(EEG.data(1,:)); title('64 D9/fp1')
 %pop_eegplot( EEG, 1, 1, 1);
  EEG  = pop_creabasiceventlist( EEG , 'AlphanumericCleaning', 'on', 'BoundaryNumeric', { -99 }, 'BoundaryString', { 'boundary' } ); 
    EEG = eeg_checkset( EEG );
    EEG  = pop_binlister( EEG , 'BDF', 'C:\Users\dohorsth\Documents\GitHub\Interpolating_160ch_to_64ch_eeglab\testing\binlist_main.txt', 'IndexEL',  1, 'SendEL2', 'EEG', 'Voutput', 'EEG' ); 
    EEG = pop_epochbin( EEG , [-100  700],  [-100 0]);
  ERP = pop_averager( EEG , 'Criterion', 1, 'DSindex',1, 'ExcludeBoundary', 'on', 'SEM', 'on' );
  ERP = pop_savemyerp(ERP, 'erpname', '160_keep.erp', 'filename', '160_keep.erp', 'filepath', data_path);
 
 %pop_topoplot(EEG, 1, [0 100]);
    