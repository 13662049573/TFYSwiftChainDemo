//
//  ViewController.swift
//  TFYSwiftChainDemo
//
//  Created by AI Assistant on 2024/12/19.
//  用途：链式系统演示，展示所有TFYChainHelper功能
//

import UIKit

// MARK: - 演示用结构体
struct DemoConfig {
    var title: String = ""
    var color: UIColor = .systemBlue
    var fontSize: CGFloat = 16.0
    var isEnabled: Bool = true
}

class ViewController: UIViewController {
    // MARK: - UI 组件
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // 基础控件演示
    private var label: UILabel!
    private var button: UIButton!
    private var imageView: UIImageView!
    private var textField: UITextField!
    private var switchControl: UISwitch!
    private var slider: UISlider!
    private var segmentedControl: UISegmentedControl!
    private var demoView: UIView!
    
    // 跨平台便利方法演示
    private var crossPlatformLabel: UILabel!
    private var crossPlatformButton: UIButton!
    private var crossPlatformImageView: UIImageView!
    private var crossPlatformTextField: UITextField!
    private var crossPlatformScrollView: UIScrollView!
    private var crossPlatformStackView: UIStackView!
    
    // 批量演示用
    private var batchButtons: [UIButton] = []
    private var batchLabels: [UILabel] = []
    
