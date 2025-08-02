
Pod::Spec.new do |spec|

  spec.name         = "TFYEnhancedRuntimeChainKit"

  spec.version      = "1.0.6"

  spec.summary      = "类型安全、跨平台的Swift链式编程系统，支持iOS/macOS。"

  spec.description  = <<-DESC
    TFYEnhancedRuntimeChainKit 是一个革命性的Swift链式编程框架，支持类型安全的KeyPath自动补全、智能LRU缓存、跨平台动画与约束、性能监控、错误恢复等特性。API完全统一，极大提升iOS、macOS开发效率。
  DESC

  spec.homepage     = "https://github.com/13662049573/TFYSwiftChainDemo"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "田风有" => "420144542@qq.com" }

  spec.social_media_url = "https://github.com/13662049573"

  # 平台支持
  spec.ios.deployment_target = "15.0"
  spec.osx.deployment_target = "13.0"

  # Swift支持
  spec.swift_version = "5.0"

  spec.source       = { :git => "https://github.com/13662049573/TFYSwiftChainDemo.git", :tag => spec.version }

  spec.source_files = "TFYSwiftChainDemo/TFYEnhancedRuntimeChainKit/**/*.swift"

end
