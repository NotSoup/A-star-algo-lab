%%%%%%%%
% Lab 2
% Angelo Petrolino
%%%%%%%%

close all;
clear all;
clc;

%% Problem 5

% Possible verticies for polygon to occupy
validVertices = [ 2 0; 4 0; 6 0;
                  1 1; 3 1; 5 1; 7 1;
                  0 2; 2 2; 4 2; 6 2; 8 2;
                  1 3; 3 3; 5 3; 7 3;
                  2 4; 4 4; 6 4              ];

x = 0;
y = 0;          
square = polyshape([x y; x-2 y-2; x y-4; x+2 y-2]);

i = 1;
stopFlag = false;
while (~all(ismember(square.Vertices, validVertices, 'rows')) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    square = polyshape([x y; x-2 y-2; x y-4; x+2 y-2]);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end

x = 0;
y = 0;
pentagon_U = polyshape([x y; x-1 y-1; x-1 y-3; x+1 y-3; x+1 y-1]);


i = 1;
% KEEP STOP_FLAG CONDITION THROUGHOUT PLACEMENT
while ((~all(ismember(pentagon_U.Vertices, validVertices, 'rows')) ...
        || intersect(square, pentagon_U).NumRegions > 0) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    pentagon_U = polyshape([x y; x-1 y-1; x-1 y-3; x+1 y-3; x+1 y-1]);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end


x = 0;
y = 0;
bigTriangle1_D = polyshape([x y; x-2 y+2; x+2 y+2]);

i = 1;
% KEEP STOP_FLAG CONDITION THROUGHOUT PLACEMENT
while ((~all(ismember(bigTriangle1_D.Vertices, validVertices, 'rows')) ...
        || intersect(bigTriangle1_D, square).NumRegions > 0 ...
        || intersect(bigTriangle1_D, pentagon_U).NumRegions > 0) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    bigTriangle1_D = polyshape([x y; x-2 y+2; x+2 y+2]);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end

x = 0;
y = 0;
bigTriangle2_R = polyshape([x y; x-2 y+2; x-2 y-2]);

i = 1;
% KEEP STOP_FLAG CONDITION THROUGHOUT PLACEMENT
while ((~all(ismember(bigTriangle2_R.Vertices, validVertices, 'rows')) ...
        || intersect(bigTriangle2_R, square).NumRegions > 0 ...
        || intersect(bigTriangle2_R, pentagon_U).NumRegions > 0 ...
        || intersect(bigTriangle2_R, pentagon_U).NumRegions > 0) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    bigTriangle2_R = polyshape([x y; x-2 y+2; x-2 y-2]);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end

x = 0;
y = 0;
medTriangle_DL = polyshape([x y; x-2 y; x y+2]);

i = 1;
% KEEP STOP_FLAG CONDITION THROUGHOUT PLACEMENT
while ((~all(ismember(medTriangle_DL.Vertices, validVertices, 'rows')) ...
        || intersect(medTriangle_DL, square).NumRegions > 0 ...
        || intersect(medTriangle_DL, pentagon_U).NumRegions > 0 ...
        || intersect(medTriangle_DL, bigTriangle1_D).NumRegions > 0 ...
        || intersect(medTriangle_DL, bigTriangle2_R).NumRegions > 0 ) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    medTriangle_DL = polyshape([x y; x-2 y; x y+2]);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end


x = 0;
y = 0;
smlTriangle_L = polyshape([x y; x+1 y+1; x+1 y-1]);

i = 1;
% KEEP STOP_FLAG CONDITION THROUGHOUT PLACEMENT
while ((~all(ismember(smlTriangle_L.Vertices, validVertices, 'rows')) ...
        || intersect(smlTriangle_L, square).NumRegions > 0 ...
        || intersect(smlTriangle_L, pentagon_U).NumRegions > 0 ...
        || intersect(smlTriangle_L, bigTriangle1_D).NumRegions > 0 ...
        || intersect(smlTriangle_L, bigTriangle2_R).NumRegions > 0 ...
        || intersect(smlTriangle_L, medTriangle_DL).NumRegions > 0) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    smlTriangle_L = polyshape([x y; x+1 y+1; x+1 y-1]);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end

plot(square)
hold on
plot(pentagon_U)
plot(bigTriangle1_D)
plot(bigTriangle2_R)
plot(smlTriangle_L)
plot(medTriangle_DL)