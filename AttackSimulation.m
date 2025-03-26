function attackedImg = AttackSimulation(watermarkedImg, attackType)
    % 模拟对水印图像的攻击
    switch attackType
        case 'filtering'
            attackedImg = imgaussfilt(watermarkedImg, 2);  % 高斯滤波攻击
        case 'noise'
            attackedImg = imnoise(watermarkedImg, 'salt & pepper', 0.02);  % 椒盐噪声攻击
        case 'scaling'
            attackedImg = imresize(watermarkedImg, 0.5);  % 缩放攻击
            attackedImg = imresize(attackedImg, size(watermarkedImg));  % 恢复原尺寸
        case 'rotation'
            attackedImg = imrotate(watermarkedImg, 10, 'bicubic', 'crop');  % 旋转攻击
        case 'cropping'
            cropRect = [50 50 size(watermarkedImg, 2)-100 size(watermarkedImg, 1)-100];  % 裁剪区域
            attackedImg = imcrop(watermarkedImg, cropRect);  % 裁剪攻击
            attackedImg = imresize(attackedImg, size(watermarkedImg));  % 恢复原尺寸
        otherwise
            attackedImg = watermarkedImg;  % 默认无攻击
    end
end