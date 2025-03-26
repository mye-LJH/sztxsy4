function berValue = ber(originalWatermark, extractedWatermark)
    % BER 计算两个二进制水印之间的比特错误率
    originalWatermark = double(originalWatermark);
    extractedWatermark = double(extractedWatermark);
    berValue = sum(originalWatermark(:) ~= extractedWatermark(:)) / numel(originalWatermark);  % 计算BER值
end