%% Environment initialization
clear
clc
close all

D = 'boards';
S = dir(fullfile(D,'*.jpg')); % pattern to match filenames.
offset = 0;
for k = 1:numel(S)
    F = fullfile(D,S(k).name);
    offset = offset + saveBoardPieces(F, offset);
end
