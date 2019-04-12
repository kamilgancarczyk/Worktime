# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'Worktime' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Worktime

pod 'Firebase'
pod 'Firebase/Auth'
pod 'Firebase/Database'
pod 'SVProgressHUD'
pod 'ChameleonFramework'


  target 'WorktimeTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Firebase'
    pod 'Firebase/Auth'
    pod 'Firebase/Database'
    pod 'SVProgressHUD'
    pod 'ChameleonFramework'
    inherit! :complete
  end

  target 'WorktimeUITests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Firebase'
    pod 'Firebase/Auth'
    pod 'Firebase/Database'
    pod 'SVProgressHUD'
    pod 'ChameleonFramework'
    inherit! :complete
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
    end
  end
end
