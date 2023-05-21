% Astrodynamics Project#2 - PQW2ECI Coordinate Transform Matrix
% code by Seonghyun Jang / 19011192 / Aerospace Engineering

function PQW2ECIMAT = PQW2ECI(arg_prg, inc_angle, RAAN)
    % input: arg_prg, inc_angle, RAAN in degree
    % output: PQW2ECIMAT, Coordinate Transform Matrix
    % R indicates Rotation Transform from Original co. to Rotated co.(Axis Transform)
    % R indicates Coordinate Transform from Rotated co. to Original co. by the above definition
    RAAN = RAAN*pi/180;
    arg_prg = arg_prg*pi/180;
    inc_angle = inc_angle*pi/180;

    R_RAAN = [cos(RAAN) -sin(RAAN)  0.0; ...
              sin(RAAN)  cos(RAAN)  0.0; ...
              0.0          0.0      1.0];

    R_PGEE = [cos(arg_prg) -sin(arg_prg) 0.0; ...
              sin(arg_prg)  cos(arg_prg) 0.0; ...
              0.0           0.0          1.0];

    R_INCL = [1.0         0.0            0.0; ...
              0.0 cos(inc_angle) -sin(inc_angle); ...
              0.0 sin(inc_angle)  cos(inc_angle)];

    PQW2ECIMAT = R_RAAN*R_INCL*R_PGEE;      % Transform Order
end