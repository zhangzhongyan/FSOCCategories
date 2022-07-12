# FSOCCategories


[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/FSOCCategories.svg)](https://img.shields.io/cocoapods/v/FSOCCategories.svg)
[![Platform](https://img.shields.io/cocoapods/p/FSOCCategories.svg?style=flat)](http://cocoadocs.org/docsets/FSOCCategories)

OjectIve-c分类，功能拓展库

## 如何安装
- [下载Zip包](https://github.com/zhangzhongyan/FSOCCategories/archive/master.zip) 将FSOCCategories文件夹内源码copy到项目集成
- 通过Pod进行安装：

```ruby
pod 'FSOCCategories'
```

### 自定义安装
```ruby
pod 'FSOCCategories/UIButton+FSHitEdgeInsets'
pod 'FSOCCategories/UIButton+FSDocumentPickerViewController'
pod 'FSOCCategories/UIButton+FSDocumentInteractionController'
```


## 说明

* `UIButton+FSHitEdgeInsets`
  - /// 传入**负值**可以扩大点击区域
  - `@property (nonatomic, assign) UIEdgeInsets hitEdgeInsets;:` 

* `UIViewController+FSDocumentPickerViewController`
  - /// 系统文件选择控制器
  - @property (nonatomic, strong, readonly) UIDocumentPickerViewController *documentPickerVC;
  - /** 选择文件回调 */
  - @property (nonatomic, strong, nullable) FSDocumentPickerDidSelectedBlock documentPickerDidSelectedBlock;
  - /// 取消回调
  - @property (nonatomic, strong, nullable) FSDocumentPickerDidCancelBlock documentPickerDidCancelBlock;

* `UIViewController+FSDocumentInteractionController`
  - /// 弹出系统文件交互弹唱（分享、保存、应用间文件通讯）
  - (void)presentDocumentInteractionControllerWithURL:(NSURL *)url;