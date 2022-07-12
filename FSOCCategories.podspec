#
# Be sure to run `pod lib lint FSOCCategories.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FSOCCategories'
  s.version          = '1.0.3'
  s.summary          = 'Object-c分类扩展组件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
用于基础的搭建，依赖性比较弱但是可用性较高，更久功能机型分类的拓展包装。
                       DESC

  s.homepage         = 'https://github.com/zhangzhongyan/FSOCCategories'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '张忠燕' => '749994100@qq.com' }
  s.source           = { :git => 'https://github.com/zhangzhongyan/FSOCCategories.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  
  s.default_subspec = 'UIButton+FSHitEdgeInsets'
  
  # UIButton+GTHitEdgeInsets仓库
  s.subspec 'UIButton+FSHitEdgeInsets' do |ss|
    ss.source_files = 'FSOCCategories/Classes/UIButton+FSHitEdgeInsets/*{h,m}'
  end
  
  # UIViewController+FSDocumentPickerViewController仓库
  s.subspec 'UIViewController+FSDocumentPickerViewController' do |ss|
    ss.source_files = 'FSOCCategories/Classes/UIViewController+FSDocumentPickerViewController/*{h,m}'
  end
  
  # UIViewController+FSDocumentInteractionController仓库
  s.subspec 'UIViewController+FSDocumentInteractionController' do |ss|
    ss.source_files = 'FSOCCategories/Classes/UIViewController+FSDocumentInteractionController/*{h,m}'
  end
  
  # UIViewController+FGQuickLookPreview仓库
  s.subspec 'UIViewController+FSQuickLookPreview' do |ss|
    ss.source_files = 'FSOCCategories/Classes/UIViewController+FSQuickLookPreview/*{h,m}'
  end
  
  
end
