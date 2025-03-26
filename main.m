% 主脚本用于嵌入和提取水印
originalImg = imread('originalImage.bmp');  % 读取原始图像
watermark = imread('watermark.jpg');  % 读取水印图像
watermark = imresize(watermark, [64, 64]);  % 调整水印大小为64x64
key = 0.5;  % Logistic 映射的初始值

% 嵌入水印
watermarkedImg = EmbedWatermark(originalImg, watermark, key);

% 对嵌入水印的图像进行攻击
attackedImg = AttackSimulation(watermarkedImg, 'filtering');

% 提取水印
extractedWatermark = ExtractWatermark(attackedImg, key);

% 计算 PSNR
psnrValue = psnr(originalImg, attackedImg);

% 计算 NCC
nccValue = ncc(watermark, extractedWatermark);

% 计算 BER
berValue = ber(watermark, extractedWatermark);

% 显示结果
fprintf('PSNR: %.2f dB\n', psnrValue);
fprintf('NCC: %.4f\n', nccValue);
fprintf('BER: %.4f\n', berValue);

figure;
subplot(2, 2, 1); imshow(originalImg); title('原始图像');
subplot(2, 2, 2); imshow(watermarkedImg); title('嵌入水印的图像');
subplot(2, 2, 3); imshow(attackedImg); title('受到攻击的图像');
subplot(2, 2, 4); imshow(extractedWatermark); title('提取的水印');