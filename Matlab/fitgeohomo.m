%This is a simple port of the fitGeoTransformation function that explicitly
%returns the homography together with the transform and does not require to
%specify parameters other than the strictly needed ones for our usecase.
function [tform, homo] = fitgeohomo(movingPoints,fixedPoints)

    [uv,normMatrix1] = images.geotrans.internal.normalizeControlPoints(movingPoints);
    [xy,normMatrix2] = images.geotrans.internal.normalizeControlPoints(fixedPoints);

    minRequiredNonCollinearPairs = 4;
    M = size(xy,1);
    x = xy(:,1);
    y = xy(:,2);
    vec_1 = ones(M,1);
    vec_0 = zeros(M,1);
    u = uv(:,1);
    v = uv(:,2);

    U = [u; v];

    X = [x      y      vec_1  vec_0  vec_0  vec_0  -u.*x  -u.*y;
         vec_0  vec_0  vec_0  x      y      vec_1  -v.*x  -v.*y  ];

    % We know that X * Tvec = U
    if rank(X) >= 2*minRequiredNonCollinearPairs 
        Tvec = X \ U;    
    else
        error(message('images:geotrans:requiredNonCollinearPoints', minRequiredNonCollinearPairs, 'projective'))
    end

    % We assumed I = 1;
    Tvec(9) = 1;

    Tinv = reshape(Tvec,3,3);

    Tinv = normMatrix2 \ (Tinv * normMatrix1);

    T = inv(Tinv);
    T = T ./ T(3,3);

    homo = T;
    tform = projective2d(T);
end
        