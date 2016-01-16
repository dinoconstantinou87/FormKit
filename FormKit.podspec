Pod::Spec.new do |s|
  s.name             = "FormKit"
  s.version          = "0.1.0"
  s.summary          = "A short description of FormKit."

  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/<GITHUB_USERNAME>/FormKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Dino Constantinou" => "dconstantinou360@gmail.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/FormKit.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.subspec 'Cells' do |ss|
    ss.source_files = 'Pod/Source/Cells/**/*'
  end

  s.subspec 'Controllers' do |ss|
    ss.source_files = 'Pod/Source/Controllers/**/*'
  end

  s.subspec 'Models' do |ss|
    ss.source_files = 'Pod/Source/Models/**/*'
  end

  s.subspec 'Protocols' do |ss|
    ss.source_files = 'Pod/Source/Protocols/**/*'
  end

  s.resource_bundles = {
    'FormKit' => ['Pod/Assets/*.png']
  }

  s.dependency 'PureLayout', '~> 3.0.1'
end
