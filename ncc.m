function nccValue = ncc(watermark1, watermark2)
    % NCC 计算两个水印之间的归一化互相关
    watermark1 = double(watermark1);  % 转换为双精度
    watermark2 = double(watermark2);  % 转换为双精度
    mean1 = mean(watermark1(:));  % 水印1的均值
    mean2 = mean(watermark2(:));  % 水印2的均值
    numerator = sum((watermark1(:) - mean1) .* (watermark2(:) - mean2));  % 计算分子
    denominator = sqrt(sum((watermark1(:) - mean1).^2) * sum((watermark2(:) - mean2).^2));  % 计算分母
    nccValue = numerator / denominator;  % 计算NCC值
end