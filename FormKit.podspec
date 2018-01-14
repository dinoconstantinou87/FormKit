Pod::Spec.new do |s|
  s.name             = "FormKit"
  s.version          = "0.2"
  s.summary          = "Easily build UITableView based forms. Written in Swift 4."

  s.homepage         = "https://github.com/dconstantinou/FormKit"
  s.license          = 'MIT'
  s.author           = { "Dino Constantinou" => "dconstantinou360@gmail.com" }
  s.source           = { :git => "https://github.com/dconstantinou/FormKit.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Source/**/*'
end
