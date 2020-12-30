
Pod::Spec.new do |spec|
  spec.name         = 'bench_swift'
  spec.version      = '2.2.7'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/gwh111/bench_swift'
  spec.authors      = { 'apple' => '173695508@qq.com' }
  spec.summary      = 'summary'
  spec.source       = { :git  => 'https://github.com/gwh111/bench_swift.git' }
  spec.frameworks   = 'UIKit'  
  spec.module_name  = 'bench_swift'

  spec.ios.deployment_target  = '7.0'
  spec.swift_version = '5.0'

  spec.source_files       = 'bench_swift/bench/*'
  spec.resources          = 'bench_swift/bench/bench_swift.bundle'

  spec.subspec 'C' do |ss|
    ss.source_files = 'bench_swift/bench/C/**/*'
  end

  spec.subspec 'CC_Kit' do |ss|
    ss.source_files = 'bench_swift/bench/CC_Kit/**/*'
  end

  spec.subspec 'CC_Lib' do |ss|
    ss.source_files = 'bench_swift/bench/CC_Lib/**/*'
  end

  spec.subspec 'CC_Objects' do |ss|
    ss.source_files = 'bench_swift/bench/CC_Objects/**/*'
  end

  spec.subspec 'CC_Foundation' do |ss|
    ss.source_files = 'bench_swift/bench/CC_Foundation/**/*'
  end

  spec.subspec 'CC_CoreFoundation' do |ss|
    ss.source_files = 'bench_swift/bench/CC_CoreFoundation/**/*'
  end

end
