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

stopFlag = false;              



x = 0;
y = 0;

shape = [x y; x-2 y-2; x y-4; x+2 y-2];
square = polyshape(shape);

i = 1;
while (~all(ismember(square.Vertices, validVertices, 'rows')) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    shape = [x y; x-2 y-2; x y-4; x+2 y-2];
    square = polyshape(shape);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end

x = 0;
y = 0;
i = 1;
shapeChoice = 1;
direction = 1;
shape = getShapePose(x, y, direction, shapeChoice);
pentagon = polyshape(shape);

while ((~all(ismember(pentagon.Vertices, validVertices, 'rows')) ...
        || intersect(square, pentagon).NumRegions > 0) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    shape = getShapePose(x, y, direction, shapeChoice);
    pentagon = polyshape(shape);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end


x = 0;
y = 0;
i = 1;
shapeChoice = 2;
direction = 4;
shape = getShapePose(x, y, direction, shapeChoice);
bigTriangle1 = polyshape(shape);

while ((~all(ismember(bigTriangle1.Vertices, validVertices, 'rows')) ...
        || intersect(bigTriangle1, square).NumRegions > 0 ...
        || intersect(bigTriangle1, pentagon).NumRegions > 0) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    shape = getShapePose(x, y, direction, shapeChoice);
    bigTriangle1 = polyshape(shape);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end

x = 0;
y = 0;
i = 1;
shapeChoice = 2;
direction = 1;
shape = getShapePose(x, y, direction, shapeChoice);
bigTriangle2 = polyshape(shape);

while ((~all(ismember(bigTriangle2.Vertices, validVertices, 'rows')) ...
        || intersect(bigTriangle2, square).NumRegions > 0 ...
        || intersect(bigTriangle2, pentagon).NumRegions > 0 ...
        || intersect(bigTriangle2, bigTriangle1).NumRegions > 0) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    shape = getShapePose(x, y, direction, shapeChoice);
    bigTriangle2 = polyshape(shape);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end

x = 0;
y = 0;
i = 1;
shapeChoice = 3;
direction = 1;
shape = getShapePose(x, y, direction, shapeChoice);
medTriangle = polyshape(shape);

while ((~all(ismember(medTriangle.Vertices, validVertices, 'rows')) ...
        || intersect(medTriangle, square).NumRegions > 0 ...
        || intersect(medTriangle, pentagon).NumRegions > 0 ...
        || intersect(medTriangle, bigTriangle1).NumRegions > 0 ...
        || intersect(medTriangle, bigTriangle2).NumRegions > 0 ) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    shape = getShapePose(x, y, direction, shapeChoice);
    medTriangle = polyshape(shape);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end


x = 0;
y = 0;
i = 1;
shapeChoice = 4;
direction = 1;
shape = getShapePose(x, y, direction, shapeChoice);
smlTriangle = polyshape(shape);

while ((~all(ismember(smlTriangle.Vertices, validVertices, 'rows')) ...
        || intersect(smlTriangle, square).NumRegions > 0 ...
        || intersect(smlTriangle, pentagon).NumRegions > 0 ...
        || intersect(smlTriangle, bigTriangle1).NumRegions > 0 ...
        || intersect(smlTriangle, bigTriangle2).NumRegions > 0 ...
        || intersect(smlTriangle, medTriangle).NumRegions > 0) && ~stopFlag)
    x = validVertices(i, 1);
    y = validVertices(i, 2);
    shape = getShapePose(x, y, direction, shapeChoice);
    smlTriangle = polyshape(shape);
    i = i+1;
    if i > length(validVertices)
        stopFlag = true;
    end
end


figure
plot(square)
hold on
plot(pentagon)
plot(bigTriangle1)
plot(bigTriangle2)
plot(smlTriangle)
plot(medTriangle)



function shapePose = getShapePose(x, y, direction, shapeChoice)
    
    switch shapeChoice
        case 1
            % Up = 1, Down = 2, Left = 3, Right = 4
            pentagon(:, :, 1) = [x y; x-1 y-1; x-1 y-3; x+1 y-3; x+1 y-1];
            pentagon(:, :, 2) = [x y; x-1 y+1; x-1 y+3; x+1 y+3; x+1 y+1];
            pentagon(:, :, 3) = [x y; x+1 y+1; x+3 y+1; x+3 y-1; x+1 y-1];
            pentagon(:, :, 4) = [x y; x-1 y+1; x-3 y+1; x-3 y-1; x-1 y-1];
            shapePose = pentagon(:, :, direction);
        case 2
            % Right = 1, Left = 2, Up = 3, Down = 4
            bigTriangle(:, :, 1) = [x y; x-2 y+2; x-2 y-2];
            bigTriangle(:, :, 2) = [x y; x+2 y+2; x+2 y-2];
            bigTriangle(:, :, 3) = [x y; x+2 y-2; x-2 y-2];
            bigTriangle(:, :, 4) = [x y; x+2 y+2; x-2 y+2];
            shapePose = bigTriangle(:, :, direction);
        case 3
            % Down-right = 1, Down-left = 2, Up-left = 3, Up-right = 4
            medTriangle(:, :, 1) = [x y; x-2 y; x y+2];
            medTriangle(:, :, 2) = [x y; x+2 y; x y+2];
            medTriangle(:, :, 3) = [x y; x+2 y; x y-2];
            medTriangle(:, :, 4) = [x y; x-2 y; x y-2];
            shapePose = medTriangle(:, :, direction);
        case 4
            % Left = 1, Right = 2, Up = 3, Down = 4
            smlTriangle(:, :, 1) = [x y; x+1 y+1; x+1 y-1];
            smlTriangle(:, :, 2) = [x y; x-1 y+1; x-1 y-1];
            smlTriangle(:, :, 3) = [x y; x-1 y-1; x+1 y-1];
            smlTriangle(:, :, 4) = [x y; x-1 y+1; x+1 y+1];
            shapePose = smlTriangle(:, :, direction);
    end
end