function A = ArnoldTransform(image, iter)
    % Arnold 变换用于图像置乱
    [M, N] = size(image);  % 获取图像尺寸
    A = image;  % 初始化置乱图像
    for i = 1:iter
        temp = A;
        for x = 1:M
            for y = 1:N
                newX = mod((x + y), M) + 1;  % 计算置乱后的新坐标
                newY = mod((x + 2*y), N) + 1;
                A(newX, newY) = temp(x, y);  % 置乱像素值
            end
        end
    end
end