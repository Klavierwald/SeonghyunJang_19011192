% Astrodynamics Project#2 - solveVelocityInPerifocalFrame
% code by Seonghyun Jang / 19011192 / Aerospace Engineering

function velocityInPQW = solveVelocityInPerifocalFrame(semimajor_axis, eccentricity, true_anomaly)
    % input: semimajor_axis in km, eccentricity, true_anomaly in degree
    % output: velocityInPQW in km/s

    mu = 3.986004418e5;         % mu = GM, km^3/s^2, gravitational parameter

    a = semimajor_axis;
    e = eccentricity;
    v = true_anomaly*pi/180;    % in rad

    p = a*(1-e^2);              % p, semi-lactus rectum
    
    velocityInPQW = sqrt(mu/p)*[-sin(v) e+cos(v) 0]';
end