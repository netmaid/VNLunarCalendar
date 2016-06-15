Pod::Spec.new do |s|
  s.name             = "VNLunarCalendar"
  s.version          = "0.1.0"
  s.summary          = "The Objective-C module for asian lunisolar calendar (Korean calendar)"
  s.description      = <<-DESC
                         The class of VNLunarCalendar class has two functions for calculating
                           lundar date of solar date and solar date of lunar date.
                         Moreover, the NSDate category class which calculate from lunar date to
                           solar date and vice versa has included in this module.
                         The solar date is valid from 1881-01-30 (lunar 1881-01-01) to
                           2051-02-10 (lunar 2050-12-29), so be careful if you need old date.
                       DESC

  s.homepage         = "https://github.com/netmaid/VNLunarCalendar"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = "Chungmin Ahn"
  s.source           = { :git => "https://github.com/netmaid/VNLunarCalendar.git", :tag => "v#{s.version}" }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'VNLunarCalendar/**/*.{h,m,c}'
  s.public_header_files = 'VNLunarCalendar/**/*.h'
end
