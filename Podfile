# Uncomment this line to define a global platform for your project
platform :ios, '10.0'

target 'ClassesMagicFun' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ClassesMagicFun

  target 'ClassesMagicFunTests' do
    inherit! :search_paths
    use_frameworks!
    
    # Pods for testing
	pod 'Quick'
	pod 'Nimble'
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4'
        end

   end
end
