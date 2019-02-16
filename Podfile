use_frameworks!

target 'SmartBoxTestTask' do
    pod 'JGProgressHUD'
    pod 'SDWebImage'
    pod 'Moya'
    pod 'Moya-ObjectMapper'
    pod 'Moya/RxSwift'
    pod 'RxSwift'
    pod 'Moya-ObjectMapper/RxSwift'
    pod 'R.swift'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.2'
        end
    end
end
