% Astrodynamics Project#2 - azimuth.m
% code by Seonghyun Jang / 19011192 / Aerospace Engineering

function az = azimuth(ENU)
    % input: ENU, nx3 with ENU position in km
    % output: az, 1xn azimuth angle in deg
    % ECEF_local: ENU from GMST + UTC, ECEF_local = R_UTC'*ECEF
    % ENU: East-North-Up Coordinate at Ground Station
    
    az = atan2(ENU(:,1), ENU(:,2));

    [m, n] = size(az);
    for i=1:1:m
        if(az(i)<0)
            az(i) = az(i) + 2*pi;
        end
    end
    
    az = 180/pi*az';   % row vector form
end