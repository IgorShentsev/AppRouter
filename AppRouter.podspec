
Pod::Spec.new do |s|
  s.name         = "AppRouter"
  s.version      = "5.2.0"
  s.summary      = "UIViewController creation, navigation, utility methods for easy routing"

  s.homepage     = "https://github.com/MLSDev/AppRouter"
  s.license      = "MIT"
  s.author       = { "Artem Antihevich" => "sinarionn@gmail.com" }
  s.social_media_url = 'https://twitter.com/sinarionn'

  s.ios.deployment_target = "14.0"
  s.source       = { :git => "https://github.com/MLSDev/AppRouter.git", :tag => s.version.to_s }
  s.requires_arc = true

  s.default_subspec = 'Core'
  s.ios.frameworks = 'UIKit', 'Foundation'

  s.subspec 'Core' do |core|
      core.source_files = 'Sources/Core/*.swift'
      core.ios.deployment_target = "14.0"
  end

  s.subspec 'Route' do |route|
      route.source_files = 'Sources/Route/AppRouter+route.swift'
      route.dependency 'AppRouter/Core'
      route.dependency 'RxCocoa', '~> 6.5'
      route.dependency 'ReusableView', '~> 3.0'
      route.ios.deployment_target = "14.0"

      route.subspec 'Dip' do |dip|
          dip.source_files = 'Sources/Route/*.swift'
          dip.dependency 'Dip', '~> 7.1.1'
          dip.ios.deployment_target = "14.0"
      end
  end

  s.subspec 'RxSwift' do |rxswift|
      rxswift.ios.deployment_target = "14.0"
      rxswift.osx.deployment_target = "11.0"
      rxswift.dependency 'RxCocoa', '~> 6.5'
      rxswift.source_files = 'Sources/RxSwift/*.swift'
  end

end
