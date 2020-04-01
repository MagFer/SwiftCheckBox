#
# Be sure to run `pod lib lint SwiftCheckBox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftCheckBox'
  s.version          = '0.1.0'
  s.summary          = 'Check box buttons with images'
  s.swift_version    = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Import SwiftCheckBox and add the CheckBoxButton both from the Storyboard or programmatically
                       DESC

  s.homepage         = 'https://github.com/MagFer/SwiftCheckBox'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ian Magarzo' => 'ian.magfer@gmail.com' }
  s.source           = { :git => 'https://github.com/MagFer/SwiftCheckBox.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftCheckBox/Classes/**/*'
  
   s.resource_bundles = {
     'SwiftCheckBoxImgs' => ['SwiftCheckBox/Assets/**/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit' #, 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
