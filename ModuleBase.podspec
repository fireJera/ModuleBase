#
# Be sure to run `pod lib lint ModuleBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ModuleBase'
  s.version          = '0.1.1'
  s.summary          = 'ModuleBase'
  
  s.description      = "a test lib for MoudleBase to support carthage、cocoapods and spm"

  s.homepage         = 'https://github.com/fireJera/ModuleBase'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fireJera' => 'r913218338@163.com' }
  s.source           = { :git => 'https://github.com/fireJera/ModuleBase.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_version = ['5.0', '5.1', '5.2']
  s.source_files = 'ModuleBase/Classes/**/*'

end
