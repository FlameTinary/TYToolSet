# TYToolSet
工具集合
## TYPhotoPicker
**简介：**用于获取系统相册图片和照相机拍照图片
**用法：**
导入头文件

```
#import "TYPhotoPicker.h"
```
调用方法

```
[[TYPhotoPicker sharePicker] selectPhotoSourceWithViewController:self FinishSelectImageBlcok:^(UIImage *image) {
    //dosomething;
}];
```

## TYDrawingView
**简介：**用于在View上绘制文字，主要用于解决定时器倒计时文字晃动
**用法：**
导入头文件

```
#import "TYDrawingView.h"
```

示例：

```
TYDrawingView * drawView = [TYDrawingView new];
drawView.frame = CGRectMake(100, 200, 200, 44);
drawView.title = @"我是绘制的文字";
[self.view addSubview:drawView];
```

## CALayer+TYLayerColor
**简介：**用于支持xib中设置borderColor

**示例：**
![Snip20180328_1](http://7xtfqf.com1.z0.glb.clouddn.com/Snip20180328_1.png)

