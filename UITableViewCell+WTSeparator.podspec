Pod::Spec.new do |s|
  s.name         = "UITableViewCell+WTSeparator"
  s.version      = "0.0.1"
  s.summary      = "A custom separator of UITableViewCell category"
  s.homepage     = "https://github.com/WynterW/UITableViewCell-WTSeparator"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Wynter" => "564640283@qq.com" }
  s.platform         = :ios, '7.0'
  s.source       = { :git => "https://github.com/WynterW/UITableViewCell-WTSeparator.git", :tag => "#{s.version}" }
  s.source_files = 'UITableViewCell/UITableViewCell+Separator.{h,m}'
  s.requires_arc = true
end