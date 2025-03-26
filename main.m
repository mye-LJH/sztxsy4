clear all; % 清除工作区所有变量
clc;       % 清除命令窗口所有的指令

% 读取水印图像并灰度化
watermark = imread('watermark.jpg');
watermark = rgb2gray(watermark);
watermark = imresize(watermark, [64, 64]);  % 调整水印大小为64x64
key = 0.5;  % Logistic 映射的初始值

% 读取载体图像并灰度化
originalImg = imread('originalImage.bmp');
originalImg = rgb2gray(originalImg);

% 嵌入水印
watermarkedImg = EmbedWatermark(originalImg, watermark, key);

% 攻击类型列表
attacks = {'jpeg', 'cutting', 'filtering', 'sharpening', 'noise'};
results = cell(length(attacks), 4);  % 存储结果

for i = 1:length(attacks)
    attackType = attacks{i};
    attackedImg = AttackSimulation(watermarkedImg, attackType);

    % 提取水印
    extractedWatermark = ExtractWatermark(attackedImg, key);

    % 计算 PSNR
    psnrValue = psnr(originalImg, attackedImg);

    % 计算 NCC
    nccValue = ncc(watermark, extractedWatermark);

    % 计算 BER
    berValue = ber(watermark, extractedWatermark);

    % 存储结果
    results{i, 1} = attackType;
    results{i, 2} = psnrValue;
    results{i, 3} = nccValue;
    results{i, 4} = berValue;
    
    % 显示结果
    fprintf('Attack: %s\n', attackType);
    fprintf('PSNR: %.2f dB\n', psnrValue);
    fprintf('NCC: %.4f\n', nccValue);
    fprintf('BER: %.4f\n', berValue);
    
    % 保存和显示图像
    imwrite(attackedImg, sprintf('attacked_%s.bmp', attackType));
    figure;
    subplot(2, 2, 1); imshow(originalImg); title('原始图像');
    subplot(2, 2, 2); imshow(watermarkedImg); title('嵌入水印的图像');
    subplot(2, 2, 3); imshow(attackedImg); title(sprintf('受到攻击的图像 (%s)', attackType));
    subplot(2, 2, 4); imshow(extractedWatermark); title('提取的水印');
end