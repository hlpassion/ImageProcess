I = imread('38.tiff');
imshow(I);
totMask = zeros( size(I,1), size(I,2) ); % accumulate all single object masks to this one
h = imfreehand( gca ); 
% setColor(h,'red');
position = wait( h );
if(size(position) == 0)
    h = imfreehand( gca ); 
    position = wait( h );
end
BW = createMask( h );
while sum(BW(:)) > 10 % less than 10 pixels is considered empty mask
    totMask = totMask | BW; % add mask to global mask
    % you might want to consider removing the old imfreehand object:
    % delete( h ); % try the effect of this line if it helps you or not.
    
    % ask user for another mask
    h = imfreehand( gca ); 
    position = wait( h );
    if(size(position) == 0)
        h = imfreehand( gca ); 
        position = wait( h );
    end
    BW = createMask( h );
end
% show the resulting mask

figure('Name','multi-object mask','NumberTitle','off'); imshow(totMask); 