package homestay.utils;

import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.util.Random;


/**
 * 图形验证码
 */
public class VerifyUtil {

    // 默认字符数量
    private final Integer SIZE;
    // 默认干扰线数量
    private final int LINES;
    // 默认宽度
    private final int WIDTH;
    // 默认高度
    private final int HEIGHT;
    // 默认字体大小
    private final int FONT_SIZE;
    // 默认字体倾斜
    private final boolean TILT;

    private final Color BACKGROUND_COLOR;


    /**
     * 初始化基础参数
     *
     * @param builder
     */
    private VerifyUtil(Builder builder) {
        SIZE = builder.size;
        LINES = builder.lines;
        WIDTH = builder.width;
        HEIGHT = builder.height;
        FONT_SIZE = builder.fontSize;
        TILT = builder.tilt;
        BACKGROUND_COLOR = builder.backgroundColor;
    }

    /**
     * 生成随机验证码及图片
     * @return
     * [0]: 验证码
     * [1]: 图片
     */
    public Object[] createImage(String verifyCode) {
        StringBuffer sb = new StringBuffer();
        // 创建空白图片
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        // 获取图片画笔
        Graphics2D graphic = image.createGraphics();
        // 设置抗锯齿
        graphic.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        // 设置画笔颜色
        graphic.setColor(BACKGROUND_COLOR);
        // 绘制矩形背景
        graphic.fillRect(0, 0, WIDTH, HEIGHT);
        // 画随机字符
        Random ran = new Random();
        //graphic.setBackground(Color.WHITE);
        // 计算每个字符占的宽度，这里预留一个字符的位置用于左右边距
        int codeWidth = WIDTH / (SIZE + 1);
        // 字符所处的y轴的坐标
        int y = HEIGHT * 3 / 4;
        for (int i = 0; i < verifyCode.length(); i++) {
            // 设置随机颜色
            graphic.setColor(getRandomColor());
            // 初始化字体
            Font font = new Font(null, Font.BOLD + Font.ITALIC, FONT_SIZE);

            if (TILT) {
                // 随机一个倾斜的角度 30到-30度之间
                int theta = ran.nextInt(30);
                // 随机一个倾斜方向 左或者右
                theta = (ran.nextBoolean() == true) ? theta : -theta;
                AffineTransform affineTransform = new AffineTransform();
                affineTransform.rotate(Math.toRadians(theta), 0, 0);
                font = font.deriveFont(affineTransform);
            }
            // 设置字体大小
            graphic.setFont(font);

            // 计算当前字符绘制的X轴坐标
            int x = (i * codeWidth) + (codeWidth / 2);

            // 取随机字符索引
            String code = verifyCode.substring(i, i+1);
            // 画字符
            graphic.drawString(code, x, y);

            // 记录字符
            sb.append(code);
        }
        // 画干扰线
        for (int i = 0; i < LINES; i++) {
            // 设置随机颜色
            graphic.setColor(getRandomColor());
            // 随机画线
            graphic.drawLine(ran.nextInt(WIDTH), ran.nextInt(HEIGHT), ran.nextInt(WIDTH), ran.nextInt(HEIGHT));
        }
        // 返回验证码和图片
        return new Object[]{sb.toString(), image};
    }

    /**
     * 随机取色
     */
    private Color getRandomColor() {
        Random ran = new Random();
        Color color = new Color(ran.nextInt(256), ran.nextInt(256), ran.nextInt(256));
        return color;
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    /**
     * 构造器对象
     */
    public static class Builder {
        private int size = 4;  // 默认字符数量
        private int lines = 8;  // 默认干扰线数量
        private int width = 80;  // 默认宽度
        private int height = 35;  // 默认高度
        private int fontSize = 25;  // 默认字体大小
        private boolean tilt = true;  // 默认字体倾斜
        //背景颜色
        private Color backgroundColor = Color.LIGHT_GRAY;

        public Builder setSize(int size) {
            this.size = size;
            return this;
        }

        public Builder setLines(int lines) {
            this.lines = lines;
            return this;
        }

        public Builder setWidth(int width) {
            this.width = width;
            return this;
        }

        public Builder setHeight(int height) {
            this.height = height;
            return this;
        }

        public Builder setFontSize(int fontSize) {
            this.fontSize = fontSize;
            return this;
        }

        public Builder setTilt(boolean tilt) {
            this.tilt = tilt;
            return this;
        }

        public Builder setBackgroundColor(Color backgroundColor) {
            this.backgroundColor = backgroundColor;
            return this;
        }

        public VerifyUtil build() {
            return new VerifyUtil(this);
        }
    }
}
