Foto = imread('Screen2.jpg');
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
        imwrite(Povorotnichek(SegmentPicture2),(strcat(strcat('/home/yus/Images/Firs', i), '.jpg')));
        i = i+1;
    end
    imwrite(Povorotnichek(Line),(strcat(strcat('/home/yus/Images/Firs', i), '.jpg')));
    i = i+1;
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
      
        imwrite(Povorotnichek(SegmentPicture2),(strcat(strcat('/home/yus/Images/Firs', i), '.jpg')));
        i = i+1;
    end
 imwrite(Povorotnichek(Foto),(strcat(strcat('/home/yus/Images/Firs', i), '.jpg')));

