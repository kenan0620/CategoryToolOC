#
# Be sure to run `pod lib lint CategoryToolOC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CategoryToolOC'
  s.version          = '0.1.8'
  s.summary          = '项目常用分类库.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  项目常用分类库,包含项目中的和系统中的.
                       DESC

  s.homepage         = 'https://github.com/kenan0620/CategoryToolOC'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kenan0620' => 'coenen@aliyun.com' }
  s.source           = { :git => 'https://github.com/kenan0620/CategoryToolOC.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.jianshu.com/u/aa2d07ae7c2f'

  s.ios.deployment_target = '11.0'

  s.source_files = 'CategoryToolOC/Classes/CategoryToolOC.h'
  
  s.subspec 'UIColor' do |ss|
     ss.ios.deployment_target = '11.0'
     ss.source_files = 'CategoryToolOC/Classes/UIColor{*}.{h,m}'
   end
  
  s.subspec 'UIImage' do |ss|
     ss.ios.deployment_target = '11.0'
     ss.source_files = 'CategoryToolOC/Classes/UIImage{*}.{h,m}'
   end
  
  s.subspec 'UIButton' do |ss|
     ss.ios.deployment_target = '11.0'
     ss.source_files = 'CategoryToolOC/Classes/UIButton{*}.{h,m}'
   end
  
  s.subspec 'WKWebView' do |ss|
     ss.ios.deployment_target = '11.0'
     ss.source_files = 'CategoryToolOC/Classes/WKWebView{*}.{h,m}'
   end
  
  s.subspec 'UITextField' do |ss|
     ss.ios.deployment_target = '11.0'
     ss.source_files = 'CategoryToolOC/Classes/UITextField{*}.{h,m}'
   end
  
  s.subspec 'UIViewController' do |ss|
     ss.ios.deployment_target = '11.0'
     ss.source_files = 'UIViewController'
   end
  
  s.subspec 'NSString' do |ss|
     ss.ios.deployment_target = '11.0'
     ss.source_files = 'NSString'
   end
  
  s.subspec 'Date' do |ss|
     ss.ios.deployment_target = '11.0'
     ss.source_files = 'Date'
   end
  # s.resource_bundles = {
  #   'CategoryToolOC' => ['CategoryToolOC/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
