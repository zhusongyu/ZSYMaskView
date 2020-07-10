#
# Be sure to run `pod lib lint ZSYMaskView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZSYMaskView'
  s.version          = '0.0.1'
  s.summary          = '可以自定义的MaskView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '自定义程度极高的遮罩层，可用于App引导带遮罩效果的设计'

  s.homepage         = 'https://github.com/zhusongyu/ZSYMaskView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhusongyu1990@163.com' => 'zhusongyu1990@163.com' }
  s.source           = { :git => 'https://github.com/zhusongyu/ZSYMaskView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZSYMaskView/Classes/**/*'
  
  s.swift_version = '4' 
  # s.resource_bundles = {
  #   'ZSYMaskView' => ['ZSYMaskView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
