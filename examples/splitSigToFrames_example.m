%% SPLIT SIGNALS TO FRAMES EXAMPLE

clc; clearvars; close all;

% create signal matrix of 4 signals (rows) and 1000 samples (columns)
sigMatrix = 2*rand(1000,4) - 1;

% split into frames
frameLen = 20;
frameOverlap = 75;
debug = true;
frameSigData = splitSigToFrames(sigMatrix, frameLen, frameOverlap, debug);