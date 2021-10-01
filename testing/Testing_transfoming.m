%% using this script to see if it works
clear variables

eeglab 
%close all
data_path  = 'C:\Users\dohorsth\Documents\GitHub\Interpolating_160ch_to_64ch_eeglab\testing\';
cd(data_path) %wherever the script is

 EEG = pop_loadset('filename', '64.set', 'filepath', data_path);%loading participant file with 160 channels
 pop_topoplot(EEG, 1, [0 100]);
 EEG2 = pop_loadset('filename', '160.set', 'filepath', data_path);%loading participant file with 64 channels
 %EEG = transform_n_channels(EEG,EEG2.chanlocs,160, 'landmark');
 %EEG = transform_n_channels(EEG,EEG2.chanlocs,160, 'interpolate');
   EEG = transform_n_channels(EEG,EEG2.chanlocs,160, 'keep');
 pop_topoplot(EEG, 1, [0 100]);
    