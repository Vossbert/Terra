clc, clear all, close all;
%%
% Load the person_feat variable saved .mat file after running the main.m code to concatenate
% each person footstep into 1 single variable

[filename, filepath] = uigetfile('*.mat', 'Select the .mat file containing the person_feat variable');
if filename == 0
    error('No file selected. Exiting.');
end

% Load the person_feat variable from the selected file
load(fullfile(filepath, filename));

footstep_feat = [];
labels=[];
% THIS NEEDS TO BE ADJUSTED, BASED ON THE DATASET USED
for i = 1:5
    i
    footstep_feat = [footstep_feat ; person_feat{i}];
    labels = [labels; i*ones(size(person_feat{i},1),1)];
    
    
end

footstep_feat = [footstep_feat, labels];

%%
% Save the footstep_feat variable automatically in the same folder as the input file
[~, baseName, ~] = fileparts(filename);
dataname = sprintf('%s_concatenated.mat', baseName);
save(fullfile(filepath, dataname), 'footstep_feat');
fprintf('Saved concatenated data to: %s\n', fullfile(filepath, dataname));
