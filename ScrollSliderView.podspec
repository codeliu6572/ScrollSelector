

Pod::Spec.new do |s|

  s.name = 'ScrollSliderView'

  s.homepage     = "http://blog.csdn.net/codingfire/article/details/52470802"
  s.license      = "MIT"
  s.version      = "0.0.1"
  s.summary      = "A ScrollSliderView menu for iOS"
  s.author             = { "codeliu6572" => "codeliu6572@163.com" }
 
  s.platform     = :ios, "7.0"


  s.source       = { :git => "https://github.com/codeliu6572/ScrollSelector.git", :tag => "0.0.1" }

  s.source_files  = "ScrollSliderView/*.{h,m}"
 
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  s.requires_arc = true


end
