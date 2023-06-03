% Astrodynamics Project#2 - elevation.m
% code by Seonghyun Jang / 19011192 / Aerospace Engineering

function el = elevation(ENU, el_mask)
    % input: ENU, nx3 with ENU position in km / el_mask, masking angle in deg
    % output: el, 1xn elevation angle in deg (masked)
    % ECEF: ECEF is from UTC + LT time stamp, ECEF = R_LT'
    % ENU: ENU from ECEF, East-North-Up Coordinate at Ground Station (g_lat, g_long, g_h)
    
    el = asin(ENU(:,3)./sqrt(ENU(:,1).^2+ENU(:,2).^2+ENU(:,3).^2));

    [m, n] = size(el);
    for i=1:1:m
        if(el(i)<=el_mask*pi/180)
            el(i) = NaN;
        end
    end
    
    el = 180/pi*el';   % row vector form
end