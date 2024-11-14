function posArray = Interpolation_fun(t,pos,dt)

%{
syms ts te ps pe vs ve T real;
a = [1, 0, 0, 0
    0, 1, 0, 0
    1, T, T^2, T^3
    0, 1, 2*T, 3*T^2] \ [ps; vs; pe; ve];
a = [simplify(a(1)), simplify(a(2)), simplify(a(3)), simplify(a(4))]'
%}

% t = [1    65   129   193   257   321   385   449   513   577   645]';
% pos = [10, 20, 0, 30, 40]';
% dt = 1;

n = length(t);
v = zeros(n, 1);
v(1) = (pos(2) - pos(1)) / (t(2) - t(1));
v(n) = (pos(n) - pos(n - 1)) / (t(n) - t(n - 1));
for k = 2 : n - 1
    v(k) = 0.5 * ((pos(k) - pos(k - 1)) / (t(k) - t(k - 1)) + (pos(k + 1) - pos(k)) / (t(k + 1) - t(k)));
end

tArray = [];
posArray = [];
velArray = [];
accArray = [];
tArray = [tArray; t(1)];
posArray = [posArray; pos(1)];
velArray = [velArray; v(1)];
for i = 1 : n - 1
    ts = t(i);
    te = t(i + 1);
    ps = pos(i);
    pe = pos(i + 1);
    vs = v(i);
    ve = v(i + 1);
    
    h = pe - ps;
    T = t(i + 1) - t(i);
    a0 = ps;
    a1 = vs;
    a2 = (3.0 * h - (2.0 * vs + ve) * T) / T^2;
    a3 = (-2.0 * h + (vs + ve) * T) / T^3;
    
    tt = (t(i) + dt : dt : t(i + 1))';
    if abs(tt(end) - t(i + 1)) > 1.0e-8
        tt = [tt; t(i + 1)];
    end
    
    tArray = [tArray; tt];
    posArray = [posArray; a0 + (tt - ts) .* (a1 + (tt - ts) .* (a2 + a3 .* (tt - ts)))];
    velArray = [velArray; a1 + (tt - ts) .* (2.0 * a2 + 3.0 * a3 .* (tt - ts))];
    accArray = [accArray; 2.0 * a2 + 6.0 * a3 .* (tt - ts)];
end
accArray = [(velArray(2) - velArray(1)) / dt; accArray];

