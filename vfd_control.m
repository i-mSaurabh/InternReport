clc
%========   params = [start_freq ; stepsize; delay time; end frequency; sampling_freq; blocksize]
params = [gbsfhgd;20;2;10;24;1;10000];
writematrix(params,"parameters.txt")
command = sprintf("vfd %s",pwd);
system(command)
%% 
command = sprintf("turnoff %s",pwd );
system(command)

