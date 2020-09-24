function d = HorizontalCut(ImageOur)
i = 1;
d = size(ImageOur,1);
while i < size(ImageOur, 1)
    k = ImageOur(i,:,:);
    SumMat = ones(size(ImageOur,2), 1)*750;
    j = 1;
    while j <  length(k)
        f = k(1,j,:);
        SumMat (j) = sum(f);
        j  = j +1;
    end
    %SumMat(90)
    if (sum(SumMat(:)) > (740 * size(ImageOur, 2)))
       d = i;
        % d = ImageOur(1:i,:,:);
        break;
    end
   i = i+5;
   
end