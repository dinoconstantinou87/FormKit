Pod::Spec.new do |s|
  s.name             = "FormKit"
  s.version          = "0.1.0"
  s.summary          = "Easily build UITableView based forms. Written in Swift 2."

  s.homepage         = "https://github.com/dconstantinou/FormKit"
  s.license          = 'MIT'
  s.author           = { "Dino Constantinou" => "dconstantinou360@gmail.com" }
  s.source           = { :git => "https://github.com/dconstantinou/FormKit.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.2'
  s.requires_arc = true

  s.source_files = 'Pod/Source/**/*'

  s.dependency 'PureLayout', '~> 3.0.1'

end
