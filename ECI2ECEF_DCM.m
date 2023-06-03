% Astrodynamics Project#2 - ECI2ECEF_DCM.m Coordinate Transform Matrix
% code by Seonghyun Jang / 19011192 / Aerospace Engineering

function DCM = ECI2ECEF_DCM(time)
    % input: time in [yyyy mm dd hh mm ss] vector format
    %   where GMST, ECEF is calculated under the time = GMST + 0 (GMST from GNSS data)
    %   where UTC,  ECEF is calculated under the time = GMST + UTC (at Ground Station, UTC from longitude of Ground Station)
    % output: DCM, Coordinate Transform Matrix
    % R_UTC  indicates Rotation Transform from Original co. to Rotated co.(Axis Transform)
    % R_UTC' indicates Coordinate Transform from Rotated co. to Original co. by the above definition
    
    time2long = siderealTime(juliandate(datetime(time)));
    time2long = time2long*pi/180;
    
    R_UTC = [cos(time2long) -sin(time2long)  0.0; ...
             sin(time2long)  cos(time2long)  0.0; ...
             0.0             0.0             1.0];

    DCM = R_UTC';
    % R_UTC  is Rotation Matrix from ECEF to ECI
    % R_UTC' is Coordinate Transform Matrix from ECI to ECEF
end