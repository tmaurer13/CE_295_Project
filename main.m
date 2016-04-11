Enter file contents here
clear; close all;
fs = 15;    % Font Size for plots

n = number of time steps
dt = size of time step

% Create equality matrices
Beq = zeros(n,1);

Aeq1 = zeros(n); % Portion of matrix related to P_B
for k = 1:size(Aeq1,1) % run through all rows 
  for l = 1:size(Aeq1,2) % run through columns 
    if k == l
      Aeq1(k,l) = -dt;
    end
  end
end

Aeq2 = eye(n); % Portion of matrix related to battery state of charge
for k = 1:size(Aeq2,1) % run through all rows 
  for l = 1:size(Aeq2,2) % run through columns 
    if k+1 == l
      Aeq2(k,l) = -1;
    end
  end
end

% Concatinate Aeq matrices
Aeq = horzcat(Aeq1,Aeq2);
