function extractedWatermark = ExtractWatermark(watermarkedImg, key)
    % 提取嵌入到水印的图像中的水印
    [LL1, ~, ~, ~] = dwt2(watermarkedImg, 'haar');
    [LL2, ~, ~, ~] = dwt2(LL1, 'haar');
    
    % 提取置乱的水印
    dctCoeffs = dct2(LL2);
    scrambledWatermark = dctCoeffs(1:numel(key));  % 提取DCT系数中的水印
    
    % 反置乱并解密水印
    unscrambledWatermark = ArnoldTransform(scrambledWatermark, -5);  % 反置乱
    extractedWatermark = Logistic1(key, numel(unscrambledWatermark));  % 解密
end