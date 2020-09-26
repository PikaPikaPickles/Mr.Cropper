prompt = 'Enter your folder: ';
PathOfScreen = input(prompt, 's');
ScreenFiles= dir(PathOfScreen);
mkdir (strcat(PathOfScreen, '/CuttedResult'));
ScreenFiles(1:2) = [];
for Schet = 2: length(ScreenFiles)
Foto = imread(strcat('/home/yus/RowScreens/',ScreenFiles(Schet).name));
Foto = TitleCutter(Foto, 300, 90);
i = 70;
CutLine2 = 1;
cutLine3 = 1;
while size(Foto,1) - CutLine2 > 30
    CutLine2 = HorizontalCut(Foto);
    Line = Foto(1:CutLine2,:,:);
    Line = rot90(Line);
    while size(Line,1) - cutLine3 > 30 
        i = i+1;
        cutLine3 = HorizontalCut(Line);
        SegmentPicture2 = Line(1:cutLine3,:,:);
        Line = Line(cutLine3:end,:,:);
        Line = TitleCutter(Line,10,0);
        
        if (size(SegmentPicture2, 1) > 400) & (size(SegmentPicture2, 2) > 400)
        imwrite(Povorotnichek(SegmentPicture2),(strcat(strcat(strcat(PathOfScreen, '/CuttedResult/'), i), ScreenFiles(Schet).name)));
        i = i+1;
        end
    end
    if (size(Line, 1) > 400) & (size(Line, 2) > 400)
    imwrite(Povorotnichek(Line),(strcat(strcat(strcat(PathOfScreen, '/CuttedResult/'), i), ScreenFiles(Schet).name)));
    end
    Foto = Foto(CutLine2:end,:,:);
    Foto = TitleCutter(Foto,10,0);
    i = i+1;
end
Foto = rot90(Foto);
 while size(Foto,1) - cutLine3 > 30 
        i = i+1;
        cutLine3 = HorizontalCut(Foto);
        SegmentPicture2 = Foto(1:cutLine3,:,:);
        Foto = Foto(cutLine3:end,:,:);
        Foto = TitleCutter(Foto,10,0);
      if (size(SegmentPicture2, 1) > 400) & (size(SegmentPicture2, 2) > 400)
        imwrite(Povorotnichek(SegmentPicture2),(strcat(strcat(strcat(PathOfScreen, '/CuttedResult/'), i), ScreenFiles(Schet).name)));
        i = i+1;
      end
 end
    if (size(Foto, 1) > 400) & (size(Foto, 2) > 400)
 imwrite(Povorotnichek(Foto),(strcat(strcat(strcat(PathOfScreen, '/CuttedResult/'), i), ScreenFiles(Schet).name)));
    end
end

