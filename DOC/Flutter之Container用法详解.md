# Flutter之Container用法详解

12019.02.11 10:18:08字数 1685阅读 2253

最近开始接触Flutter，网上对Flutter评价很高，加上是谷歌这种大公司研发推广的，决定先入坑。

废话不多说，直奔主题！学习框架，首先要将里面常用控件熟练使用，后面可以逐步深入、究其原理。

# 前言

相关文章：[Flutter学习目录
](https://www.jianshu.com/p/104f12c3a178)

github地址：[Flutter学习](https://github.com/yscMichael/Flutter)

文章结构

- Color Property
- Child Property
- Alignment Property
- Constraints Property
- Margin Property
- Padding Property
- Decoration Property
- ForegroundDecoration Property
- Transform Property

# 介绍

Container类似于iOS中的`UIView`，具有`绘制`、`定位`、`调整大小`功能。通常用来装载其它子控件，假如Container没有子控件，它将自动填充整个屏幕；反之，会根据子控件大小，调整自身大小，从而达到自适应效果。

###### 注意:

使用Container时，通常要有一个父控件，一般情况下不单独使用Container。常用的父控件有Center widget、Padding Widget、Column Widget、Row Widget、Scaffold Widget。

# 一、Color Property

这个属性用于设置Container的背景颜色，类似于iOS中的UIView的`backgroundColor`。使用如下：

- Colors Class

```java
//Container颜色属性之Colors
class Color_Property_Colors extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          //color: Colors.green,//正常颜色
          //color:Colors.green[200],//带有阴影(相当于是透明度)
          color: Colors.green.shade200,//同上
        ),
    );
  }
}
```

呈现效果如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-b7889b9e860b0f76.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图1 Container之Colors属性

- Color Class

```java
//Container颜色属性之Color
class Color_Property_Color extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //color: Color(0xFFFFFFFF),//一定是8位,否则报错
        //color: Color.fromARGB(255, 66, 165, 245),
        color: Color.fromRGBO(66, 165, 245, 1.0),//作用同上
      ),
    );
  }
}
```

呈现效果如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-d3e495ac0f0687cc.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图2 Container之Color属性

###### 注意:

1、使用8位16进制而不是6位
2、.fromARGB含义
A = Alpha or opacity, R = Red, G = Green, B = Blue
3、.fromRGBO含义
R = Red, G = Green, B = Blue, O = Opacity

# 二、Child Property

如前言所述，`如果Container里面没有子控件，它就会填充整个屏幕；如果有子控件，Container就会自动适应子控件大小`。
另外，`Container只能容纳一个子控件，如果想容纳更多的子控件,可以将子控件设置为Row、Column、Stack(这三个子控件都有一个children属性)`

- 添加子控件

```java
//Container属性之Child
class Child_Property extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromRGBO(66, 165, 245, 1.0),
        child: Text("Flutter Cheatsheet"),
      ),
    );
  }
}
```

呈现效果如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-1c4224ba3457066f.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图3 添加子控件

# 三、Alignment Property

Alignment属性主要是针对于Container内部的子控件布局。
主要有以下几个属性：Alignment、FractionalOffset、AlignmentDirectional

- Alignment
  代码如下:

```java
//Container属性之Alignment
class Alignment_Property extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        child: Text("Flutter Cheatsheet",
             style: TextStyle(
               fontSize: 30.0
             ),
        ),
        //不加这句话，Container会自适应child大小;加上以后会充满屏幕
        //alignment: Alignment(0.0, 0.0),
        alignment: Alignment.center,//等价于上面
      ),
    );
  }
}
```

效果如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-9620bc40910264df.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图4 Container属性之Alignment

Alignment坐标系图如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-2ed655dcf8487dba.jpeg?imageMogr2/auto-orient/strip|imageView2/2/w/654/format/webp)

图5 Alignment坐标系

**常用等价属性:**
Alignment.bottomCenter 对应 Alignment(0.0, 1.0)
Alignment.bottomLeft 对应 Alignment(-1.0, 1.0)
Alignment.bottomRight 对应 Alignment(1.0, 1.0)
Alignment.center 对应 Alignment(0.0, 0.0)
Alignment.centerLeft 对应 Alignment(-1.0, 0.0)
Alignment.centerRight 对应 Alignment(1.0, 0.0)
Alignment.topCenter 对应 Alignment(0.0, -1.0)
Alignment.topLeft 对应 Alignment(-1.0, -1.0)
Alignment.topRight 对应 Alignment(1.0, -1.0)

- FractionalOffset
  这个属性跟上面讲的Alignment非常相似，唯一的不同就是坐标系：
  Alignment坐标系是X:-1.0--1.0;Y:-1.0--1.0，
  FractionalOffset坐标系是X:0.0--1.0，Y:0.0--1.0。

FractionalOffset坐标系图如下:



![img](https://upload-images.jianshu.io/upload_images/7911324-a6edaa23436152c2.jpeg?imageMogr2/auto-orient/strip|imageView2/2/w/654/format/webp)

图6 FractionalOffset坐标系

代码如下:

```java
//Container属性之FractionalOffset
class Alignment_FractionalOffset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        child: Text("Flutter Cheatsheet",
          style: TextStyle(
              fontSize: 30.0
          ),
        ),
        //不加这句话，Container会自适应child大小;加上以后会充满屏幕
        //alignment: FractionalOffset(0.5, 0.5),
        alignment: FractionalOffset.center,//等价于上面
      ),
    );
  }
}
```

**常用等价属性如下**
FractionalOffset.bottomCenter 对应 FractionalOffset(0.5, 1.0)
FractionalOffset.bottomLeft 对应 FractionalOffset(0.0, 1.0)
FractionalOffset.bottomRight 对应 FractionalOffset(1.0, 1.0)
FractionalOffset.center 对应 FractionalOffset(0.5, 0.5)
FractionalOffset.centerLeft 对应 FractionalOffset(0.0, 0.5)
FractionalOffset.centerRight 对应 FractionalOffset(1.0, 0.5)
FractionalOffset.topCenter 对应 FractionalOffset(0.5, 0.0)
FractionalOffset.topLeft 对应 FractionalOffset(0.0, 0.0)
FractionalOffset.topRight 对应 FractionalOffset(1.0, 0.0)

- AlignmentDirectional
  说到这个属性，就要提到一个小插曲:
  网上说AlignmentDirectional有`2个坐标系`，是因为`TextDirection.ltr和TextDirection.rtl`，但是经过本人的亲身实验，这种观点是不对的，不知道是不是由于官方官方框架更新的原。
  最终结论：这个属性跟Alignment用法是完全一样(既然完全一样，何必多此一举呢?)。

坐标系图如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-e5eca4c27b6af9cb.jpeg?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)

图7 AlignmentDirectional坐标系

代码如下:

```java
//Container属性之AlignmentDirectional
class Alignment_AlignmentDirectional extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        child: Text("Flutter",
          style: TextStyle(
              fontSize: 15.0
          ),
          //textDirection: TextDirection.ltr,//正常,从左向右(不影响alignment)
          textDirection: TextDirection.ltr,//从右向左(不影响alignment)
        ),
        //不加这句话，Container会自适应child大小;加上以后会充满屏幕
        alignment:AlignmentDirectional(-1.0, 1.0),
        //alignment: AlignmentDirectional.bottomStart,//等价于上面
      ),
    );
  }
}
```

**常用等价属性:**
AlignmentDirectional.bottomCenter 对应 AlignmentDirectional(0.0, 1.0)
AlignmentDirectional.bottomEnd 对应 AlignmentDirectional(1.0, 1.0)
AlignmentDirectional.bottomStart 对应 AlignmentDirectional(-1.0, 1.0)
AlignmentDirectional.center 对应 AlignmentDirectional(0.0, 0.0)
AlignmentDirectional.centerEnd 对应 AlignmentDirectional(1.0, 0.0)
AlignmentDirectional.centerStart 对应 AlignmentDirectional(-1.0, 0.0)
AlignmentDirectional.topCenter 对应 AlignmentDirectional(0.0, -1.0)
AlignmentDirectional.topEnd 对应 AlignmentDirectional(1.0, -1.0)
AlignmentDirectional.topStart 对应 AlignmentDirectional(-1.0, -1.0)

# 四、Constraints Property

布局属性，主要讲的是怎么确定控件的大小；其中经常使用的就是BoxConstraint。BoxConstraint包含minWidth、maxWidth、minHeight、maxHeight，详细介绍如下:

- Container无子控件(场景1)
  代码如下:

```java
//Container属性之Constraints Property
class Constraints_Property extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          color: Colors.green,
          constraints: BoxConstraints(
            maxHeight: 300,
            maxWidth: 200,
            minWidth: 150,
            minHeight: 150,
          ),
        ),
      ),
    );
  }
}
```

呈现效果如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-d93966d19c655112.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图8 Container之Constraints无子控件

前面说过如果Container没有子控件，Container将填充整个屏幕，但是这里设置maxHeight、maxWidth。

- Container有子控件(场景2)
  代码如下:

```java
//Container属性之Constraints(有子控件)
class Constraints_Property_HasChild extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          color: Colors.green,
          child: Text("Flutter"),
          constraints: BoxConstraints(
            maxHeight: 300,
            maxWidth: 200,
            minWidth: 150,
            minHeight: 150,
          ),
        ),
      ),
    );
  }
}
```

呈现效果如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-3dee72a18528e187.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图9 Container之Constraints有子控件

这里虽然有一个子控件，Container会调整自身大小来适应内部子控件，但是由于设置了min-width和min-height。所以Container不会完全和子控件一样大，除非子控件尺寸大于min-width和min-height。

尝试更改子控件大小，代码如下:

```java
//Container属性之Constraints(有子控件)
class Constraints_Property_HasChild extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          color: Colors.green,
          //child: Text("Flutter"),
          child: Text("Flutter Cheatsheet Flutter Cheatsheet"),
          constraints: BoxConstraints(
            maxHeight: 300,
            maxWidth: 200,
            minWidth: 150,
            minHeight: 150,
          ),
        ),
      ),
    );
  }
}
```

呈现效果图如下：





![img](https://upload-images.jianshu.io/upload_images/7911324-b9b3dc066156563f.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图10 Container之Constraints有子控件



从上面这张图可以看出Container不能超出max-width和max-height。

- Container有子控件(场景3)
  当Container有子控件，我们想让Container不去适应子控件，而是充满整个屏幕或父控件，怎么办？
  答案就是使用BoxConstraints.expand()。
  代码如下：

```java
//Container属性之Constraints(有子控件、充满整个屏幕)
class Constraints_Property_HasChild_AllScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          color: Colors.green,
          //child: Text("Flutter"),
          child: Text("Flutter"),
          constraints: BoxConstraints.expand(),
        ),
      ),
    );
  }
} 
```

呈现效果如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-e1127e76c4a7ba15.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图11 Container之Constraints有子控件

此时发现Container是充满整个屏幕的，我们也可以限制充满屏幕大小，比如说1/2宽、1/3高等。

# 五、Margin Property

跟前端的css类似，这个Margin指的是相邻控件之间的距离，主要是用EdgeInsets。

- EdgeInsets.all()
- EdgeInsets.symmetric()
- EdgeInsets.fromLTRB()
- EdgeInsets.only()

详细如下:

- EdgeInsets.all()
  代码如下:

```java
//EdgeInsets.all()
class Margin_Property_EdgeInsets_all extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          color: Colors.green,
          margin: EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
```

呈现效果如下：





![img](https://upload-images.jianshu.io/upload_images/7911324-a01f9fd6a5acdf51.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图12 Margin之EdgeInsets.all

- EdgeInsets.symmetric()
  这个主要用于添加垂直和水平方向上的约束。
  代码如下:

```java
//EdgeInsets.symmetric()
class Margin_Property_EdgeInsets_symmetric extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          color: Colors.green,
          margin: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
        ),
      ),
    );
  }
}
```

呈现效果如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-f58311f6749ea04a.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图13 Margin之EdgeInsets. symmetric

- EdgeInsets.fromLTRB()
  这个主要设置left, top, right,bottom边距。
  代码如下:

```java
//EdgeInsets.fromLTRB()
class Margin_Property_EdgeInsets_fromLTRB extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          color: Colors.green,
          margin: EdgeInsets.fromLTRB(20.0, 30.0, 40.0, 50.0)
        ),
      ),
    );
  }
}
```

呈现效果:





![img](https://upload-images.jianshu.io/upload_images/7911324-5be4402b68899f3a.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图14 Margin之EdgeInsets. fromLTRB

- EdgeInsets.only()
  用于设置哪些是非零的，不设置默认是零。
  代码如下:

```java
//EdgeInsets.only()
class Margin_Property_EdgeInsets_only extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
            color: Colors.green,
            margin: EdgeInsets.only(
              left: 20.0,
              bottom: 40.0,
              top: 50.0,
            )
        ),
      ),
    );
  }
}
```

呈现效果如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-41034ea81dcf7124.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图15 Margin之EdgeInsets.only

# 六、Padding Property

这个用于设置主控件内部子控件之间的间距。和Margin一样，利用到EdgeInsets。
代码如下:

```java
//EdgeInsets.all
class Padding_Property_EdgeInsets_all extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 66, 165, 245),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          margin: EdgeInsets.only(
            left: 20.0,
            bottom: 40.0,
            top: 50.0,
          ),
          padding: EdgeInsets.all(10.0),//设置内部Text控件边距
          color: Colors.green,
          child: Text("Flutter Cheatsheet"),
          //不设置这个Container和子控件一样大小、这样margin设置也就没有意义了
          constraints: BoxConstraints.expand(),
        ),
      ),
    );
  }
}
```

呈现效果如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-e7932e6f5302e816.png?imageMogr2/auto-orient/strip|imageView2/2/w/566/format/webp)

图16 Padding之EdgeInsets.all

# 七、Decoration Property

- BoxDecoration Class
- FlutterLogoDecoration Class
- ShapeDecoration Class
- UnderlineTabIndicator Class
  由于涉及篇幅较长，后续会重新文章详细讲解，敬请关注。

# 八、ForegroundDecoration Property

- BoxDecoration Class
- FlutterLogoDecoration Class
- ShapeDecoration Class
- UnderlineTabIndicator Class
  由于涉及篇幅较长，后续会重新文章详细讲解，敬请关注

# 九、Transform Property

在Container属性中添加transform属性，并使用Matrix类设置transform的值，即可达到各种变换效果，代码如下：

```java
//Transform Property
class Transform_Property extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 66, 165, 245),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        padding: EdgeInsets.all(40.0),
        color: Colors.green,
        child: Text("Flutter Cheatsheet"),  
        transform: Matrix4.rotationZ(0.5),
      ),
    );
  }
}
```

效果图如下:





![img](https://upload-images.jianshu.io/upload_images/7911324-c24a395fbba96332.png?imageMogr2/auto-orient/strip|imageView2/2/w/572/format/webp)

图17 Transform Property

# 参考文章:

[Flutter — Container Cheat Sheet](https://medium.com/jlouage/container-de5b0d3ad184)