# Flutter适配思路

42019.03.21 14:41:24字数 555阅读 1096

##### 设计稿

1. 设计按照iPhone6(750*1334)的尺寸，做了一张设计稿。

2. 一套3x图

3. Android和Ios两端适配

   

   ![img](https://upload-images.jianshu.io/upload_images/7769455-53e37b174e2e1647.jpg?imageMogr2/auto-orient/strip|imageView2/2/w/768/format/webp)

   设计稿

问题来了：
一张98*193的图片，我们应该怎样写呢？

场景一：宽度直接写98(Flutter的单位都是dp)

华为荣耀V8测试机
width: 360dp 1080px
height: 740.67dp 2222px
pixel density: 3.0 屏幕密度比

98在设计稿上表示的是px，但是我们在使用Flutter中控件的时候，单位是dp，所以必须要将设计稿上98转换成dp。

```undefined
MediaQueryData mediaQuery = MediaQuery.of(context);
_pixelRatio = mediaQuery.devicePixelRatio;
```

_pixel就是手机的屏幕密度比，在V8上是3.0。

直接写出现的问题：

```
Image.asset(width:98,height:103)
```

那么最终显示在V8手机上的宽高就是98x3=294px和103x3=309px。

这么写我们就是把98和103当做了dp，但是设计师给的是px单位啊，所以肯定是错误的，怎么解决？

这里我们要将设计稿上的px单位，转换成代码中的dp单位。

dp=px/pixel;

98px=98/3=32.67dp

假如我现在写(98/3)dp，那么在V8上也是98px了。

问题又来了，V8的物理宽度是1080，而设计稿的物理宽度是750，也就是说，设计稿(750*1334)上的98px肯定不应该等于V8(1080x2222)上的144px,而应该是
`98x1080/750=141.12px`

那么一个在iPhone6上的98x103的长方形，在V8上的实际尺寸应该是：

```undefined
width:  98x1080/750=141.12
height: 103x2222/1334=171.56
```

这就完了吗？

假设设计稿上有一个正方形98x98,在V8上的实际尺寸应该是：

```undefined
width:  98x1080/750=141.12
height: 98x2222/1334=163.23
```

我尼玛，这是什么鬼？

问题就在于，手机之间的density可能是一样的，但是实际的屋里尺寸却不是成比例的。

在这里的体现就是iPhone6(750*1335)和V8(1080 *2222)的物理宽高并不是同比例的。

正方形的解决方法:

对于正方形控件，在计算的时候以宽度为标准，在视觉上可以实现效果,在实际的尺寸上，高度可能偏低。