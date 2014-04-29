Pod::Spec.new do |s|
  s.name         = "LKBadgeView"
  s.version      = "1.0.0"
  s.summary      = "Badge view"
  s.description  = <<-DESC
Badge View
                   DESC
  s.homepage     = "https://github.com/lakesoft/LKBadgeView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Hiroshi Hashiguchi" => "xcatsan@mac.com" }
  s.source       = { :git => "https://github.com/lakesoft/LKBadgeView.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Classes/*'

end
