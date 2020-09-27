function a = TitleCutter(Omg, Dlina, Shirina)
a = Omg;
if size(Omg, 1) > Dlina
a(1:Dlina, :, :) = [];
end
if size(Omg, 2) > Shirina
a(:, 1:Shirina, :) = [];
a(:, end-Shirina:end, :) = [];
end