%% Accurate Zero-Crossing Detection
% 
% This example shows how zero crossings work in Simulink(R). 
% In this model, three shifted sine waves are fed into an absolute value 
% block and saturation block. At exactly t = 5, the output of the switch block 
% changes from the absolute value to the saturation block. Zero crossings 
% in Simulink will automatically detect exactly when the switch block 
% changes its output, and the solver will step to the exact time that the 
% event happens. This can be seen by examining the output in the scope.

open_system('sldemo_zeroxing');
sim('sldemo_zeroxing');

%% 
% Copyright 2012 The MathWorks, Inc.