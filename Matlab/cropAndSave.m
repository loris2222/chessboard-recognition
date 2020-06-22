source = 'labeled_pieces/empty/';
dest = 'labeled_pieces_cropped/empty/';
S = dir(fullfile(source,'*.jpg')); % pattern to match filenames
for k = 1:numel(S)
    F = fullfile(source,S(k).name);
    im = imread(F);
    im = imresize(im,[224,224]);
    im(1:57,1:224,1:3)=0;
    im = imrotate(im, -45, 'bicubic', 'loose');
    im = imcrop(im,[70,70,180,180]);
    im = imrotate(im, 45, 'bicubic', 'crop');
    im = imresize(im,[224,224]);
    imwrite(im,strcat(dest,S(k).name));
end