% Astrodynamics Project#2 - ECEF2ENU_DCM.m Coordinate Transform Matrix
% code by Seonghyun Jang / 19011192 / Aerospace Engineering

function DCM = ECEF2ENU_DCM(longitude, latitude)
    % input: longitude, latitude of ground station in deg
    % output: DCM, Coordinate Transform Matrix
    % R  indicates Rotation Transform from Original co. to Rotated co.(Axis Transform)
    % R' indicates Coordinate Transform from Rotated co. to Original co. by the above definition
    
    lat = latitude*pi/180;
    long = longitude*pi/180;

    R3_E  = [cos(pi/2+long) -sin(pi/2+long)  0.0; ...
             sin(pi/2+long)  cos(pi/2+long)  0.0; ...
             0.0             0.0             1.0];

    R1_U = [1.0            0.0            0.0; ...
            0.0 cos(pi/2-lat)  -sin(pi/2-lat); ...
            0.0 sin(pi/2-lat)   cos(pi/2-lat)];

    DCM = R1_U'*R3_E';
end