function watermarkedImg = EmbedWatermark(originalImg, watermark, key)
    % 将水印嵌入到原始图像中
    % 进行2级小波分解
    [LL1, ~, ~, ~] = dwt2(originalImg, 'haar');
    [LL2, ~, ~, ~] = dwt2(LL1, 'haar');
    
    % 加密并置乱水印
    encryptedWatermark = Logistic1(key, numel(watermark));  % Logistic 映射加密
    scrambledWatermark = ArnoldTransform(encryptedWatermark, 5);  % Arnold 变换置乱
    
    % 将水印嵌入到DCT系数中
    dctCoeffs = dct2(LL2);
    dctCoeffs(1:numel(scrambledWatermark)) = scrambledWatermark;  % 修改DCT系数嵌入水印
    watermarkedLL2 = idct2(dctCoeffs);
    
    % 重构图像
    watermarkedLL1 = idwt2(watermarkedLL2, [], [], [], 'haar');
    watermarkedImg = idwt2(watermarkedLL1, [], [], [], 'haar');
end