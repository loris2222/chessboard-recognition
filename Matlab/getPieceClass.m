function class = getPieceClass(image, net)
    testImage = image;
    % Create augmentedImageDatastore to automatically resize the image when
    % image features are extracted using activations.
    ds = augmentedImageDatastore([224 224 3], testImage, 'ColorPreprocessing', 'gray2rgb');
    class = classify(net,ds);
    % Extract image features using the CNN
    %imageFeatures = activations(net, ds, 'fc8', 'OutputAs', 'columns');
    % Make a prediction using the classifier
    %class = predict(classifier, imageFeatures, 'ObservationsIn', 'columns');
end