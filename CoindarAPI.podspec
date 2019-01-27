Pod::Spec.new do |s|
  s.name = 'CoindarAPI'
  s.version = '1.1.3'
  s.license = { :type => 'MIT', :file => "LICENSE" }
  s.summary = 'A wrapper around Coindar API'
  s.homepage = 'https://github.com/alaphao/CoindarAPI'
  s.author = { 'Aleph Retamal' => 'retamal.ph@gmail.com' }
  s.source = { :git => 'https://github.com/alaphao/CoindarAPI.git', :tag => s.version }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/*.swift'

  s.swift_version = '4.2'

  s.dependency "Moya", "~> 12.0.1"
end
