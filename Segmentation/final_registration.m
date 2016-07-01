
fixed = rgb2gray(imread('fix.tiff'));
moving = rgb2gray(imread('04.tiff'));

figure, imshowpair(moving, fixed, 'montage')
title('Unregistered')

figure, imshowpair(moving, fixed)
title('Unregistered')

[optimizer,metric] = imregconfig('multimodal');

movingRegisteredDefault = imregister(moving, fixed, 'affine', optimizer, metric);

figure, imshowpair(movingRegisteredDefault, fixed)
title('A: Default registration')

disp(optimizer)
disp(metric)

optimizer.InitialRadius = optimizer.InitialRadius/3.5;

movingRegisteredAdjustedInitialRadius = imregister(moving, fixed, 'affine', optimizer, metric);
figure, imshowpair(movingRegisteredAdjustedInitialRadius, fixed)
title('Adjusted InitialRadius')

optimizer.MaximumIterations = 300;
movingRegisteredAdjustedInitialRadius300 = imregister(moving, fixed, 'affine', optimizer, metric);

figure, imshowpair(movingRegisteredAdjustedInitialRadius300, fixed)
title('B: Adjusted InitialRadius, MaximumIterations = 300, Adjusted InitialRadius.')

tformSimilarity = imregtform(moving,fixed,'similarity',optimizer,metric);

Rfixed = imref2d(size(fixed));


movingRegisteredRigid = imwarp(moving,tformSimilarity,'OutputView',Rfixed);
figure, imshowpair(movingRegisteredRigid, fixed);
title('C: Registration based on similarity transformation model.');
tformSimilarity.T

movingRegisteredAffineWithIC = imregister(moving,fixed,'affine',optimizer,metric,...
    'InitialTransformation',tformSimilarity);
figure, imshowpair(movingRegisteredAffineWithIC,fixed);
title('D: Registration from affine model based on similarity initial condition.');

%%
% Using the 'InitialTransformation' to refine the 'similarity' result of
% |imregtform| with a full affine model has also yielded a nice
% registration result.

%% Step 5: Deciding When Enough is Enough
% Comparing the results of running |imregister| with different
% configurations and initial conditions, it becomes apparent that there are
% a large number of input parameters that can be varied in imregister, each
% of which may lead to different registration results.

figure
imshowpair(movingRegisteredDefault, fixed)
title('A - Default settings.');

figure
imshowpair(movingRegisteredAdjustedInitialRadius, fixed)
title('B - Adjusted InitialRadius, 100 Iterations.');

figure
imshowpair(movingRegisteredAdjustedInitialRadius300, fixed)
title('C - Adjusted InitialRadius, 300 Iterations.');

figure
imshowpair(movingRegisteredAffineWithIC, fixed)
title('D - Registration from affine model based on similarity initial condition.');

%%
% It can be difficult to quantitatively compare registration results
% because there is no one quality metric that accurately describes the
% alignment of two images. Often, registration results must be judged
% qualitatively by visualizing the results. In The results above, the
% registration results in C) and D) are both very good and are difficult to
% tell apart visually.

%% Step 6: Alternate Visualizations
% Often as the quality of multimodal registrations improve it becomes more
% difficult to judge the quality of registration visually.  This is because
% the intensity differences can obscure areas of misalignment.  Sometimes
% switching to a different display mode for |imshowpair| exposes hidden
% details.  (This is not always the case.)

displayEndOfDemoMessage(mfilename)











