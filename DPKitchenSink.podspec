Pod::Spec.new do |s|

s.name             = 'DPKitchenSink'
s.version          = '1.0.0'
s.license          =  { :type => 'BSD' }
s.homepage         = 'https://github.com/drewpitchford'
s.authors          = { 'Drew Pitchford' => 'dpitchford@me.com' }
s.summary          = 'Things I use a lot in my iOS projects'
s.platform         = :ios
s.source           = { :git => 'DPKitchenSink.framework' }
s.ios.deployment_target   = '9.0'
s.ios.vendored_frameworks = 'DPKitchenSink.framework'
s.dependency 'CocoaLumberjack/Swift'
s.dependency 'PureLayout'
s.dependency 'Reusable', '~> 4.0'
s.dependency 'SwifterSwift'

end
