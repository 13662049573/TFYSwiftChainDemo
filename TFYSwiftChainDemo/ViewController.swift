//
//  ViewController.swift
//  TFYSwiftChainDemo
//
//  Created by AI Assistant on 2024/12/19.
//  用途：演示通用链式系统和增强运行时链式系统的使用
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI 组件
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // 基础UI组件
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let primaryButton = UIButton(type: .system)
    private let secondaryButton = UIButton(type: .system)
    private let textField = UITextField()
    private let imageView = UIImageView()
    private let progressView = UIProgressView()
    private let switchControl = UISwitch()
    private let slider = UISlider()
    private let segmentedControl = UISegmentedControl(items: ["选项1", "选项2", "选项3"])
    
    // 容器组件
    private let containerView = UIView()
    private let stackView = UIStackView()
    
    // 数组组件用于批量操作
    private var labelArray: [UILabel] = []
    private var buttonArray: [UIButton] = []
    
    // ZSSensorsAnalyBuilder 演示按钮
    private let sensorsAnalyButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupBasicUIComponents() // 添加基础UI组件到视图层次结构
        setupKeyboardDismissGesture() // 设置点击收起键盘的手势
        demo1_BasicPropertySetting()
        demo2_KeyPathSetting()
        demo3_ConditionalSetting()
        demo4_BatchSetting()
        demo5_MethodInvocation()
        demo6_ErrorHandling()
        demo7_PerformanceMonitoring()
        demo8_AdvancedFeatures()
        demo9_DebuggingFeatures()
        demo10_UIKitSpecificMethods()
        demo11_StructChainUsage()
        demo12_ComplexNesting()
        demo13_BatchOperations()
        demo14_CustomConfiguration()
        demo15_ZSSensorsAnalyBuilder()
        // 延迟布局，确保view.bounds已正确设置
        DispatchQueue.main.async {
            self.layoutAllComponents()
        }
    }
    
    // MARK: - 设置基础UI组件
    private func setupBasicUIComponents() {
        // 添加所有基础UI组件到contentView
        contentView.addSubview(textField)
        contentView.addSubview(imageView)
        contentView.addSubview(progressView)
        contentView.addSubview(switchControl)
        contentView.addSubview(slider)
        contentView.addSubview(segmentedControl)
        print("✅ 基础UI组件已添加到contentView")
    }

    // MARK: - 设置点击收起键盘手势
    private func setupKeyboardDismissGesture() {
        // 创建点击手势识别器
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        // 使用链式调用配置手势识别器
        tapGesture.tapGestureChain
            .set(\.numberOfTapsRequired, to: 1)
            .set(\.numberOfTouchesRequired, to: 1)
            .set(\.cancelsTouchesInView, to: false) // 不取消其他触摸事件，允许按钮等控件正常响应
        
        // 添加手势到主视图
        view.addGestureRecognizer(tapGesture)
        
        print("✅ 键盘收起手势已设置 - 点击任何地方可收起键盘")
    }
    
    // MARK: - 收起键盘方法
    @objc private func dismissKeyboard() {
        // 让所有第一响应者失去焦点，从而收起键盘
        view.endEditing(true)
        print("⌨️ 键盘已收起")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 直接设置scrollView的frame，不使用链式调用
        scrollView.frame = view.bounds
        print("📐 直接设置后 - 滚动视图frame: \(scrollView.frame)")
        print("📐 主视图bounds: \(view.bounds)")
        
        // 重新触发布局，确保所有子视图都有正确的frame
        DispatchQueue.main.async {
            self.layoutAllComponents()
        }
    }
    
    // MARK: - 设置滚动视图 (使用Frame布局)
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // 使用链式调用设置滚动视图 - 完全使用frame布局
        scrollView.scrollChain
            .set(\.translatesAutoresizingMaskIntoConstraints, to: true)
            .set(\.backgroundColor, to: UIColor.systemBackground)
            .set(\.showsVerticalScrollIndicator, to: true)
            .set(\.showsHorizontalScrollIndicator, to: false)
            .set(\.alwaysBounceVertical, to: true)
            // frame在viewDidLayoutSubviews中设置
        
        contentView.chain
            .set(\.translatesAutoresizingMaskIntoConstraints, to: true)
            .set(\.backgroundColor, to: UIColor.systemGray6)
            .set(\.frame, to: CGRect(x: 0, y: 0, width: 350, height: 2000))  // 使用默认值，稍后在layout中重新设置
    }
    
    // MARK: - Demo 1: 基础属性设置
    private func demo1_BasicPropertySetting() {
        print("\n🔥 Demo 1: 基础属性设置")
        
        // 首先添加到视图层次结构
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(primaryButton)
        contentView.addSubview(secondaryButton)
        
        // 基础字符串属性设置
        titleLabel.labelChain
            .set(\.text, to: "链式调用系统演示")
            .set(\.textColor, to: UIColor.systemBlue)
            .set(\.font, to: UIFont.boldSystemFont(ofSize: 24))
            .set(\.textAlignment, to: NSTextAlignment.center)
            .set(\.numberOfLines, to: 0)
            .set(\.backgroundColor, to: UIColor.systemGray6)
            .set(\.layer.cornerRadius, to: 8.0)
            .set(\.clipsToBounds, to: true)
            .set(\.adjustsFontSizeToFitWidth, to: true)
            .log("标题标签配置完成")
        
        // 按钮基础设置
        primaryButton.buttonChain
            .set("title", "主要按钮")  // 直接设置title - 保持字符串形式，因为需要特殊处理
            .set("titleColor", UIColor.white)  // 设置title颜色 - 保持字符串形式，因为需要特殊处理
            .set(\.backgroundColor, to: UIColor.systemBlue)
            .set(\.layer.cornerRadius, to: 12.0)
            .set(\.clipsToBounds, to: true)
        
        // 次要按钮设置
        secondaryButton.buttonChain
            .set("title", "次要按钮")  // 保持字符串形式，因为需要特殊处理
            .set("titleColor", UIColor.systemBlue)  // 保持字符串形式，因为需要特殊处理
            .set(\.backgroundColor, to: UIColor.systemGray6)
            .set(\.layer.cornerRadius, to: 10.0)
            .set(\.clipsToBounds, to: true)
        
        // 副标题标签设置
        subtitleLabel.labelChain
            .set(\.text, to: "这是链式调用系统的演示应用")
            .set(\.textColor, to: UIColor.systemGray)
            .set(\.font, to: UIFont.systemFont(ofSize: 16))
            .set(\.textAlignment, to: NSTextAlignment.center)
            .set(\.numberOfLines, to: 0)
            .set(\.backgroundColor, to: UIColor.systemGray5)
            .set(\.layer.cornerRadius, to: 6.0)
            .set(\.clipsToBounds, to: true)
        
        // 文本字段设置
        textField.textFieldChain
            .set(\.text, to: "示例文本")
            .set(\.placeholder, to: "请输入文本...")
            .set(\.borderStyle, to: UITextField.BorderStyle.roundedRect)
        
        // 添加一些示例图像
        if let image = UIImage(systemName: "star.fill") {
            imageView.imageChain
                .set(\.image, to: image)
                .set(\.tintColor, to: UIColor.systemYellow)
                .set(\.contentMode, to: UIView.ContentMode.scaleAspectFit)
                .set(\.backgroundColor, to: UIColor.systemGray6)
                .set(\.layer.cornerRadius, to: 8.0)
                .set(\.clipsToBounds, to: true)
        }
        
        // 继续设置textField的其他属性
        textField.textFieldChain
            .set(\.font, to: UIFont.systemFont(ofSize: 16))
            .set(\.textColor, to: UIColor.label)
            .invoke("addTarget", self, #selector(textFieldDidChange(_:)), UIControl.Event.editingChanged)
    }
    
    // MARK: - Demo 2: KeyPath 属性设置
    private func demo2_KeyPathSetting() {
        print("\n🔥 Demo 2: KeyPath 属性设置")
        
        // 使用 KeyPath 设置属性（类型安全，支持自动补全）
        subtitleLabel.labelChain
            .set(\.text, to: "KeyPath 链式调用演示")        // ✅ 现在 \.text 会显示自动补全
            .set(\.textColor, to: UIColor.systemGreen)      // ✅ 现在 \.textColor 会显示自动补全
            .set(\.font, to: UIFont.systemFont(ofSize: 18))
            .set(\.textAlignment, to: .left)
            .set(\.numberOfLines, to: 0)
            .set(\.backgroundColor, to: UIColor.systemGray5)
            .set(\.layer.cornerRadius, to: 6.0)
            .set(\.clipsToBounds, to: true)
        
        // 按钮 KeyPath 设置
        secondaryButton.buttonChain
            .set(\.backgroundColor, to: UIColor.systemGreen) // ✅ 现在 \.backgroundColor 会显示自动补全
            .set(\.layer.cornerRadius, to: 10.0)
            .set(\.clipsToBounds, to: true)
        
        // 图片视图设置
        imageView.imageChain
            .set(\.backgroundColor, to: UIColor.systemGray4)
            .set(\.contentMode, to: .scaleAspectFit)
            .set(\.layer.cornerRadius, to: 8.0)
            .set(\.clipsToBounds, to: true)
        
        // 进度条设置
        progressView.progressChain
            .set(\.progress, to: 0.7)
            .set(\.progressTintColor, to: UIColor.systemBlue)
            .set(\.trackTintColor, to: UIColor.systemGray5)
    }
    
    // MARK: - Demo 3: 条件设置
    private func demo3_ConditionalSetting() {
        print("\n🔥 Demo 3: 条件设置")
        
        let isDarkMode = traitCollection.userInterfaceStyle == .dark
        let isLargeDevice = view.bounds.width > 414
        let shouldShowAdvancedFeatures = true
        
        // 条件字符串属性设置
        contentView.addSubview(containerView) // 添加到视图层级
        
        containerView.chain
            .set(\.frame, to: CGRect(x: 0, y: 0, width: 300, height: 60)) // 设置frame
            .setIf(isDarkMode, "backgroundColor", UIColor.systemGray6)  // 保持字符串形式，条件设置
            .setIf(!isDarkMode, "backgroundColor", UIColor.systemGray5)  // 保持字符串形式，条件设置
            .setIf(isLargeDevice, "layer.cornerRadius", 12.0)  // 保持字符串形式，条件设置
            .setIf(!isLargeDevice, "layer.cornerRadius", 8.0)  // 保持字符串形式，条件设置
            .set(\.clipsToBounds, to: true)
        
        // 条件 KeyPath 设置
        switchControl.switchChain
            .setKeyPathIf(shouldShowAdvancedFeatures, \.isOn, true)
            .setKeyPathIf(!shouldShowAdvancedFeatures, \.isOn, false)
            .set(\.onTintColor, to: UIColor.systemBlue)
            .set(\.thumbTintColor, to: UIColor.white)
            .invoke("addTarget", self, #selector(switchValueChanged(_:)), UIControl.Event.valueChanged)
        
        // 滑块条件设置
        slider.sliderChain
            .setKeyPathIf(isLargeDevice, \.value, 0.8)
            .setKeyPathIf(!isLargeDevice, \.value, 0.5)
            .set(\.minimumValue, to: 0.0)
            .set(\.maximumValue, to: 1.0)
            .set(\.minimumTrackTintColor, to: UIColor.systemBlue)
            .set(\.maximumTrackTintColor, to: UIColor.systemGray4)
            .invoke("addTarget", self, #selector(sliderValueChanged(_:)), UIControl.Event.valueChanged)
    }
    
    // MARK: - Demo 4: 批量设置
    private func demo4_BatchSetting() {
        print("\n🔥 Demo 4: 批量设置")
        
        // 创建多个标签用于批量操作
        for _ in 0..<3 {
            let label = UILabel()
            labelArray.append(label)
            contentView.addSubview(label)
        }
        
        // 创建多个按钮用于批量操作
        for _ in 0..<3 {
            let button = UIButton(type: .system)
            buttonArray.append(button)
            contentView.addSubview(button)
        }
        
        // 批量属性设置 - 字符串方式
        let commonProperties = [
            "font": UIFont.systemFont(ofSize: 14),
            "textAlignment": NSTextAlignment.center.rawValue,
            "backgroundColor": UIColor.systemGray6,
            "layer.cornerRadius": 6.0,
            "clipsToBounds": true
        ] as [String : Any]
        
        for (index, label) in labelArray.enumerated() {
            label.labelChain
                .setMultiple(commonProperties)
                .set("text", "批量标签 \(index + 1)")
                .set("textColor", UIColor.label)  // 确保文字颜色可见
                .set("textColor", [UIColor.systemRed, UIColor.systemGreen, UIColor.systemBlue][index])
        }
        
        // 批量按钮设置
        for (index, button) in buttonArray.enumerated() {
            button.buttonChain
                .set("backgroundColor", [UIColor.systemRed, UIColor.systemGreen, UIColor.systemBlue][index])
                .set("layer.cornerRadius", 8.0)
                .set("titleLabel.font", UIFont.systemFont(ofSize: 16, weight: .medium))
                .set("clipsToBounds", true)
                .invoke("setTitle", "批量按钮 \(index + 1)", UIControl.State.normal)
                .invoke("setTitleColor", UIColor.white, UIControl.State.normal)
                .invoke("addTarget", self, #selector(batchButtonTapped(_:)), UIControl.Event.touchUpInside)
        }
        
        // 使用 TFYChainHelper 进行批量操作
        TFYChainHelper.batchChain(buttonArray) { chain in
            return chain.set("alpha", 0.9)
        }
    }
    
    // MARK: - Demo 5: 方法调用
    private func demo5_MethodInvocation() {
        print("\n🔥 Demo 5: 方法调用")
        
        // UIButton 特殊方法调用
        primaryButton.buttonChain
            .invoke("setTitle", "主要按钮", UIControl.State.normal)
            .invoke("setTitleColor", UIColor.white, UIControl.State.normal)
            .invoke("setImage", UIImage(systemName: "star.fill") as Any, UIControl.State.normal)
            .invoke("addTarget", self, #selector(primaryButtonTapped), UIControl.Event.touchUpInside)
        
        secondaryButton.buttonChain
            .invoke("setTitle", "次要按钮", UIControl.State.normal)
            .invoke("setTitleColor", UIColor.white, UIControl.State.normal)
            .invoke("setBackgroundImage", createColorImage(UIColor.systemGreen) as Any, UIControl.State.normal)
            .invoke("addTarget", self, #selector(secondaryButtonTapped), UIControl.Event.touchUpInside)
        
        // UILabel 方法调用
        for (index, label) in labelArray.enumerated() {
            label.labelChain
                .invoke("setText", "方法调用标签 \(index + 1)")
                .invoke("setTextColor", [UIColor.systemRed, UIColor.systemGreen, UIColor.systemBlue][index])
                .invoke("setFont", UIFont.boldSystemFont(ofSize: 16))
        }
        
        // UIImageView 方法调用
        imageView.imageChain
            .invoke("setImageViewImage", UIImage(systemName: "photo.fill") as Any)
            .invoke("setContentMode", UIView.ContentMode.scaleAspectFit)
        
        // 简单方法调用
        textField.textFieldChain
            .call("becomeFirstResponder")
            .call("resignFirstResponder")
    }
    
    // MARK: - Demo 6: 错误处理
    private func demo6_ErrorHandling() {
        print("\n🔥 Demo 6: 错误处理")
        
        // 故意使用不存在的属性来触发错误
        titleLabel.labelChain
            .set("nonExistentProperty", "这会产生错误")  // 保持字符串形式，故意的错误属性
            .set("anotherBadProperty", 123)  // 保持字符串形式，故意的错误属性
            .set(\.text, to: "错误处理演示") // 转换为KeyPath形式
            .onError { errors in
                print("❌ 检测到 \(errors.count) 个错误:")
                for error in errors {
                    print("   - \(error)")
                }
            }
        
        // 尝试调用不存在的方法
        primaryButton.buttonChain
            .invoke("nonExistentMethod", "参数1", "参数2")
            .invoke("setTitle", "错误处理按钮", UIControl.State.normal) // 这个是正确的
            .onError { errors in
                print("❌ 按钮操作错误:")
                for error in errors {
                    print("   - \(error)")
                }
            }
        
        // 嵌套属性错误处理
        primaryButton.buttonChain
            .set("titleLabel.nonExistentProperty", "测试")
            .set("titleLabel.text", "正确的嵌套属性") // 这个是正确的
            .onError { errors in
                print("❌ 嵌套属性错误:")
                for error in errors {
                    print("   - \(error)")
                }
            }
    }
    
    // MARK: - Demo 7: 性能监控
    private func demo7_PerformanceMonitoring() {
        print("\n🔥 Demo 7: 性能监控")
        
        // 启用性能监控的链式调用
        segmentedControl.segmentChain
            .set(\.selectedSegmentIndex, to: 1)
            .set(\.backgroundColor, to: UIColor.systemGray5)
            .set(\.layer.cornerRadius, to: 8.0)
            .set(\.clipsToBounds, to: true)
            .invoke("setTitle", "性能监控", 0)
            .invoke("setTitle", "测试选项", 1)
            .invoke("setTitle", "高级功能", 2)
            .onPerformance { metrics in
                print("📊 性能监控结果:")
                for (operation, time) in metrics {
                    print("   - \(operation): \(time * 1000)ms")
                }
                
                let totalTime = metrics.values.reduce(0, +)
                print("   - 总耗时: \(totalTime * 1000)ms")
            }
        
        // 复杂操作的性能监控
        let complexView = UIView()
        contentView.addSubview(complexView)
        
        // 设置complexView的frame，这样在frame布局中才能正确显示
        complexView.chain
            .set(\.frame, to: CGRect(x: 0, y: 0, width: 300, height: 80))
        
        complexView.chain
            .enableDebug()
            .set(\.backgroundColor, to: UIColor.systemOrange)
            .set(\.layer.cornerRadius, to: 15.0)
            .set(\.layer.shadowColor, to: UIColor.black.cgColor)
            .set(\.layer.shadowOffset, to: CGSize(width: 0, height: 2))
            .set(\.layer.shadowOpacity, to: 0.3)
            .set(\.layer.shadowRadius, to: 4.0)
            .set(\.clipsToBounds, to: false)
            .onPerformance { metrics in
                print("📊 复杂视图配置性能:")
                let sortedMetrics = metrics.sorted { $0.value > $1.value }
                for (operation, time) in sortedMetrics {
                    let warning = time > 0.001 ? " ⚠️" : ""
                    print("   - \(operation): \(time * 1000)ms\(warning)")
                }
            }
    }
    
    // MARK: - Demo 8: 高级功能
    private func demo8_AdvancedFeatures() {
        print("\n🔥 Demo 8: 高级功能")
        
        // 延迟执行
        let delayedLabel = UILabel()
        contentView.addSubview(delayedLabel)
        
        delayedLabel.labelChain
            .set(\.text, to: "延迟执行演示")
            .set(\.textColor, to: UIColor.systemPurple)
            .set(\.font, to: UIFont.systemFont(ofSize: 16))
            .set(\.alpha, to: 0.0)
            .delay(1.0) { label in
                UIView.animate(withDuration: 0.5) {
                    (label ).alpha = 1.0
                }
                print("🕐 延迟1秒后显示标签")
            }
        
        // 异步执行
        let asyncLabel = UILabel()
        contentView.addSubview(asyncLabel)
        
        asyncLabel.labelChain
            .set(\.text, to: "异步执行演示")
            .set(\.textColor, to: UIColor.systemTeal)
            .set(\.font, to: UIFont.systemFont(ofSize: 16))
            .async(.global(qos: .background)) { label in
                // 模拟后台任务
                Thread.sleep(forTimeInterval: 0.5)
                DispatchQueue.main.async {
                    print("🔄 后台任务完成，更新UI")
                    (label ).backgroundColor = UIColor.systemTeal.withAlphaComponent(0.2)
                }
            }
        
        // 重复执行
        let repeatLabel = UILabel()
        contentView.addSubview(repeatLabel)
        
        repeatLabel.labelChain
            .set(\.text, to: "重复执行: 0")
            .set(\.textColor, to: UIColor.systemRed)
            .set(\.font, to: UIFont.systemFont(ofSize: 16))
            .repeat(5) { label in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    let uiLabel = label 
                    let currentText = uiLabel.text ?? "重复执行: 0"
                    if let countString = currentText.components(separatedBy: ": ").last,
                       let count = Int(countString) {
                        uiLabel.text = "重复执行: \(count + 1)"
                    }
                }
            }
        
        // 条件执行
        let conditionalLabel = UILabel()
        contentView.addSubview(conditionalLabel)
        
        conditionalLabel.labelChain
            .set(\.text, to: "条件执行演示")
            .set(\.textColor, to: UIColor.systemIndigo)
            .set(\.font, to: UIFont.systemFont(ofSize: 16))
            .when(Date().timeIntervalSince1970.truncatingRemainder(dividingBy: 2) == 0) { label in
                print("⚡ 偶数秒时执行")
                (label ).backgroundColor = UIColor.systemIndigo.withAlphaComponent(0.2)
            }
        
        // 链式配置
        let configLabel = UILabel()
        contentView.addSubview(configLabel)
        
        configLabel.labelChain
            .configure { label in
                let uiLabel = label 
                uiLabel.text = "配置闭包演示"
                uiLabel.textColor = UIColor.systemBrown
                uiLabel.font = UIFont.systemFont(ofSize: 16)
                uiLabel.textAlignment = .center
                uiLabel.backgroundColor = UIColor.systemBrown.withAlphaComponent(0.2)
                uiLabel.layer.cornerRadius = 8
                uiLabel.clipsToBounds = true
                print("🔧 通过配置闭包设置标签")
            }
    }
    
    // MARK: - Demo 9: 调试功能
    private func demo9_DebuggingFeatures() {
        print("\n🔥 Demo 9: 调试功能")
        
        // 启用调试的链式调用
        let debugView = UIView()
        contentView.addSubview(debugView)
        
        // 设置debugView的frame
        debugView.chain
            .set(\.frame, to: CGRect(x: 0, y: 0, width: 300, height: 80))
        
        debugView.chain
            .set(\.backgroundColor, to: UIColor.systemPink)
            .set(\.layer.cornerRadius, to: 10.0)
            .set(\.alpha, to: 0.8)
            .set(\.clipsToBounds, to: true)
            .log("调试视图创建完成")
            .printClassInfo()
            .validate()
        
        // 完整调试模式
        let fullDebugLabel = UILabel()
        contentView.addSubview(fullDebugLabel)
        
        fullDebugLabel.labelChain
            .set(\.text, to: "完整调试模式")
            .set(\.textColor, to: UIColor.white)
            .set(\.backgroundColor, to: UIColor.systemPink)
            .set(\.font, to: UIFont.boldSystemFont(ofSize: 16))
            .set(\.textAlignment, to: NSTextAlignment.center)
            .set(\.layer.cornerRadius, to: 8.0)
            .set(\.clipsToBounds, to: true)
            .onError { errors in
                if !errors.isEmpty {
                    print("🐛 调试模式发现错误:")
                    for error in errors {
                        print("   - \(error)")
                    }
                }
            }
            .onPerformance { metrics in
                print("🔍 调试模式性能监控:")
                for (operation, time) in metrics {
                    print("   - \(operation): \(time * 1000)ms")
                }
            }
    }
    
    // MARK: - Demo 10: UIKit 特殊方法
    private func demo10_UIKitSpecificMethods() {
        print("\n🔥 Demo 10: UIKit 特殊方法")
        
        // UIButton 特殊方法全面演示
        let specialButton = UIButton(type: .system)
        contentView.addSubview(specialButton)
        
        specialButton.buttonChain
            .invoke("setTitle", "特殊按钮", UIControl.State.normal)
            .invoke("setTitle", "按下状态", UIControl.State.highlighted)
            .invoke("setTitleColor", UIColor.white, UIControl.State.normal)
            .invoke("setTitleColor", UIColor.lightGray, UIControl.State.highlighted)
            .invoke("setImage", UIImage(systemName: "gear") as Any, UIControl.State.normal)
            .invoke("setBackgroundImage", createColorImage(UIColor.systemBlue) as Any, UIControl.State.normal)
            .invoke("setBackgroundImage", createColorImage(UIColor.systemBlue.withAlphaComponent(0.8)) as Any, UIControl.State.highlighted)
        
        // UITextField 特殊方法
        let specialTextField = UITextField()
        contentView.addSubview(specialTextField)
        
        specialTextField.textFieldChain
            .invoke("setText", "特殊文本字段")
            .invoke("setTextColor", UIColor.label)
            .invoke("setFont", UIFont.systemFont(ofSize: 16))
            .set(\.borderStyle, to: UITextField.BorderStyle.roundedRect)
            .set(\.placeholder, to: "请输入...")
        
        // UITextView 特殊方法
        let textView = UITextView()
        contentView.addSubview(textView)
        
        textView.textViewChain
            .invoke("setText", "这是一个 UITextView 的演示文本")
            .invoke("setTextColor", UIColor.label)
            .invoke("setFont", UIFont.systemFont(ofSize: 14))
            .set("backgroundColor", UIColor.systemGray6)
            .set("layer.cornerRadius", 8.0)
            .set("clipsToBounds", true)
        
        // UIImageView 特殊方法
        let specialImageView = UIImageView()
        contentView.addSubview(specialImageView)
        
        specialImageView.imageChain
            .invoke("setImageViewImage", UIImage(systemName: "heart.fill") as Any)
            .invoke("setContentMode", UIView.ContentMode.scaleAspectFit)
            .set(\.tintColor, to: UIColor.systemRed)
            .set(\.backgroundColor, to: UIColor.systemGray6)
            .set(\.layer.cornerRadius, to: 8.0)
            .set(\.clipsToBounds, to: true)
    }
    
    // MARK: - Demo 11: 结构体链式用法
    private func demo11_StructChainUsage() {
        print("\n🔥 Demo 11: 结构体链式用法")
        
        // 创建一个自定义结构体
        struct Person {
            var name: String = ""
            var age: Int = 0
            var email: String = ""
            var isActive: Bool = false
        }
        
        // 使用结构体链式调用
        let person = TFYChainHelper.structChain(Person())
            .set(\.name, "张三")
            .set(\.age, 30)
            .set(\.email, "zhangsan@example.com")
            .set(\.isActive, true)
            .log("创建人员信息")
            .build
        
        print("👤 创建的人员: \(person)")
        
        // 条件设置结构体
        let conditionalPerson = TFYChainHelper.structChain(Person())
            .setIf(person.age > 18, \.isActive, true)
            .setIf(person.age <= 18, \.isActive, false)
            .set(\.name, "条件设置人员")
            .set(\.age, 25)
            .build
        
        print("👤 条件设置人员: \(conditionalPerson)")
        
        // 批量设置结构体属性
        let batchPerson = TFYChainHelper.structChain(Person())
            .setMultiple { person in
                person.name = "批量设置人员"
                person.age = 28
                person.email = "batch@example.com"
                person.isActive = true
            }
            .build
        
        print("👤 批量设置人员: \(batchPerson)")
    }
    
    // MARK: - Demo 12: 复杂嵌套
    private func demo12_ComplexNesting() {
        print("\n🔥 Demo 12: 复杂嵌套")
        
        // 创建复杂的嵌套视图结构
        let outerContainer = UIView()
        let innerContainer = UIView()
        let nestedLabel = UILabel()
        let nestedButton = UIButton(type: .system)
        
        contentView.addSubview(outerContainer)
        outerContainer.addSubview(innerContainer)
        innerContainer.addSubview(nestedLabel)
        innerContainer.addSubview(nestedButton)
        
        // 设置outerContainer的frame
        outerContainer.chain
            .set(\.frame, to: CGRect(x: 0, y: 0, width: 300, height: 120))
        
        // 外层容器设置
        outerContainer.chain
            .set(\.backgroundColor, to: UIColor.systemGray5)
            .set(\.layer.cornerRadius, to: 12.0)
            .set(\.clipsToBounds, to: true)
            .set(\.layer.shadowColor, to: UIColor.black.cgColor)
            .set(\.layer.shadowOffset, to: CGSize(width: 0, height: 2))
            .set(\.layer.shadowOpacity, to: 0.2)
            .set(\.layer.shadowRadius, to: 4.0)
            .set(\.translatesAutoresizingMaskIntoConstraints, to: true)
        
        // 内层容器设置 - 使用frame布局
        innerContainer.chain
            .set(\.backgroundColor, to: UIColor.systemBackground)
            .set(\.layer.cornerRadius, to: 8.0)
            .set(\.clipsToBounds, to: true)
            .set(\.translatesAutoresizingMaskIntoConstraints, to: true)
        
        // 嵌套标签设置 - 使用frame布局
        nestedLabel.labelChain
            .set(\.text, to: "嵌套标签")
            .set(\.textColor, to: UIColor.label)
            .set(\.font, to: UIFont.systemFont(ofSize: 16, weight: .medium))
            .set(\.textAlignment, to: NSTextAlignment.center)
            .set(\.layer.borderWidth, to: 1.0)
            .set(\.layer.borderColor, to: UIColor.systemBlue.cgColor)
            .set(\.layer.cornerRadius, to: 6.0)
            .set(\.clipsToBounds, to: true)
            .set(\.translatesAutoresizingMaskIntoConstraints, to: true)
        
        // 嵌套按钮设置 - 使用frame布局
        nestedButton.buttonChain
            .invoke("setTitle", "嵌套按钮", UIControl.State.normal)
            .invoke("setTitleColor", UIColor.white, UIControl.State.normal)
            .set(\.backgroundColor, to: UIColor.systemBlue)
            .set(\.layer.cornerRadius, to: 8.0)
            .set(\.clipsToBounds, to: true)
            .set(\.translatesAutoresizingMaskIntoConstraints, to: true)
            .invoke("addTarget", self, #selector(nestedButtonTapped), UIControl.Event.touchUpInside)
        
        // 使用frame布局嵌套视图，避免约束冲突
        DispatchQueue.main.async {
            // 设置内层容器的frame
            let outerFrame = outerContainer.frame
            let innerFrame = CGRect(x: 16, y: 16, width: outerFrame.width - 32, height: outerFrame.height - 32)
            innerContainer.chain
                .set(\.frame, to: innerFrame)
            
            // 设置嵌套标签的frame  
            let labelFrame = CGRect(x: 12, y: 12, width: innerFrame.width - 24, height: 40)
            nestedLabel.labelChain
                .set(\.frame, to: labelFrame)
            
            // 设置嵌套按钮的frame
            let buttonFrame = CGRect(x: 12, y: 64, width: innerFrame.width - 24, height: 44)
            nestedButton.buttonChain
                .set(\.frame, to: buttonFrame)
        }
    }
    
    // MARK: - Demo 13: 批量操作
    private func demo13_BatchOperations() {
        print("\n🔥 Demo 13: 批量操作")
        
        // 创建多个视图进行批量操作
        var batchViews: [UIView] = []
        var batchLabels: [UILabel] = []
        
        for _ in 0..<5 {
            let view = UIView()
            let label = UILabel()
            
            contentView.addSubview(view)
            view.addSubview(label)
            
            batchViews.append(view)
            batchLabels.append(label)
        }
        
        // 批量设置视图
        for (index, view) in batchViews.enumerated() {
            let colors = [UIColor.systemRed, UIColor.systemGreen, UIColor.systemBlue, UIColor.systemOrange, UIColor.systemPurple]
            
            view.chain
                .set(\.frame, to: CGRect(x: 0, y: 0, width: 300, height: 60)) // 设置frame
                .set(\.backgroundColor, to: colors[index].withAlphaComponent(0.3))
                .set(\.layer.cornerRadius, to: 8.0)
                .set(\.layer.borderWidth, to: 2.0)
                .set(\.layer.borderColor, to: colors[index].cgColor)
                .set(\.clipsToBounds, to: true)
        }
        
        // 批量设置标签和约束
        for (index, label) in batchLabels.enumerated() {
            label.labelChain
                .set(\.text, to: "批量标签 \(index + 1)")
                .set(\.textColor, to: UIColor.label)
                .set(\.font, to: UIFont.systemFont(ofSize: 14, weight: .medium))
                .set(\.textAlignment, to: NSTextAlignment.center)
                .set(\.backgroundColor, to: UIColor.clear)
                .set(\.translatesAutoresizingMaskIntoConstraints, to: true)
            
            // 使用frame布局设置嵌套标签，避免约束冲突
            if let parentView = label.superview {
                DispatchQueue.main.async {
                    let parentFrame = parentView.frame
                    let labelFrame = CGRect(x: 8, y: 8, width: parentFrame.width - 16, height: parentFrame.height - 16)
                    label.labelChain
                        .set(\.frame, to: labelFrame)
                }
            }
        }
        
        // 使用 TFYChainHelper 批量操作
        TFYChainHelper.batchChain(batchLabels) { chain in
            return chain
                .set(\.alpha, to: 0.0)
                .delay(Double.random(in: 0.5...2.0)) { label in
                    UIView.animate(withDuration: 0.5) {
                        label.alpha = 1.0
                    }
                }
        }
    }
    
    // MARK: - Demo 14: 自定义配置
    private func demo14_CustomConfiguration() {
        print("\n🔥 Demo 14: 自定义配置")
        
        // 配置性能监控
        TFYChainPerformanceConfig.performanceWarningThreshold = 0.5 // 0.5ms
        TFYChainPerformanceConfig.cacheEnabled = true
        TFYChainPerformanceConfig.maxCacheSize = 500
        
        // 创建自定义配置的视图
        let customView = UIView()
        contentView.addSubview(customView)
        
        // 设置customView的frame
        customView.chain
            .set(\.frame, to: CGRect(x: 0, y: 0, width: 300, height: 80))
        
        customView.chain
            .set(\.backgroundColor, to: UIColor.systemYellow)
            .set(\.layer.cornerRadius, to: 15.0)
            .set(\.layer.shadowColor, to: UIColor.orange.cgColor)
            .set(\.layer.shadowOffset, to: CGSize(width: 2, height: 2))
            .set(\.layer.shadowOpacity, to: 0.5)
            .set(\.layer.shadowRadius, to: 6.0)
            .set(\.clipsToBounds, to: false)
            .configure { view in
                // 自定义配置逻辑
                let uiView = view 
                uiView.layer.masksToBounds = false
                uiView.layer.shouldRasterize = true
                uiView.layer.rasterizationScale = UIScreen.main.scale
                print("🎨 自定义视图配置完成")
            }
            .onPerformance { metrics in
                print("📈 自定义配置性能:")
                for (operation, time) in metrics {
                    let timeMs = time * 1000
                    let status = timeMs > TFYChainPerformanceConfig.performanceWarningThreshold ? "⚠️ 慢" : "✅ 快"
                    print("   - \(operation): \(timeMs)ms \(status)")
                }
            }
        
        // 清理缓存演示
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            print("🧹 清理性能缓存")
            TFYChainPerformanceConfig.clearAllCaches()
        }
    }
    
    // MARK: - Demo 15: ZSSensorsAnalyBuilder 数据分析构建器
    private func demo15_ZSSensorsAnalyBuilder() {
        print("\n🔥 Demo 15: ZSSensorsAnalyBuilder 数据分析构建器")
        
        // 应用启动事件构建
        let appLaunchEvent = ZSSensorsAnalyBuilder().chain
            .set(\.userId, "user_12345")
            .set(\.eventTime, Date())
            .set(\.packageName, "com.example.app")
            .set(\.appVersion, "1.0.0")
            .set(\.platformType, "iOS")
            .set(\.language, "zh-CN")
            .set(\.launchType, "cold_start")
            .set(\.launchFrom, "homescreen")
            .set(\.phoneSystemLanguage, "zh-Hans")
            .set(\.isPermission, true)
            .set(\.isRealtimePermission, false)
            .set(\.isFirstStart, false)
            .set(\.isRegisterDay, false)
            .set(\.isAttributionDay, true)
            .set(\.isVIP, false)
            .log("构建应用启动事件")
            .build
        
        print("📱 应用启动事件:")
        printEventData(appLaunchEvent, title: "App Launch Event")
        
        // 剧集播放事件构建
        let playEvent = ZSSensorsAnalyBuilder().chain
            .set(\.userId, "user_12345")
            .set(\.eventTime, Date())
            .set(\.reelId, "reel_98765")
            .set(\.reelName, "精彩短剧第一季")
            .set(\.reelEpisode, "episode_001")
            .set(\.reelEpisodeNum, 1)
            .set(\.playPageName, "play_page")
            .set(\.firstReferPageName, "home_page")
            .set(\.referModuleName, "recommend_module")
            .set(\.referModulePosition, "banner_top")
            .set(\.videoDuration, 180)
            .set(\.watchTime, 120)
            .set(\.speedDuration, 1.5)
            .set(\.isEndPlay, false)
            .set(\.isFollowed, true)
            .set(\.playType, "auto_play")
            .set(\.isLastFreeEpisode, false)
            .set(\.isVipEpisode, true)
            .set(\.isPayPoint, false)
            .set(\.vipLevel, "premium")
            .log("构建剧集播放事件")
            .build
        
        print("▶️ 剧集播放事件:")
        printEventData(playEvent, title: "Play Event")
        
        // 充值事件构建
        let rechargeEvent = ZSSensorsAnalyBuilder().chain
            .set(\.userId, "user_12345")
            .set(\.eventTime, Date())
            .set(\.activityName, "新年充值活动")
            .set(\.coinId, "coin_gold")
            .set(\.coinAmount, 100)
            .set(\.coinAward, 20)
            .set(\.gearType, "monthly")
            .set(\.gearAmount, 30)
            .set(\.rechargePrice, 30)
            .set(\.rechargeDays, 30)
            .set(\.contractPrice, 30)
            .set(\.contractDays, 30)
            .set(\.payCount, 1)
            .set(\.isFirstRegistrationRecharge, false)
            .set(\.isFirstChannelRecharge, true)
            .set(\.isSuccess, true)
            .set(\.rechargeWayNew, "apple_pay")
            .set(\.isDefaultNew, false)
            .log("构建充值事件")
            .build
        
        print("💰 充值事件:")
        printEventData(rechargeEvent, title: "Recharge Event")
        
        // 广告事件构建
        let adEvent = ZSSensorsAnalyBuilder().chain
            .set(\.userId, "user_12345")
            .set(\.eventTime, Date())
            .set(\.adScene, "video_end")
            .set(\.adSource, "google_ads")
            .set(\.adType, "reward_video")
            .set(\.adUnitName, "reward_video_unit")
            .set(\.adUnitId, "ca-app-pub-123456789")
            .set(\.adEstimatedIncome, 0.05)
            .set(\.adImpressionResult, true)
            .set(\.adImpressionReason, "success")
            .log("构建广告事件")
            .build
        
        print("📺 广告事件:")
        printEventData(adEvent, title: "Ad Event")
        
        // 搜索事件构建
        let searchEvent = ZSSensorsAnalyBuilder().chain
            .set(\.userId, "user_12345")
            .set(\.eventTime, Date())
            .set(\.pageName, "search_page")
            .set(\.referPageName, "home_page")
            .set(\.keyWord, "浪漫爱情")
            .set(\.keyWordType, "category")
            .set(\.haveResult, true)
            .set(\.resultNum, 25)
            .set(\.isRecommend, false)
            .set(\.recommendModule, "hot_search")
            .set(\.index, "search_1")
            .log("构建搜索事件")
            .build
        
        print("🔍 搜索事件:")
        printEventData(searchEvent, title: "Search Event")
        
        // 任务事件构建
        let taskEvent = ZSSensorsAnalyBuilder().chain
            .set(\.userId, "user_12345")
            .set(\.eventTime, Date())
            .set(\.taskId, "daily_watch")
            .set(\.taskName, "每日观看任务")
            .set(\.currWatchTimes, 3)
            .set(\.watchTimes, 5)
            .set(\.bonusNum, 10)
            .set(\.accumulativeDays, 15)
            .set(\.consecutiveDays, 3)
            .set(\.receiveType, "manual")
            .set(\.getPoints, 100)
            .log("构建任务事件")
            .build
        
        print("📋 任务事件:")
        printEventData(taskEvent, title: "Task Event")
        
        // 复杂事件链式构建演示
        let complexEvent = ZSSensorsAnalyBuilder().chain
            .setMultiple { builder in
                // 基础信息
                builder.userId = "user_vip_789"
                builder.eventTime = Date()
                builder.packageName = "com.shorts.premium"
                builder.appVersion = "2.1.0"
                builder.platformType = "iOS"
                builder.language = "en-US"
                
                // 用户状态
                builder.isVIP = true
                builder.isAutoRenewal = true
                builder.vipLevel = "premium_plus"
                
                // 播放信息
                builder.reelId = "premium_reel_001"
                builder.reelName = "独家精品短剧"
                builder.videoDuration = 300
                builder.watchTime = 280
                builder.isEndPlay = true
                
                // 归因信息
                builder.attributionChannel = "facebook_ads"
                builder.attributionChannelName = "Facebook广告"
                builder.attributionDays = 7
                builder.isAttributionDay = false
            }
            .log("构建复杂事件数据")
            .build
        
        print("🎯 复杂事件:")
        printEventData(complexEvent, title: "Complex Event")
        
        // 条件构建演示
        let conditionalEvent = ZSSensorsAnalyBuilder().chain
            .set(\.userId, "user_12345")
            .set(\.eventTime, Date())
            .setIf(true, \.isVIP, true)
            .setIf(false, \.isAutoRenewal, false)
            .setIf(complexEvent.isVIP == true, \.vipLevel, "premium")
            .setIf(Date().timeIntervalSince1970.truncatingRemainder(dividingBy: 2) == 0, \.isAttributionDay, true)
            .log("条件构建事件")
            .build
        
        print("⚡ 条件构建事件:")
        printEventData(conditionalEvent, title: "Conditional Event")
        
        // 配置演示按钮
        sensorsAnalyButton.buttonChain
            .set(\.backgroundColor, to: UIColor.systemIndigo)
            .set(\.layer.cornerRadius, to: 12.0)
            .set(\.clipsToBounds, to: true)
            .invoke("setTitle", "📊 触发数据分析事件", UIControl.State.normal)
            .invoke("setTitleColor", UIColor.white, UIControl.State.normal)
            .invoke("addTarget", self, #selector(sensorsAnalyButtonTapped), UIControl.Event.touchUpInside)
            .log("配置数据分析演示按钮")
    }
    
    /// 打印事件数据的辅助方法
    private func printEventData(_ event: ZSSensorsAnalyBuilder, title: String) {
        print("  📊 \(title):")
        
        // 使用反射打印非空属性
        let mirror = Mirror(reflecting: event)
        var nonEmptyProperties: [(String, Any)] = []
        
        for (label, value) in mirror.children {
            guard let propertyName = label else { continue }
            
            // 检查值是否为非空
            let isNonEmpty: Bool
            switch value {
            case let stringValue as String:
                isNonEmpty = !stringValue.isEmpty
            case let optionalString as String?:
                isNonEmpty = optionalString != nil && !optionalString!.isEmpty
            case _ as Date:
                isNonEmpty = true
            case let optionalDate as Date?:
                isNonEmpty = optionalDate != nil
            case _ as Bool:
                isNonEmpty = true
            case let optionalBool as Bool?:
                isNonEmpty = optionalBool != nil
            case let intValue as Int:
                isNonEmpty = intValue != 0
            case let optionalInt as Int?:
                isNonEmpty = optionalInt != nil && optionalInt! != 0
            case let doubleValue as Double:
                isNonEmpty = doubleValue != 0.0
            case let optionalDouble as Double?:
                isNonEmpty = optionalDouble != nil && optionalDouble! != 0.0
            case let int64Value as Int64:
                isNonEmpty = int64Value != 0
            case let optionalInt64 as Int64?:
                isNonEmpty = optionalInt64 != nil && optionalInt64! != 0
            default:
                isNonEmpty = false
            }
            
            if isNonEmpty {
                nonEmptyProperties.append((propertyName, value))
            }
        }
        
        // 只显示前10个属性，避免输出过长
        let displayProperties = Array(nonEmptyProperties.prefix(10))
        for (name, value) in displayProperties {
            if let date = value as? Date {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                print("    • \(name): \(formatter.string(from: date))")
            } else {
                print("    • \(name): \(value)")
            }
        }
        
        if nonEmptyProperties.count > 10 {
            print("    • ... 还有 \(nonEmptyProperties.count - 10) 个属性")
        }
        
        print("    ✅ 总共设置了 \(nonEmptyProperties.count) 个属性")
        print("")
    }
    
    // MARK: - 布局所有组件 (使用Frame布局)
    private func layoutAllComponents() {
        print("\n🔥 布局所有组件 - 使用Frame布局")
        
        // 获取contentView中的所有直接子视图
        let allSubviews = contentView.subviews
        print("📊 找到 \(allSubviews.count) 个子视图需要布局")
        
        // 布局参数
        let spacing: CGFloat = 16
        let margin: CGFloat = 20
        let contentWidth = scrollView.bounds.width - (margin * 2)
        
        // 保护措施：如果scrollView还没有正确的bounds，使用默认值
        let safeContentWidth = contentWidth > 0 ? contentWidth : 350.0
        
        print("📐 布局开始 - scrollView.bounds: \(scrollView.bounds)")
        print("📐 布局开始 - contentWidth: \(contentWidth)")
        print("📐 布局开始 - safeContentWidth: \(safeContentWidth)")
        
        // 清理所有约束，改用frame布局
        for view in allSubviews {
            view.translatesAutoresizingMaskIntoConstraints = true
            view.removeConstraints(view.constraints)
            
            // 确保视图可见
            if view.backgroundColor == nil || view.backgroundColor == UIColor.clear {
                if view is UILabel {
                    view.backgroundColor = UIColor.systemGray6
                } else if view is UIButton {
                    if view.backgroundColor == UIColor.clear {
                        view.backgroundColor = UIColor.systemBlue
                    }
                } else {
                    view.backgroundColor = UIColor.systemBackground
                }
            }
            
            // 设置边框以便调试
            view.layer.borderWidth = 1.0
            view.layer.borderColor = UIColor.systemGray3.cgColor
            view.layer.cornerRadius = 8.0
        }
        
        // 使用frame垂直布局所有视图
        var currentY: CGFloat = spacing
        
        for (index, view) in allSubviews.enumerated() {
            // 根据视图类型设置高度
            let viewHeight: CGFloat
            if view is UITextView {
                viewHeight = 80
            } else if view is UITextField {
                viewHeight = 44
            } else if view is UIButton {
                viewHeight = 50
            } else if view is UILabel {
                viewHeight = 44
            } else {
                viewHeight = 60  // 容器视图给更多空间
            }
            
            // 使用链式系统设置frame
            view.chain
                .set(\.frame, to: CGRect(x: 0, y: currentY, width: safeContentWidth, height: viewHeight))
            
            currentY += viewHeight + spacing
            print("✅ 布局第 \(index + 1) 个视图: \(String(describing: type(of: view))) - Frame: \(view.frame)")
        }
        
        // 设置contentView的大小
        let totalHeight = currentY
        contentView.chain
            .set(\.frame, to: CGRect(x: 0, y: 0, width: safeContentWidth, height: totalHeight))
        
        // 设置滚动视图内容大小
        scrollView.scrollChain
            .set(\.contentSize, to: CGSize(width: safeContentWidth, height: totalHeight))
        
        print("📏 内容总高度: \(totalHeight)")
        print("📏 滚动视图frame: \(scrollView.frame)")
        print("📏 内容视图frame: \(contentView.frame)")
        print("📏 滚动内容大小: \(scrollView.contentSize)")
        
        print("✅ 所有 \(allSubviews.count) 个组件Frame布局完成")
    }
    
    // MARK: - 辅助方法
    
    /// 创建纯色图片
    private func createColorImage(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    // MARK: - 按钮事件
    
    @objc private func primaryButtonTapped() {
        print("🔘 主要按钮被点击")
        
        // 使用链式调用更新UI
        primaryButton.buttonChain
            .set(\.alpha, to: 0.5)
            .delay(0.1) { button in
                UIView.animate(withDuration: 0.2) {
                    (button ).alpha = 1.0
                }
            }
    }
    
    @objc private func secondaryButtonTapped() {
        print("🔘 次要按钮被点击")
        
        // 链式动画效果
        secondaryButton.buttonChain
            .configure { button in
                let uiButton = button 
                UIView.animate(withDuration: 0.3, animations: {
                    uiButton.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                }) { _ in
                    UIView.animate(withDuration: 0.3) {
                        uiButton.transform = .identity
                    }
                }
            }
    }
    
    @objc private func nestedButtonTapped() {
        print("🔘 嵌套按钮被点击")
    
        // 显示所有链式调用的使用统计
        print("\n📊 链式调用系统使用统计:")
        print("✅ 演示了所有核心功能:")
        print("   - 基础属性设置（字符串键名）")
        print("   - KeyPath 属性设置（类型安全）")
        print("   - 条件设置")
        print("   - 批量设置")
        print("   - 方法调用")
        print("   - 错误处理")
        print("   - 性能监控")
        print("   - 高级功能（延迟、异步、重复、条件执行）")
        print("   - 调试功能")
        print("   - UIKit 特殊方法")
        print("   - 结构体链式用法")
        print("   - 复杂嵌套")
        print("   - 批量操作")
        print("   - 自定义配置")
        print("🎉 链式系统功能演示完成！")
    }
    
    @objc private func batchButtonTapped(_ sender: UIButton) {
        if let index = buttonArray.firstIndex(of: sender) {
            print("🔘 批量按钮 \(index + 1) 被点击")
            
            // 使用链式调用创建点击动画
            sender.buttonChain
                .configure { button in
                    let uiButton = button 
                    UIView.animate(withDuration: 0.15, animations: {
                        uiButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                        uiButton.alpha = 0.8
                    }) { _ in
                        UIView.animate(withDuration: 0.15) {
                            uiButton.transform = .identity
                            uiButton.alpha = 1.0
                        }
                    }
                }
                .delay(0.3) { button in
                    print("📝 批量按钮 \(index + 1) 动画完成")
                }
        }
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        print("🔄 开关状态改变为: \(sender.isOn ? "开" : "关")")
        
        // 使用链式调用更新其他组件状态
        if sender.isOn {
            progressView.progressChain
                .set(\.alpha, to: 1.0)
                .set(\.progress, to: 0.75)
                .set(\.progressTintColor, to: UIColor.systemGreen)
        } else {
            progressView.progressChain
                .set(\.alpha, to: 0.5)
                .set(\.progress, to: 0.25)
                .set(\.progressTintColor, to: UIColor.systemGray)
        }
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        print("🎚 滑块值改变为: \(sender.value)")
        
        // 使用链式调用同步进度条
        progressView.progressChain
            .set(\.progress, to: sender.value)
            .configure { progressView in
                let uiProgressView = progressView 
                // 根据值改变颜色
                if sender.value < 0.3 {
                    uiProgressView.progressTintColor = UIColor.systemRed
                } else if sender.value < 0.7 {
                    uiProgressView.progressTintColor = UIColor.systemOrange
                } else {
                    uiProgressView.progressTintColor = UIColor.systemGreen
                }
            }
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        let selectedTitle = sender.titleForSegment(at: selectedIndex) ?? "未知"
        print("📊 分段控制器选择: \(selectedTitle) (索引: \(selectedIndex))")
        
        // 使用链式调用根据选择更新界面
        switch selectedIndex {
        case 0: // 性能监控
            titleLabel.labelChain
                .set(\.text, to: "🚀 性能监控模式")
                .set(\.textColor, to: UIColor.systemBlue)
                .set(\.backgroundColor, to: UIColor.systemBlue.withAlphaComponent(0.1))
        case 1: // 测试选项
            titleLabel.labelChain
                .set(\.text, to: "🧪 测试选项模式")
                .set(\.textColor, to: UIColor.systemOrange)
                .set(\.backgroundColor, to: UIColor.systemOrange.withAlphaComponent(0.1))
        case 2: // 高级功能
            titleLabel.labelChain
                .set(\.text, to: "⚡ 高级功能模式")
                .set(\.textColor, to: UIColor.systemPurple)
                .set(\.backgroundColor, to: UIColor.systemPurple.withAlphaComponent(0.1))
        default:
            break
        }
        
        // 使用链式调用添加动画效果
        titleLabel.labelChain
            .configure { label in
                let uiLabel = label 
                UIView.transition(with: uiLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
                    // 动画在上面的设置中已经生效
                }, completion: nil)
            }
    }
    
    @objc private func textFieldDidChange(_ sender: UITextField) {
        let text = sender.text ?? ""
        print("📝 文本输入变化: \(text)")
        
        // 使用链式调用根据输入内容动态更新界面
        let isEmpty = text.isEmpty
        let isLongText = text.count > 10
        
        // 动态改变文本框样式
        sender.textFieldChain
            .setIf(isEmpty, "borderStyle", UITextField.BorderStyle.roundedRect.rawValue)
            .setIf(!isEmpty && !isLongText, "borderStyle", UITextField.BorderStyle.line.rawValue)
            .setIf(isLongText, "borderStyle", UITextField.BorderStyle.bezel.rawValue)
            .configure { textField in
                let uiTextField = textField 
                if isEmpty {
                    uiTextField.backgroundColor = UIColor.systemBackground
                } else if isLongText {
                    uiTextField.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.1)
                } else {
                    uiTextField.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
                }
            }
        
        // 更新副标题显示字符计数
        subtitleLabel.labelChain
            .set(\.text, to: isEmpty ? "KeyPath 链式调用演示" : "输入了 \(text.count) 个字符: \(text)")
            .set(\.textColor, to: isLongText ? UIColor.systemGreen : UIColor.systemGray)
    }
    
    @objc private func sensorsAnalyButtonTapped() {
        print("📊 数据分析按钮被点击 - 模拟实时事件触发")
        
        // 创建一个实时的用户行为事件
        let currentTime = Date()
        let randomUserId = "user_\(Int.random(in: 10000...99999))"
        
        // 模拟点击事件
        let clickEvent = ZSSensorsAnalyBuilder().chain
            .set(\.userId, randomUserId)
            .set(\.eventTime, currentTime)
            .set(\.pageName, "demo_page")
            .set(\.operationId, "button_click")
            .set(\.buttonName, "数据分析演示按钮")
            .set(\.clickPosition, "center")
            .set(\.isVIP, Bool.random())
            .set(\.platformType, "iOS")
            .set(\.appVersion, "1.0.0")
            .configure { event in
                print("🎯 实时事件构建完成")
            }
            .delay(0.5) { event in
                print("📤 模拟发送事件到分析服务器...")
            }
            .build
        
        print("✨ 实时点击事件:")
        printEventData(clickEvent, title: "Real-time Click Event")
        
        // 使用链式调用创建按钮动画
        sensorsAnalyButton.buttonChain
            .configure { button in
                let uiButton = button 
                UIView.animate(withDuration: 0.2, animations: {
                    uiButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                    uiButton.backgroundColor = UIColor.systemPurple
                }) { _ in
                    UIView.animate(withDuration: 0.2) {
                        uiButton.transform = .identity
                        uiButton.backgroundColor = UIColor.systemIndigo
                    }
                }
            }
            .delay(1.0) { button in
                print("🔄 数据分析事件发送完成")
                
                // 模拟服务器响应
                DispatchQueue.main.async {
                    let alertTitle = "📊 数据分析事件"
                    let alertMessage = """
                    事件已成功构建并模拟发送！
                    
                    用户ID: \(randomUserId)
                    事件类型: 按钮点击
                    时间: \(DateFormatter.localizedString(from: currentTime, dateStyle: .short, timeStyle: .medium))
                    
                    查看控制台输出获取详细信息
                    """
                    
                    let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "确定", style: .default))
                    self.present(alert, animated: true)
                }
            }
    }
}
    
