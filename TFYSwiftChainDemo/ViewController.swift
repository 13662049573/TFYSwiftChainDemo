//
//  ViewController.swift
//  TFYSwiftChainDemo
//
//  Created by AI Assistant on 2024/12/19.
//  用途：链式系统演示，每种控件只展示一个，集中演示所有链式能力
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI 组件
    private let scrollView = PlatformScrollView()
    private let contentView = PlatformView()
    
    // 各控件区块
    private let label = PlatformLabel()
    private let button = PlatformButton(type: .system)
    private let imageView = PlatformImageView()
    private let textField = PlatformTextField()
    private let switchControl = PlatformSwitch()
    private let slider = PlatformSlider()
    private let segmentedControl = PlatformSegmentedControl(items: ["A", "B", "C"])
    private let demoView = PlatformView()
    
    // 批量演示用
    private var batchButtons: [PlatformButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupDemoSections()
        // 这里不需要再调用 layoutAllSections
        setupKeyboardDismissGesture()
    }
    
    // MARK: - 滚动视图与内容视图
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.scrollChain
            .set(\.translatesAutoresizingMaskIntoConstraints, to: true)
            .set(\.backgroundColor, to: .systemBackground)
            .set(\.showsVerticalScrollIndicator, to: true)
        contentView.chain
            .set(\.translatesAutoresizingMaskIntoConstraints, to: true)
            .set(\.backgroundColor, to: .systemGray6)
    }
    
    // MARK: - 各控件区块链式演示
    private func setupDemoSections() {
        // Label
        contentView.addSubview(label)
        label.labelChain
            .set(\.text, to: "链式Label演示")
            .set(\.textColor, to: .systemBlue)
            .set(\.font, to: .boldSystemFont(ofSize: 22))
            .set(\.textAlignment, to: .center)
            .set(\.backgroundColor, to: .systemGray5)
            .set(\.layer.cornerRadius, to: 8)
            .set(\.clipsToBounds, to: true)
            .onPerformance { metrics in print("Label链式性能:", metrics) }
            .onError { errors in print("Label链式错误:", errors) }
            .log("Label链式配置完成")
        
        // Button
        contentView.addSubview(button)
        button.buttonChain
            .set(\.backgroundColor, to: .systemGreen)
            .set(\.layer.cornerRadius, to: 10)
            .set(\.clipsToBounds, to: true)
            .invoke("setTitle", "链式按钮", PlatformControlState.normal)
            .invoke("setTitleColor", UIColor.white, PlatformControlState.normal)
            .invoke("addTarget", self, #selector(buttonTapped), PlatformControlEvent.touchUpInside)
            .animate(duration: 0.8, options: [.curveEaseInOut], animations: { btn in btn.alpha = 0.7 }, completion: { _ in })
            .onPerformance { metrics in print("Button链式性能:", metrics) }
            .onError { errors in print("Button链式错误:", errors) }
            .log("Button链式配置完成")
        
        // ImageView
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
        
        // TextField
        contentView.addSubview(textField)
        textField.textFieldChain
            .set(\.text, to: "链式TextField")
            .set(\.placeholder, to: "请输入...")
            .set(\.borderStyle, to: .roundedRect)
            .set(\.font, to: .systemFont(ofSize: 16))
            .set(\.textColor, to: .label)
            .invoke("addTarget", self, #selector(textFieldChanged), PlatformControlEvent.editingChanged)
            .onPerformance { metrics in print("TextField链式性能:", metrics) }
            .onError { errors in print("TextField链式错误:", errors) }
            .log("TextField链式配置完成")
        
        // Switch
        contentView.addSubview(switchControl)
        switchControl.switchChain
            .set(\.isOn, to: true)
            .set(\.onTintColor, to: .systemBlue)
            .set(\.thumbTintColor, to: .white)
            .invoke("addTarget", self, #selector(switchChanged), PlatformControlEvent.valueChanged)
            .onPerformance { metrics in print("Switch链式性能:", metrics) }
            .onError { errors in print("Switch链式错误:", errors) }
            .log("Switch链式配置完成")
        
        // Slider
        contentView.addSubview(slider)
        slider.sliderChain
            .set(\.minimumValue, to: 0)
            .set(\.maximumValue, to: 1)
            .set(\.value, to: 0.5)
            .set(\.minimumTrackTintColor, to: .systemBlue)
            .set(\.maximumTrackTintColor, to: .systemGray4)
            .invoke("addTarget", self, #selector(sliderChanged), PlatformControlEvent.valueChanged)
            .onPerformance { metrics in print("Slider链式性能:", metrics) }
            .onError { errors in print("Slider链式错误:", errors) }
            .log("Slider链式配置完成")
        
        // SegmentedControl
        contentView.addSubview(segmentedControl)
        segmentedControl.segmentChain
            .set(\.selectedSegmentIndex, to: 0)
            .set(\.backgroundColor, to: .systemGray5)
            .set(\.layer.cornerRadius, to: 8)
            .set(\.clipsToBounds, to: true)
            .invoke("addTarget", self, #selector(segmentChanged), PlatformControlEvent.valueChanged)
            .onPerformance { metrics in print("Segment链式性能:", metrics) }
            .onError { errors in print("Segment链式错误:", errors) }
            .log("Segment链式配置完成")
        
        // View
        contentView.addSubview(demoView)
        demoView.chain
            .set(\.backgroundColor, to: .systemTeal)
            .set(\.layer.cornerRadius, to: 12)
            .set(\.clipsToBounds, to: true)
            .animate(duration: 1.0, options: [.curveEaseInOut], animations: { v in v.alpha = 0.5 }, completion: { _ in })
            .onPerformance { metrics in print("View链式性能:", metrics) }
            .onError { errors in print("View链式错误:", errors) }
            .log("View链式配置完成")
        
        // 批量演示
        batchButtons = (0..<3).map { i in
            let btn = PlatformButton(type: .system)
            contentView.addSubview(btn)
            btn.buttonChain
                .set(\.backgroundColor, to: [.systemRed, .systemGreen, .systemBlue][i])
                .set(\.layer.cornerRadius, to: 8)
                .invoke("setTitle", "批量按钮\(i+1)", PlatformControlState.normal)
            return btn
        }
        TFYChainHelper.batchChain(batchButtons) { chain in
            chain.set(\.alpha, to: 0.9)
                .animate(duration: 0.5, options: [], animations: { btn in btn.alpha = 1.0 }, completion: nil)
        }
    }
    
    // MARK: - 布局
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let margin: CGFloat = 20, spacing: CGFloat = 18, width = view.bounds.width - margin*2
        var y: CGFloat = spacing
        for v in [label, button, imageView, textField, switchControl, slider, segmentedControl, demoView] + batchButtons {
            v.frame = CGRect(x: margin, y: y, width: width, height: 48)
            y += 48 + spacing
        }
        contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: y)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: y)
    }
    
    // MARK: - 事件
    @objc private func buttonTapped() { print("按钮被点击") }
    @objc private func textFieldChanged() { print("TextField内容变化:", textField.text ?? "") }
    @objc private func switchChanged() { print("Switch状态:", switchControl.isOn) }
    @objc private func sliderChanged() { print("Slider值:", slider.value) }
    @objc private func segmentChanged() { print("Segment选中:", segmentedControl.selectedSegmentIndex) }
    
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
    
