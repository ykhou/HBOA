%% 3.1部分
% fra pump 350mw
% edfa pump 60mw
clc;
clear;
%%
c=3e8;
h=6.62606896e-34;
wavelength=1550.82e-9;
v=c./wavelength;
Be=0.02e-9.*c./(wavelength^2);
%% EDFA data
Pin_edfa = [-45.4 -39.8 -34.970 -30 -25.789 -20.1];
Pase_edfa = [-34.665 -34.902 -34.942 -35.949 -36.168 -36.788];
Pout_edfa = [-18.961 -13.826 -9.183 -5.404 -1.462 3.620];

Pin_edfa=10.^(Pin_edfa./10)*1e-3;
Pase_edfa=10.^(Pase_edfa./10)*1e-3;
Pout_edfa=10.^(Pout_edfa./10)*1e-3;
%% EDFA
Gain_edfa = (Pout_edfa - Pase_edfa) ./ Pin_edfa;
GAIN_edfa = 10.*log10(Gain_edfa)
NF_edfa_mw = ((Pase_edfa) ./ (Gain_edfa.*h*v*Be) + (1./Gain_edfa));
NF_edfa = 10.*log10((Pase_edfa) ./ (Gain_edfa.*h*v*Be) + (1./Gain_edfa))

% Gain 26.3206   25.9400   25.7755   24.5922   24.3255   23.7196
% NF 3.9700    4.1139    4.2384    4.4159    4.4638    4.4506
%% FRA data
Pin_fra = [-44.7 -40 -35.3 -30.3 -25.09 -19.8];
Pase_fra = [-57.629 -57.756 -57.771 -57.308 -57.543 -58.416];
Pout_fra = [-34.939 -30.24 -26.208 -21.405 -17.306 -12.937];

Pin_fra=10.^(Pin_fra./10)*1e-3;
Pase_fra=10.^(Pase_fra./10)*1e-3;
Pout_fra=10.^(Pout_fra./10)*1e-3;
%% FRA
Gain_fra = (Pout_fra - Pase_fra) ./ Pin_edfa;
GAIN_fra = 10.*log10(Gain_fra)
NF_fra_mw = ((Pase_edfa) ./ (Gain_fra.*h*v*Be) + (1./Gain_fra));
NF_fra = 10.*log10((Pase_fra) ./ (Gain_fra.*h*v*Be) + (1./Gain_fra))
% GAIN_fra = 10.4376    9.5523    8.7590    8.5939    8.4826    7.1629
% NF_fra = -2.3769   -1.5986   -0.8178   -0.2609   -0.3493    0.2436
%% EDFA+FRA data
Pin_edfa_fra = [-45.4 -39.8 -34.9 -30 -25.2 -20.1];
Pase_edfa_fra = [-37.609 -37.58 -36.825 -36.504 -38.701 -37.880];
Pout_edfa_fra = [-17.566 -12.761 -7.548 -4.564 -2.778 -2.542];

Pout_on = [-17.566 -11.761 -7.548 -4.564 -2.778 -2.542];
Pout_off = [-30.201 -23.931 -18.811 -14.683 -12.323 -12.831];

Pin_edfa_fra=10.^(Pin_edfa_fra./10)*1e-3;
Pase_edfa_fra=10.^(Pase_edfa_fra./10)*1e-3;
Pout_edfa_fra=10.^(Pout_edfa_fra./10)*1e-3;
%% EDFA+FRA
Gain_edfa_fra = (Pout_edfa_fra - Pase_edfa_fra) ./ Pin_edfa_fra;
GAIN_edfa_fra = 10.*log10(Gain_edfa_fra) + Pout_on - Pout_off
% GAIN_edfa_fra = 10.*log10(Gain_edfa_fra)
NF_edfa_fra_mw = ((Pase_edfa_fra) ./ (Gain_edfa_fra.*h*v*Be) + (1./Gain_edfa_fra));
NF_edfa_fra = 10.*log10((Pase_edfa_fra) ./ (Gain_edfa_fra.*h*v*Be) + (1./Gain_edfa_fra))

% GAIN_edfa_fra = 40.4258   39.1947   38.6099   35.5522   31.9659   27.8457
% NF_edfa_fra = -0.4402    0.3548    0.7864    3.0205    3.8400    9.5233
%% FRA+EDFA data
Pin_fra_edfa = [-44.7 -40 -35.3 -30.3 -25.09 -19.8];
% Pase_fra_edfa = [-55.629 -55.756 -55.771 -55.308 -55.543 -56.416];
Pase_fra_edfa = [-40.127 -37.710 -37.170 -39.566 -39.653 -39.745];
Pout_fra_edfa = [-17.965 -11.898 -7.074 -5.1 -1.499 2.218];

Pout_on = [-35.939 -31.24 -27.208 -22.405 -19.306 -15.937];
Pout_off = [-50.5 -42.3 -38.562 -32.001 -27.808 -21.43];

Pin_fra_edfa=10.^(Pin_fra_edfa./10)*1e-3;
Pase_fra_edfa=10.^(Pase_fra_edfa./10)*1e-3;
Pout_fra_edfa=10.^(Pout_fra_edfa./10)*1e-3;
%% FRA+EDFA
Gain_fra_edfa = (Pout_fra_edfa - Pase_fra_edfa) ./ Pin_fra_edfa;
GAIN_fra_edfa = 10.*log10(Gain_fra_edfa) + Pout_on - Pout_off
% GAIN_fra_edfa = 10.*log10(Gain_fra_edfa)
NF_fra_edfa_mw = ((Pase_fra_edfa) ./ (Gain_fra_edfa.*h*v*Be) + (1./Gain_fra_edfa));
NF_fra_edfa = 10.*log10((Pase_fra_edfa) ./ (Gain_fra_edfa.*h*v*Be) + (1./Gain_fra_edfa))

% GAIN_fra_edfa = 41.2695   39.1506   39.5757   34.7944   32.0923   27.5107
% NF_fra_edfa = -1.8697   -0.8408   -0.4330    0.1997    0.7210    1.2019