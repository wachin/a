---
title: Java Math
date: 2019-09-08
private:
---
# number
## 整型
对于整型类型，Java只定义了带符号的整型，因此，最高位的bit表示符号位（0表示正数，1表示负数）。各种整型能表示的最大范围如下：

    byte：-128 ~ 127
    short: -32768 ~ 32767
    int: -2147483648 ~ 2147483647
    long: -9223372036854775808 ~ 9223372036854775807

    int i = 2147483647;
    int i2 = -2147483648;
    int i3 = 2_000_000_000; // 加下划线更容易识别
    int i4 = 0xff0000; // 十六进制表示的16711680
    int i5 = 0b1000000000; // 二进制表示的512
    long l = 9000000000000000000L; // long型的结尾需要加L

## float
    float f1 = 3.14f;
    float f2 = 3.14e38f; // 科学计数法表示的3.14x10^38
    double d = 1.79e308;
    double d2 = -1.79e308;
    double d3 = 4.9e-324; // 科学计数法表示的4.9x10^-324

## floor/ceil

    int x = 24/ 5;  // 5 四舍五入
    (int) (d + 0.5); // 5 四舍五入
    (int) d ; //floor

## div 0
整数运算在除数为0时会报错，而浮点数运算在除数为0时，不会报错，但会返回几个特殊值：

    double d1 = 0.0 / 0; // NaN
    double d2 = 1.0 / 0; // Infinity
    double d3 = -1.0 / 0; // -Infinity

# BigInteger
import java.math.BigInteger; 

    var bi = new BigInteger(1, arg.getBytes(/*YOUR_CHARSET?*/))
    var bi = new BigInteger(arg.getBytes(/*YOUR_CHARSET?*/))
    public String toHex(String arg) {
        return String.format("%040x", new BigInteger(1, arg.getBytes()));
        return String.format("%040x", new BigInteger(arg.getBytes()));
    }

# bits
## bit move
如果对一个负数进行右移，最高位的1不动，结果仍然是一个负数：

    int c = n >> 28; // 10000000 0000000 0000000 00000001 <= -2
    int d = n >> 29; // 10000000 0000000 0000000 00000000 <= -1

还有一种不带符号的右移运算，使用>>>，它的特点是符号位跟着动，因此，对一个负数进行>>>右移，它会变成正数，原因是最高位的1变成了0：

    int n = -536870912;
    int a = n >>> 1;  // 01110000 0000000 0000000 00000000 <= 1879048192

对byte和short类型进行移位时，会首先转换为int(4bytes)再进行位移。

## bit operator
    n = 0 & 0; // 0
    n = 0 | 0; // 0
    n = ~0; // 1
    n = 0 ^ 0; // 0
    n = 0 ^ 1; // 1

# Math func
Math.sqrt()

# 语法
## 运算优先级
在Java的计算表达式中，运算优先级从高到低依次是：

    ()
    ! ~ ++ --
    * / %
    + -
    << >> >>>
    &
    |
    += -= *= /=

## 类型自动提升与强制转型
在运算过程中，如果参与运算的两个数类型不一致，那么计算结果为较大类型的整型。例如，short和int计算，结果总是int，原因是short首先自动被转型为int：

        short s = 1234;
        int i = 123456;
        int x = s + i; // s自动转型为int
        short y = s + i; // 编译错误!

也可以将结果强制转型，

    int i = 12345;
    short s = (short) i; // 12345