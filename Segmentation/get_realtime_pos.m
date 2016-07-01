grayImage = imread('38.tiff');
subplot(2, 2, 1);
imshow(grayImage, []);
fontSize = 12;
title('Original Grayscale Image', 'FontSize', fontSize);
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.
message = sprintf('Left click and hold to begin drawing.\nSimply lift the mouse button to finish');
uiwait(msgbox(message));
hFH = imfreehand();

% Create a binary image ("mask") from the ROI object.
binaryImage = hFH.createMask();
% Display the freehand mask.
subplot(2, 2, 2);
imshow(binaryImage);
title('Binary mask of the region', 'FontSize', fontSize);

% Calculate the area, in pixels, that they drew.
numberOfPixels1 = sum(binaryImage(:));
% Another way to calculate it that takes fractional pixels into account.
numberOfPixels2 = bwarea(binaryImage);

% Get coordinates of the boundary of the freehand drawn region.
structBoundaries = bwboundaries(binaryImage);
xy=structBoundaries{1}; % Get n by 2 array of x,y coordinates.
x = xy(:, 2);	% Columns.
y = xy(:, 1);	% Rows.
subplot(2, 2, 1); % Plot over original image.
hold on;	% Don't blow away the image.
plot(x, y, 'LineWidth', 2);

% Burn line into image by setting it to 255 wherever the mask is true.
burnedImage = grayImage;
burnedImage(binaryImage) = 255;
% Display the image with the mask "burned in."
subplot(2, 2, 3);
imshow(burnedImage);
title('New image with mask burned into image', 'FontSize', fontSize);

% Mask the image and display it.
% Will keep only the part of the image that's inside the mask, zero outside mask.
maskedImage = grayImage;
maskedImage(~binaryImage) = 0;
subplot(2, 2, 4);
imshow(maskedImage);
title('Masked Image', 'FontSize', fontSize);

% Calculate the mean
meanGL = mean(maskedImage(binaryImage));

% Report results.
message = sprintf('Mean value within drawn area = %.3f\nNumber of pixels = %d\nArea in pixels = %.2f', ...
    meanGL, numberOfPixels1, numberOfPixels2);
msgbox(message);