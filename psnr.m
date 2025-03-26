function dPSNR = psnr(ImageA, ImageB)
    % PSNR 计算两个图像之间的峰值信噪比
    if (size(ImageA, 1) ~= size(ImageB, 1)) || (size(ImageA, 2) ~= size(ImageB, 2))
        error('ImageA <> ImageB');  % 图像尺寸不一致错误
        dPSNR = 0;
        return;
    end
    M = size(ImageA, 1);
    N = size(ImageA, 2);
    d = 0;
    for i = 1:M
        for j = 1:N
            d = d + (ImageA(i, j) - ImageB(i, j)).^2;  % 计算误差平方和
        end
    end
    if d == 0
        dPSNR = Inf;  % 避免对零取对数
    else
        dPSNR = -10 * log10(d / (255 * 255 * M * N));  % 计算PSNR值
    end
    return;
end