    // 结构体链式演示
    private var structDemoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupBasicChainDemo()
        setupCrossPlatformHelperDemo()
        setupBatchOperationsDemo()
        setupStructChainDemo()
        setupKeyboardDismissGesture()
    }
    
    // MARK: - 滚动视图设置
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        scrollView.backgroundColor = .systemBackground
        contentView.backgroundColor = .systemGray6
    }
    
    // MARK: - 基础链式调用演示
    private func setupBasicChainDemo() {
        // 创建标题 - 使用链式调用
        let titleLabel = TFYChainHelper.createLabel { chain in
            return chain
                .set(\.text, to: "=== 基础链式调用演示 ===")
                .set(\.font, to: .boldSystemFont(ofSize: 20))
                .set(\.textAlignment, to: .center)
                .set(\.textColor, to: .systemBlue)
                .set(\.translatesAutoresizingMaskIntoConstraints, to: false)
        }
        contentView.addSubview(titleLabel)
        
        // Label 基础链式
        label = UILabel()
        contentView.addSubview(label)
        label.labelChain
            .set(\.text, to: "基础Label链式演示")
            .set(\.textColor, to: .systemBlue)
            .set(\.font, to: .boldSystemFont(ofSize: 18))
            .set(\.textAlignment, to: .center)
            .set(\.backgroundColor, to: .systemGray5)
            .set(\.layer.cornerRadius, to: 8)
            .set(\.clipsToBounds, to: true)
            .onPerformance { metrics in print("Label链式性能:", metrics) }
            .onError { errors in print("Label链式错误:", errors) }
            .log("Label链式配置完成")
        
        // Button 基础链式
        button = UIButton(type: .system)
        contentView.addSubview(button)
        button.buttonChain
            .set(\.backgroundColor, to: .systemGreen)
            .set(\.layer.cornerRadius, to: 10)
            .set(\.clipsToBounds, to: true)
            .invoke("setTitle", "基础按钮", UIControl.State.normal)
            .invoke("setTitleColor", UIColor.white, UIControl.State.normal)
            .invoke("setFont", UIFont.boldSystemFont(ofSize: 20))
            .invoke("addTarget", self, #selector(buttonTapped), UIControl.Event.touchUpInside)
            .animate(duration: 0.8, options: [.curveEaseInOut], animations: { btn in btn.alpha = 0.7 }, completion: { _ in })
            .onPerformance { metrics in print("Button链式性能:", metrics) }
            .onError { errors in print("Button链式错误:", errors) }
            .log("Button链式配置完成")
        
        // ImageView 基础链式
        imageView = UIImageView()
        contentView.addSubview(imageView)
        imageView.imageChain
            .set(\.image, to: UIImage(systemName: "star.fill"))
            .set(\.tintColor, to: .systemYellow)
            .set(\.contentMode, to: .scaleAspectFit)
            .set(\.backgroundColor, to: .systemGray4)
            .set(\.layer.cornerRadius, to: 8)
            .set(\.clipsToBounds, to: true)
            .onPerformance { metrics in print("ImageView链式性能:", metrics) }
            .onError { errors in print("ImageView链式错误:", errors) }
            .log("ImageView链式配置完成")
        
        // TextField 基础链式
        textField = UITextField()
        contentView.addSubview(textField)
        textField.textFieldChain
            .set(\.text, to: "基础TextField")
            .set(\.placeholder, to: "请输入...")
            .set(\.borderStyle, to: .roundedRect)
            .set(\.font, to: .systemFont(ofSize: 16))
            .set(\.textColor, to: .label)
            .invoke("addTarget", self, #selector(textFieldChanged), UIControl.Event.editingChanged)
            .onPerformance { metrics in print("TextField链式性能:", metrics) }
            .onError { errors in print("TextField链式错误:", errors) }
            .log("TextField链式配置完成")
        
        // Switch 基础链式
        switchControl = UISwitch()
        contentView.addSubview(switchControl)
        switchControl.switchChain
            .set(\.isOn, to: true)
            .set(\.onTintColor, to: .systemBlue)
            .set(\.thumbTintColor, to: .white)
            .invoke("addTarget", self, #selector(switchChanged), UIControl.Event.valueChanged)
            .onPerformance { metrics in print("Switch链式性能:", metrics) }
            .onError { errors in print("Switch链式错误:", errors) }
            .log("Switch链式配置完成")
        
        // Slider 基础链式
        slider = UISlider()
        contentView.addSubview(slider)
        slider.sliderChain
            .set(\.minimumValue, to: 0)
            .set(\.maximumValue, to: 1)
            .set(\.value, to: 0.5)
            .set(\.minimumTrackTintColor, to: .systemBlue)
            .set(\.maximumTrackTintColor, to: .systemGray4)
            .invoke("addTarget", self, #selector(sliderChanged), UIControl.Event.valueChanged)
            .onPerformance { metrics in print("Slider链式性能:", metrics) }
            .onError { errors in print("Slider链式错误:", errors) }
            .log("Slider链式配置完成")
        
        // SegmentedControl 基础链式
        segmentedControl = UISegmentedControl(items: ["A", "B", "C"])
        contentView.addSubview(segmentedControl)
        segmentedControl.segmentChain
            .set(\.selectedSegmentIndex, to: 0)
            .set(\.backgroundColor, to: .systemGray5)
            .set(\.layer.cornerRadius, to: 8)
            .set(\.clipsToBounds, to: true)
            .invoke("addTarget", self, #selector(segmentChanged), UIControl.Event.valueChanged)
            .onPerformance { metrics in print("Segment链式性能:", metrics) }
            .onError { errors in print("Segment链式错误:", errors) }
            .log("Segment链式配置完成")
        
        // View 基础链式
        demoView = UIView()
        contentView.addSubview(demoView)
        demoView.chain
            .set(\.backgroundColor, to: .systemTeal)
            .set(\.layer.cornerRadius, to: 12)
            .set(\.clipsToBounds, to: true)
            .animate(duration: 1.0, options: [.curveEaseInOut], animations: { v in v.alpha = 0.5 }, completion: { _ in })
            .onPerformance { metrics in print("View链式性能:", metrics) }
            .onError { errors in print("View链式错误:", errors) }
            .log("View链式配置完成")
        
        // 设置约束
        setupConstraintsForBasicDemo(titleLabel: titleLabel)
    }
    
    // MARK: - 跨平台便利方法演示
    private func setupCrossPlatformHelperDemo() {
        // 创建标题 - 使用链式调用
        let titleLabel = TFYChainHelper.createLabel { chain in
            return chain
                .set(\.text, to: "=== 跨平台便利方法演示 ===")
                .set(\.font, to: .boldSystemFont(ofSize: 20))
                .set(\.textAlignment, to: .center)
                .set(\.textColor, to: .systemPurple)
                .set(\.translatesAutoresizingMaskIntoConstraints, to: false)
        }
        contentView.addSubview(titleLabel)
        
        // 使用TFYChainHelper.createLabel
        crossPlatformLabel = TFYChainHelper.createLabel { chain in
            return chain
                .set(\.text, to: "跨平台Label创建!")
                .set(\.textColor, to: .systemPurple)
                .set(\.font, to: .boldSystemFont(ofSize: 18))
                .set(\.textAlignment, to: .center)
                .set(\.backgroundColor, to: .systemPurple.withAlphaComponent(0.1))
                .set(\.layer.cornerRadius, to: 8)
                .set(\.clipsToBounds, to: true)
        }
        contentView.addSubview(crossPlatformLabel)
        
        // 使用TFYChainHelper.createButton
        crossPlatformButton = TFYChainHelper.createButton { chain in
            return chain
                .set(\.backgroundColor, to: .systemOrange)
                .set(\.layer.cornerRadius, to: 10)
                .set(\.clipsToBounds, to: true)
                .invoke("setTitle", "跨平台按钮", UIControl.State.normal)
                .invoke("setTitleColor", UIColor.white, UIControl.State.normal)
                .invoke("setFont", UIFont.boldSystemFont(ofSize: 16))
                .invoke("addTarget", self, #selector(crossPlatformButtonTapped), UIControl.Event.touchUpInside)
        }
        contentView.addSubview(crossPlatformButton)
        
        // 使用TFYChainHelper.createImageView
        crossPlatformImageView = TFYChainHelper.createImageView { chain in
            return chain
                .set(\.image, to: UIImage(systemName: "heart.fill"))
                .set(\.tintColor, to: .systemRed)
                .set(\.contentMode, to: .scaleAspectFit)
                .set(\.backgroundColor, to: .systemRed.withAlphaComponent(0.1))
                .set(\.layer.cornerRadius, to: 8)
                .set(\.clipsToBounds, to: true)
        }
        contentView.addSubview(crossPlatformImageView)
        
        // 使用TFYChainHelper.createTextField
        crossPlatformTextField = TFYChainHelper.createTextField { chain in
            return chain
                .set(\.text, to: "跨平台TextField")
                .set(\.placeholder, to: "跨平台输入...")
                .set(\.borderStyle, to: .roundedRect)
                .set(\.font, to: .systemFont(ofSize: 16))
                .set(\.textColor, to: .label)
                .invoke("addTarget", self, #selector(crossPlatformTextFieldChanged), UIControl.Event.editingChanged)
        }
        contentView.addSubview(crossPlatformTextField)
        
        // 使用TFYChainHelper.createScrollView
        crossPlatformScrollView = TFYChainHelper.createScrollView { chain in
            return chain
                .set(\.backgroundColor, to: .systemYellow.withAlphaComponent(0.3))
                .set(\.layer.cornerRadius, to: 8)
                .set(\.clipsToBounds, to: true)
                .set(\.showsVerticalScrollIndicator, to: true)
        }
        contentView.addSubview(crossPlatformScrollView)
        
        // 使用TFYChainHelper.createStackView
        crossPlatformStackView = TFYChainHelper.createStackView { chain in
            return chain
                .set(\.axis, to: .horizontal)
                .set(\.distribution, to: .fillEqually)
                .set(\.spacing, to: 10)
                .set(\.backgroundColor, to: .systemGreen.withAlphaComponent(0.3))
                .set(\.layer.cornerRadius, to: 8)
                .set(\.clipsToBounds, to: true)
        }
        contentView.addSubview(crossPlatformStackView)
        
        // 为StackView添加子视图
        for _ in 0..<3 {
            let subView = UIView()
            subView.backgroundColor = .systemGreen
            subView.layer.cornerRadius = 4
            crossPlatformStackView.addArrangedSubview(subView)
        }
        
        // 设置约束
        setupConstraintsForCrossPlatformDemo(titleLabel: titleLabel)
    }
    
    // MARK: - 批量操作演示
    private func setupBatchOperationsDemo() {
        // 创建标题
        let titleLabel = TFYChainHelper.createLabel { chain in
            return chain
                .set(\.text, to: "=== 批量操作演示 ===")
                .set(\.font, to: .boldSystemFont(ofSize: 20))
                .set(\.textAlignment, to: .center)
                .set(\.textColor, to: .systemIndigo)
                .set(\.translatesAutoresizingMaskIntoConstraints, to: false)
        }
        contentView.addSubview(titleLabel)
        
        // 批量创建按钮 - 使用链式调用
        batchButtons = (0..<3).map { i in
            let btn = TFYChainHelper.createButton { chain in
                return chain
                    .invoke("setTitle", "批量按钮\(i+1)", UIControl.State.normal)
                    .invoke("setTitleColor", UIColor.white, UIControl.State.normal)
                    .invoke("setFont", UIFont.boldSystemFont(ofSize: 14))
                    .set(\.backgroundColor, to: [.systemRed, .systemGreen, .systemBlue][i])
                    .set(\.layer.cornerRadius, to: 8)
                    .set(\.clipsToBounds, to: true)
                    .invoke("addTarget", self, #selector(self.batchButtonTapped(_:)), UIControl.Event.touchUpInside)
            }
            contentView.addSubview(btn)
            return btn
        }
        
        // 批量创建标签 - 使用链式调用
        batchLabels = (0..<3).map { i in
            let label = TFYChainHelper.createLabel { chain in
                let colors: [UIColor] = [.systemOrange, .systemPink, .systemTeal]
                return chain
                    .set(\.text, to: "批量标签\(i+1)")
                    .set(\.textAlignment, to: .center)
                    .set(\.backgroundColor, to: colors[i].withAlphaComponent(0.3))
                    .set(\.layer.cornerRadius, to: 6)
                    .set(\.clipsToBounds, to: true)
            }
            contentView.addSubview(label)
            return label
        }
        
        // 使用TFYChainHelper.batchChain进行批量链式操作
        TFYChainHelper.batchChain(batchButtons) { chain in
            chain.set(\.alpha, to: 0.9)
                .animate(duration: 0.5, options: [], animations: { btn in 
                    btn.alpha = 1.0 
                }, completion: nil)
                .set(\.layer.borderWidth, to: 2.0)
                .set(\.layer.borderColor, to: UIColor.white.cgColor)
        }
        
        // 使用TFYChainHelper.batchChain进行批量标签链式操作
        TFYChainHelper.batchChain(batchLabels) { chain in
            chain.set(\.font, to: UIFont.boldSystemFont(ofSize: 14))
                .set(\.textColor, to: UIColor.systemIndigo)
                .animate(duration: 0.3, options: [], animations: { label in
                    label.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                }, completion: { _ in
                    // 在completion中直接重置transform
                })
        }
        
        // 设置约束
        setupConstraintsForBatchDemo(titleLabel: titleLabel)
    }
    
    // MARK: - 结构体链式演示
    private func setupStructChainDemo() {
        // 创建标题 - 使用链式调用
        let titleLabel = TFYChainHelper.createLabel { chain in
            return chain
                .set(\.text, to: "=== 结构体链式演示 ===")
                .set(\.font, to: .boldSystemFont(ofSize: 20))
                .set(\.textAlignment, to: .center)
                .set(\.textColor, to: .systemBrown)
                .set(\.translatesAutoresizingMaskIntoConstraints, to: false)
        }
        contentView.addSubview(titleLabel)
        
        // 使用TFYChainHelper.structChain创建结构体配置
        let config = TFYChainHelper.structChain(DemoConfig())
            .set(\.title, "结构体链式配置")
            .set(\.color, .systemBrown)
            .set(\.fontSize, 16.0)
            .set(\.isEnabled, true)
            .build
        
        // 创建演示标签 - 使用链式调用
        structDemoLabel = TFYChainHelper.createLabel { chain in
            return chain
                .set(\.text, to: config.title)
                .set(\.textColor, to: config.color)
                .set(\.font, to: .systemFont(ofSize: config.fontSize))
                .set(\.textAlignment, to: .center)
                .set(\.backgroundColor, to: config.color.withAlphaComponent(0.1))
                .set(\.layer.cornerRadius, to: 8)
                .set(\.clipsToBounds, to: true)
                .set(\.isUserInteractionEnabled, to: config.isEnabled)
        }
        contentView.addSubview(structDemoLabel)
        
        // 添加点击手势 - 使用链式调用
        let tap = UITapGestureRecognizer(target: self, action: #selector(structLabelTapped))
        structDemoLabel.addGestureRecognizer(tap)
        
        // 设置约束
        setupConstraintsForStructDemo(titleLabel: titleLabel)
    }
    
    // MARK: - 约束设置方法
    private func setupConstraintsForBasicDemo(titleLabel: UILabel) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        demoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            label.heightAnchor.constraint(equalToConstant: 40),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 40),
            
            imageView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            
            textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            switchControl.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            switchControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            switchControl.heightAnchor.constraint(equalToConstant: 40),
            
            slider.topAnchor.constraint(equalTo: switchControl.bottomAnchor, constant: 10),
            slider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            slider.heightAnchor.constraint(equalToConstant: 40),
            
            segmentedControl.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            
            demoView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            demoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            demoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            demoView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupConstraintsForCrossPlatformDemo(titleLabel: UILabel) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        crossPlatformLabel.translatesAutoresizingMaskIntoConstraints = false
        crossPlatformButton.translatesAutoresizingMaskIntoConstraints = false
        crossPlatformImageView.translatesAutoresizingMaskIntoConstraints = false
        crossPlatformTextField.translatesAutoresizingMaskIntoConstraints = false
        crossPlatformScrollView.translatesAutoresizingMaskIntoConstraints = false
        crossPlatformStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: demoView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            crossPlatformLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            crossPlatformLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            crossPlatformLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            crossPlatformLabel.heightAnchor.constraint(equalToConstant: 40),
            
            crossPlatformButton.topAnchor.constraint(equalTo: crossPlatformLabel.bottomAnchor, constant: 10),
            crossPlatformButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            crossPlatformButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            crossPlatformButton.heightAnchor.constraint(equalToConstant: 40),
            
            crossPlatformImageView.topAnchor.constraint(equalTo: crossPlatformButton.bottomAnchor, constant: 10),
            crossPlatformImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            crossPlatformImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            crossPlatformImageView.heightAnchor.constraint(equalToConstant: 40),
            
            crossPlatformTextField.topAnchor.constraint(equalTo: crossPlatformImageView.bottomAnchor, constant: 10),
            crossPlatformTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            crossPlatformTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            crossPlatformTextField.heightAnchor.constraint(equalToConstant: 40),
            
            crossPlatformScrollView.topAnchor.constraint(equalTo: crossPlatformTextField.bottomAnchor, constant: 10),
            crossPlatformScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            crossPlatformScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            crossPlatformScrollView.heightAnchor.constraint(equalToConstant: 40),
            
            crossPlatformStackView.topAnchor.constraint(equalTo: crossPlatformScrollView.bottomAnchor, constant: 10),
            crossPlatformStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            crossPlatformStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            crossPlatformStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupConstraintsForBatchDemo(titleLabel: UILabel) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 设置批量按钮约束
        for (_, button) in batchButtons.enumerated() {
            button.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 设置批量标签约束
        for (_, label) in batchLabels.enumerated() {
            label.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: crossPlatformStackView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // 批量按钮约束
            batchButtons[0].topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            batchButtons[0].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            batchButtons[0].heightAnchor.constraint(equalToConstant: 40),
            batchButtons[0].widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            
            batchButtons[1].topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            batchButtons[1].centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            batchButtons[1].heightAnchor.constraint(equalToConstant: 40),
            batchButtons[1].widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            
            batchButtons[2].topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            batchButtons[2].trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            batchButtons[2].heightAnchor.constraint(equalToConstant: 40),
            batchButtons[2].widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            
            // 批量标签约束
            batchLabels[0].topAnchor.constraint(equalTo: batchButtons[0].bottomAnchor, constant: 10),
            batchLabels[0].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            batchLabels[0].heightAnchor.constraint(equalToConstant: 30),
            batchLabels[0].widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            
            batchLabels[1].topAnchor.constraint(equalTo: batchButtons[1].bottomAnchor, constant: 10),
            batchLabels[1].centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            batchLabels[1].heightAnchor.constraint(equalToConstant: 30),
            batchLabels[1].widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            
            batchLabels[2].topAnchor.constraint(equalTo: batchButtons[2].bottomAnchor, constant: 10),
            batchLabels[2].trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            batchLabels[2].heightAnchor.constraint(equalToConstant: 30),
            batchLabels[2].widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3)
        ])
    }
    
    private func setupConstraintsForStructDemo(titleLabel: UILabel) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        structDemoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: batchLabels[0].bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            structDemoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            structDemoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            structDemoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            structDemoLabel.heightAnchor.constraint(equalToConstant: 40),
            structDemoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - 事件处理
    @objc private func buttonTapped() { 
        print("基础按钮被点击") 
    }
    
    @objc private func crossPlatformButtonTapped() { 
        print("跨平台按钮被点击") 
    }
    
    @objc private func batchButtonTapped(_ sender: UIButton) { 
        if let index = batchButtons.firstIndex(of: sender) {
            print("批量按钮\(index + 1)被点击")
        }
    }
    
    @objc private func textFieldChanged() { 
        print("基础TextField内容变化:", textField.text ?? "") 
    }
    
    @objc private func crossPlatformTextFieldChanged() { 
        print("跨平台TextField内容变化:", crossPlatformTextField.text ?? "") 
    }
    
    @objc private func switchChanged() { 
        print("Switch状态:", switchControl.isOn) 
    }
    
    @objc private func sliderChanged() { 
        print("Slider值:", slider.value) 
    }
    
    @objc private func segmentChanged() { 
        print("Segment选中:", segmentedControl.selectedSegmentIndex) 
    }
    
    @objc private func structLabelTapped() { 
        print("结构体链式标签被点击")
        // 动态更新配置
        let newConfig = TFYChainHelper.structChain(DemoConfig())
            .set(\.title, "点击后更新!")
            .set(\.color, .systemRed)
            .set(\.fontSize, 18.0)
            .build
        
        structDemoLabel.text = newConfig.title
        structDemoLabel.textColor = newConfig.color
        structDemoLabel.font = .systemFont(ofSize: newConfig.fontSize)
    }
    
    // MARK: - 点击空白收起键盘
    private func setupKeyboardDismissGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
    
