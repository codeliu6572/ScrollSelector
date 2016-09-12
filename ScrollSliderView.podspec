

Pod::Spec.new do |s|

  s.name = 'ScrollSliderView'

  s.homepage     = 'http://blog.csdn.net/codingfire'
  s.license      = 'MIT'
  s.version      = '1.0.1'
  s.summary      = 'A ScrollSliderView menu for iOS'
  s.author             = { 'codeliu6572' => 'codeliu6572@163.com' }
 
  s.ios.deployment_target = '7.0'


  s.source       = { :git => 'https://github.com/codeliu6572/ScrollSelector.git', :tag => '1.0.1' }

  s.source_files  = 'ScrollSliderView/*.{h,m}'
  s.requires_arc = true


end
