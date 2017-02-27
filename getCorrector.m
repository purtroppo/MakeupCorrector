%% Corrector detector
% Because I'm a computer scientist and I solve problems like this.

customImage = 'eye.jpg';   
img = imresize(imread(customImage),0.5);
startPoints = [];
figure; imshow(img), hold on;
title('Select points (right-click to exit)');
buttonPressed = 1;
while buttonPressed == 1
    [xCoord, yCoord, buttonPressed] = ginput(1);
    plot(xCoord, yCoord, 'rs-', 'MarkerEdgeColor', 'w');
    startPoints = horzcat(startPoints, [xCoord; yCoord]);
    drawnow;
end
close all
startPoints = uint8(startPoints);

colorCollected = [];
for i=1:size(startPoints,2)
    colorCollected(i,:) = img(startPoints(1,i),startPoints(2,i),:);
end
avgColor = reshape(mean(colorCollected,1), [1,1,3]);
complementaryColor = reshape([255;255;255], [1,1,3]) - avgColor;

subplot(1,2,1); 
imshow(uint8(repmat(avgColor,200)));
title('Average color:');

subplot(1,2,2); imshow(uint8(repmat(complementaryColor,200)));
title('Complementary color:');
    
    