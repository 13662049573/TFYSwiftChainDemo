# 🚀 TFYEnhancedRuntimeChainSystem

[![Swift 5.0+](https://img.shields.io/badge/Swift-5.0+-orange.svg)](https://swift.org)
[![iOS 16.0+](https://img.shields.io/badge/iOS-16.0+-blue.svg)](https://developer.apple.com/ios/)
[![macOS 13.0+](https://img.shields.io/badge/macOS-13.0+-green.svg)](https://developer.apple.com/macos/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen.svg)]()

> **革命性的跨平台链式编程框架** - 支持 iOS、macOS，让你的代码更简洁、更安全、更高效！

## ✨ 核心特性

### 🎯 **类型安全的 KeyPath 自动补全**
```swift
// ✅ 完美的自动补全体验
label.labelChain
    .set(\.text, to: "Hello World")           // 🔥 输入 \.tex 自动提示 text
    .set(\.textColor, to: .systemBlue)        // 🔥 输入 \.tex 自动提示 textColor  
    .set(\.backgroundColor, to: .systemGray6) // 🔥 输入 \.bac 自动提示 backgroundColor
```

### 🚄 **智能 LRU 缓存系统**
```swift
// 自动缓存属性和方法信息，大幅提升性能
let stats = TFYRuntimeUtils.getDetailedCacheStats()
print("缓存利用率: \(stats["propertyUtilization"])%")
```

### 🎨 **强大的动画链式支持**
```swift
view.chain
    .animate(duration: 0.3) { $0.alpha = 0.5 }
    .animateSpring(duration: 0.5, damping: 0.7) { 
        $0.transform = CGAffineTransform(scaleX: 1.2, y: 1.2) 
    }
    .delay(1.0) { $0.backgroundColor = .systemRed }
```

### 🔧 **智能约束链式支持**
```swift
subview.chain
    .centerIn(parentView)
    .size(width: 200, height: 100)
    .fillSuperview(parentView, insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
```

### 📊 **实时性能监控**
```swift
button.buttonChain
    .enablePerformanceMonitoring()
    .set(\.backgroundColor, to: .systemBlue)
    .onPerformance { metrics in
        print("操作耗时: \(metrics)ms")
    }
```

### 🛡️ **智能错误恢复**
```swift
label.labelChain
    .set("nonExistentProperty", "value")  // 会产生错误
    .recover { errors, object in
        return object.labelChain.set(\.text, to: "恢复后的文本")
    }
    .fallback { $0.labelChain.set(\.textColor, to: .systemRed) }
```

---

## 🎪 **支持的跨平台组件全家桶**

### 📱 **iOS 组件**

| 🏗️ **基础组件** | 📝 **输入组件** | 🎛️ **控制组件** | 📊 **显示组件** |
|---|---|---|---|
| `UIView(.chain)` | `UITextField(.textFieldChain)` | `UIButton(.buttonChain)` | `UIProgressView(.progressChain)` |
| `UILabel(.labelChain)` | `UITextView(.textViewChain)` | `UISlider(.sliderChain)` | `UIActivityIndicatorView(.activityIndicatorChain)` |
| `UIImageView(.imageChain)` | `UISearchBar(.searchBarChain)` | `UISwitch(.switchChain)` | `UIPageControl(.pageControlChain)` |
| `UIStackView(.stackChain)` | - | `UISegmentedControl(.segmentChain)` | `UIPickerView(.pickerChain)` |

| 🎭 **容器组件** | 🎯 **手势识别** | 🚀 **高级组件** |
|---|---|---|
| `UIScrollView(.scrollChain)` | `UITapGestureRecognizer(.tapGestureChain)` | `UIViewController(.viewControllerChain)` |
| `UITableView(.tableChain)` | `UIPanGestureRecognizer(.panGestureChain)` | `UIWindow(.windowChain)` |  
| `UICollectionView(.collectionChain)` | `UILongPressGestureRecognizer(.longPressGestureChain)` | `CALayer(.layerChain)` |

### 🖥️ **macOS 独有组件**

| 🏗️ **基础组件** | 📝 **输入组件** | 🎛️ **控制组件** | 📊 **显示组件** |
|---|---|---|---|
| `NSView(.nsViewChain)` | `NSTextField(.nsTextFieldChain)` | `NSButton(.nsButtonChain)` | `NSProgressIndicator(.nsProgressChain)` |
| `NSImageView(.nsImageViewChain)` | `NSTextView(.nsTextViewChain)` | `NSSlider(.nsSliderChain)` | `NSLevelIndicator(.levelIndicatorChain)` |
| `NSBox(.boxChain)` | `NSSearchField(.searchFieldChain)` | `NSSegmentedControl(.nsSegmentChain)` | `NSDatePicker(.nsDatePickerChain)` |
| `NSStackView(.nsStackChain)` | `NSSecureTextField(.secureTextFieldChain)` | `NSPopUpButton(.popUpButtonChain)` | `NSColorWell(.colorWellChain)` |

| 🎭 **容器组件** | 🎯 **手势识别** | 🚀 **高级组件** |
|---|---|---|
| `NSScrollView(.nsScrollViewChain)` | `NSClickGestureRecognizer(.clickGestureChain)` | `NSViewController(.nsViewControllerChain)` |
| `NSTableView(.nsTableViewChain)` | `NSPanGestureRecognizer(.nsPanGestureChain)` | `NSWindow(.nsWindowChain)` |
| `NSOutlineView(.outlineViewChain)` | `NSMagnificationGestureRecognizer(.magnificationGestureChain)` | `NSWindowController(.windowControllerChain)` |
| `NSSplitView(.splitViewChain)` | `NSRotationGestureRecognizer(.nsRotationGestureRecognizer)` | `NSVisualEffectView(.nsVisualEffectViewChain)` |

---

## 🚀 **快速开始**

### 1️⃣ **基础属性设置 (跨平台)**

#### 📱 **iOS 版本**
```swift
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        
        // 🔥 链式设置，一气呵成
        titleLabel.labelChain
            .set(\.text, to: "欢迎使用 TFYChain!")
            .set(\.textColor, to: .systemBlue)
            .set(\.font, to: .boldSystemFont(ofSize: 24))
            .set(\.textAlignment, to: .center)
            .set(\.backgroundColor, to: .systemGray6)
            .set(\.layer.cornerRadius, to: 12.0)
            .set(\.clipsToBounds, to: true)
    }
}
```

#### 🖥️ **macOS 版本**
```swift
import AppKit

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = NSTextField()
        view.addSubview(titleLabel)
        
        // 🔥 同样简洁的链式设置，自动适配 macOS
        titleLabel.nsTextFieldChain
            .set(\.stringValue, to: "欢迎使用 TFYChain!")
            .set(\.textColor, to: .systemBlue)
            .set(\.font, to: .boldSystemFont(ofSize: 24))
            .set(\.alignment, to: .center)
            .set(\.backgroundColor, to: .controlBackgroundColor)
            .set(\.layer?.cornerRadius, to: 12.0)
            .set(\.isEditable, to: false)
            .set(\.isSelectable, to: false)
            .set(\.drawsBackground, to: true)
    }
}
```

#### 🌐 **跨平台通用版本**
```swift
#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

class PlatformViewController: PlatformViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = TFYChainHelper.createLabel { chain in
            return chain
                .set(\.text, to: "跨平台链式调用!")  // 自动适配不同平台的属性
                .set(\.textColor, to: .systemBlue)
                .set(\.font, to: .boldSystemFont(ofSize: 24))
        }
        
        view.addSubview(titleLabel)
    }
}
```

### 2️⃣ **条件链式操作**
```swift
let isDarkMode = traitCollection.userInterfaceStyle == .dark

button.buttonChain
    .setIf(isDarkMode, \.backgroundColor, to: .systemGray)
    .setIf(!isDarkMode, \.backgroundColor, to: .systemBlue)
    .when(shouldAnimate) { $0.alpha = 0.8 }
```

### 3️⃣ **批量操作**
```swift
let labels = [label1, label2, label3]

// 批量设置相同属性
TFYChainHelper.batchSet(labels, \.textColor, to: .systemRed)

// 批量链式操作
TFYChainHelper.batchChain(labels) { chain in
    return chain
        .set(\.font, to: .systemFont(ofSize: 16))
        .set(\.textAlignment, to: .center)
        .animate(duration: 0.3) { $0.alpha = 1.0 }
}
```

### 4️⃣ **高级错误处理**
```swift
textField.textFieldChain
    .set("invalidProperty", "value")  // 故意的错误
    .onError { errors in
        print("发现 \(errors.count) 个错误")
        for error in errors {
            print("- \(error)")
        }
    }
    .fallback { field in
        // 降级处理
        return field.textFieldChain
            .set(\.placeholder, to: "出错了，使用默认设置")
            .set(\.borderStyle, to: .roundedRect)
    }
```

### 5️⃣ **性能监控与分析**
```swift
complexView.chain
    .enablePerformanceMonitoring()
    .set(\.backgroundColor, to: .systemOrange)
    .set(\.layer.shadowColor, to: UIColor.black.cgColor)
    .set(\.layer.shadowOffset, to: CGSize(width: 2, height: 2))
    .set(\.layer.shadowOpacity, to: 0.3)
    .onPerformance { metrics in
        print("📊 性能报告:")
        for (operation, time) in metrics {
            print("  - \(operation): \(time * 1000)ms")
        }
    }
    .validate()  // 生成详细的性能分析报告
```

---

## 🎯 **核心优势**

| 🚀 **特性** | 🔥 **传统方式** | ✨ **TFYChain 方式** |
|---|---|---|
| **代码行数** | 10+ 行分散设置 | 1 个流畅链式调用 |
| **类型安全** | 运行时崩溃风险 | 编译时类型检查 |
| **自动补全** | 需要记忆属性名 | 智能 KeyPath 提示 |
| **性能监控** | 手动埋点统计 | 自动性能分析 |
| **错误处理** | 分散的 try-catch | 统一错误恢复机制 |
| **缓存优化** | 无缓存机制 | 智能 LRU 缓存 |

---

## 🛠️ **高级功能示例**

### 🎬 **复杂动画序列**
```swift
animationView.chain
    .animate(duration: 0.5) { view in
        view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        view.alpha = 0.8
    }
    .delay(0.2) { _ in
        print("第一阶段动画完成")
    }
    .animateSpring(duration: 0.8, damping: 0.6) { view in
        view.transform = .identity
        view.backgroundColor = .systemGreen
    }
    .async(.global(qos: .background)) { view in
        // 后台处理
        Thread.sleep(forTimeInterval: 1.0)
        DispatchQueue.main.async {
            print("动画序列全部完成!")
        }
    }
```

### 🔄 **智能重试机制**  
```swift
networkButton.buttonChain
    .retry(maxAttempts: 3, delay: 0.5) { button in
        // 模拟网络请求
        let success = NetworkManager.shared.attemptConnection()
        if success {
            button.setTitle("连接成功", for: .normal)
            button.backgroundColor = .systemGreen
        }
        return success
    }
    .onError { errors in
        print("重试失败: \(errors)")
    }
```

### 📐 **智能约束布局**
```swift
contentView.chain
    .addConstraints { view in
        [
            view.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            view.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            view.widthAnchor.constraint(lessThanOrEqualTo: parentView.widthAnchor, multiplier: 0.8)
        ]
    }
    .size(height: 200)  // 固定高度
    .animate(duration: 0.3) { $0.alpha = 1.0 }
```

### 🧬 **结构体链式支持**
```swift
struct UserProfile {
    var name: String = ""
    var age: Int = 0
    var email: String = ""
    var isVIP: Bool = false
}

let profile = TFYChainHelper.structChain(UserProfile())
    .set(\.name, "张三")
    .set(\.age, 25)
    .set(\.email, "zhangsan@example.com")
    .setIf(isPremiumUser, \.isVIP, true)
    .build

print("用户资料: \(profile)")
```

---

## 📊 **性能基准测试**

```swift
// 性能对比测试
let label = UILabel()

// 传统方式
let start1 = CFAbsoluteTimeGetCurrent()
label.text = "测试文本"
label.textColor = .systemBlue
label.backgroundColor = .systemGray6
label.font = .boldSystemFont(ofSize: 16)
label.textAlignment = .center
let time1 = CFAbsoluteTimeGetCurrent() - start1

// TFYChain 方式
let start2 = CFAbsoluteTimeGetCurrent()
label.labelChain
    .set(\.text, to: "测试文本")
    .set(\.textColor, to: .systemBlue)
    .set(\.backgroundColor, to: .systemGray6)
    .set(\.font, to: .boldSystemFont(ofSize: 16))
    .set(\.textAlignment, to: .center)
let time2 = CFAbsoluteTimeGetCurrent() - start2

print("传统方式: \(time1 * 1000)ms")
print("TFYChain: \(time2 * 1000)ms")
print("性能提升: \((time1 - time2) / time1 * 100)%")
```

---

## 🎨 **最佳实践**

### ✅ **推荐用法**
```swift
// 🔥 使用 KeyPath 获得类型安全和自动补全
label.labelChain
    .set(\.text, to: "Hello")
    .set(\.textColor, to: .systemBlue)

// 🔥 合理使用条件设置
button.buttonChain
    .setIf(isEnabled, \.isEnabled, true)
    .setIf(shouldHighlight, \.backgroundColor, to: .systemRed)

// 🔥 善用错误恢复机制
view.chain
    .set("possiblyInvalidProperty", value)
    .fallback { $0.chain.set(\.backgroundColor, to: .systemGray) }
```

### ❌ **避免的用法**
```swift
// ❌ 过度链式调用影响可读性
label.labelChain.set(\.text, to: "A").set(\.textColor, to: .red).set(\.font, to: .systemFont(ofSize: 12)).set(\.backgroundColor, to: .blue).set(\.textAlignment, to: .center).set(\.numberOfLines, to: 0)

// ❌ 在性能敏感场景中过度使用性能监控
for _ in 0..<1000 {
    label.labelChain.enablePerformanceMonitoring().set(\.text, to: "test")
}
```

---

## 🍎 **macOS 平台特色功能**

### 🖥️ **macOS 独有组件支持**
```swift
import AppKit

// 🎨 颜色选择器
let colorWell = NSColorWell()
colorWell.colorWellChain
    .set(\.color, to: .systemBlue)
    .set(\.isBordered, to: true)
    .animate(duration: 0.3) { $0.alphaValue = 0.8 }

// 📝 弹出按钮菜单
let popUpButton = NSPopUpButton()
popUpButton.popUpButtonChain
    .set(\.pullsDown, to: false)
    .invoke("addItem", withTitle: "选项 1")
    .invoke("addItem", withTitle: "选项 2")
    .set(\.selectedIndex, to: 0)

// 📊 等级指示器
let levelIndicator = NSLevelIndicator()
levelIndicator.levelIndicatorChain
    .set(\.levelIndicatorStyle, to: .continuousCapacity)
    .set(\.minValue, to: 0.0)
    .set(\.maxValue, to: 100.0)
    .set(\.doubleValue, to: 75.0)
    .set(\.warningValue, to: 80.0)
    .set(\.criticalValue, to: 90.0)

// 🗂️ 标签页视图
let tabView = NSTabView()
tabView.tabViewChain
    .set(\.tabViewType, to: .topTabsBezelBorder)
    .set(\.controlSize, to: .regular)
    .animate(duration: 0.5) { $0.alphaValue = 1.0 }
```

### 🎯 **macOS 手势识别增强**
```swift
// 🖱️ 点击手势
let clickGesture = NSClickGestureRecognizer()
clickGesture.clickGestureChain
    .set(\.numberOfClicksRequired, to: 2)  // 双击
    .set(\.delaysPrimaryMouseButtonEvents, to: false)

// 🔍 放大手势
let magnificationGesture = NSMagnificationGestureRecognizer()
magnificationGesture.magnificationGestureChain
    .set(\.magnification, to: 1.0)
    .configure { gesture in
        gesture.target = self
        gesture.action = #selector(handleMagnification(_:))
    }

// 🔄 旋转手势
let rotationGesture = NSRotationGestureRecognizer()
rotationGesture.nsRotationGestureChain
    .set(\.rotation, to: 0.0)
    .set(\.rotationInDegrees, to: 0.0)
```

### 🏗️ **macOS 窗口管理**
```swift
// 🪟 窗口配置
let window = NSWindow()
window.nsWindowChain
    .set(\.title, to: "TFYChain macOS Demo")
    .set(\.styleMask, to: [.titled, .closable, .miniaturizable, .resizable])
    .set(\.isOpaque, to: true)
    .set(\.backgroundColor, to: .windowBackgroundColor)
    .centerIn(NSScreen.main?.visibleFrame ?? .zero)
    .animate(duration: 0.3) { $0.alphaValue = 1.0 }

// 🎛️ 窗口控制器
let windowController = NSWindowController()
windowController.windowControllerChain
    .set(\.shouldCascadeWindows, to: true)
    .set(\.shouldCloseDocument, to: true)
    .configure { controller in
        controller.window = window
        controller.showWindow(nil)
    }
```

---

## 🖥️ macOS 组件链式扩展说明

> **平台统一说明：**
>
> - 所有基础控件（如NSView、NSTextField、NSButton、NSImageView、NSScrollView、NSTextView、NSSlider、NSProgressIndicator、NSSegmentedControl、NSStackView、NSViewController、NSWindow等）已通过Platform别名（如PlatformView、PlatformLabel、PlatformButton等）统一扩展，无需单独nsXXXChain扩展。
> - 你可以直接使用 `label.chain`、`button.buttonChain`、`imageView.imageChain`、`textField.textFieldChain` 等统一API，无论iOS、macOS，全部一致。
> - 只有macOS独有组件（如NSPopUpButton、NSComboBox、NSColorWell、NSDatePicker、NSLevelIndicator、NSPathControl、NSSearchField、NSSecureTextField、NSTableView、NSOutlineView、NSCollectionView、NSBox、NSTabView、NSSplitView、NSVisualEffectView、NSWindowController、NSClickGestureRecognizer、NSMagnificationGestureRecognizer、NSRotationGestureRecognizer、NSPressGestureRecognizer等）才有专属的nsXXXChain扩展。

### 🏗️ macOS基础控件链式用法（与iOS完全统一）

| 组件类型         | 推荐链式用法                  | 说明           |
|----------------|------------------------------|----------------|
| NSView         | `view.chain`                 | PlatformView   |
| NSTextField    | `textField.textFieldChain`   | PlatformTextField/Label |
| NSButton       | `button.buttonChain`         | PlatformButton  |
| NSImageView    | `imageView.imageChain`       | PlatformImageView |
| NSScrollView   | `scrollView.scrollChain`     | PlatformScrollView |
| NSTextView     | `textView.textViewChain`     | PlatformTextView |
| NSSlider       | `slider.sliderChain`         | PlatformSlider  |
| NSProgressIndicator | `progressView.progressChain` | PlatformProgressView |
| NSSegmentedControl | `segment.segmentChain`     | PlatformSegmentedControl |
| NSStackView    | `stackView.stackChain`       | PlatformStackView |
| NSViewController | `controller.viewControllerChain` | PlatformViewController |
| NSWindow       | `window.windowChain`         | PlatformWindow  |

> **说明：** 以上所有基础控件链式用法在iOS、macOS完全一致，开发者只需记忆一套API，极大提升跨平台开发效率。

### 🖥️ macOS独有组件链式用法

| 组件类型         | 推荐链式用法                  |
|----------------|------------------------------|
| NSPopUpButton  | `popUpButton.popUpButtonChain`|
| NSComboBox     | `comboBox.comboBoxChain`      |
| NSColorWell    | `colorWell.colorWellChain`    |
| NSDatePicker   | `datePicker.nsDatePickerChain`|
| NSLevelIndicator | `level.levelIndicatorChain`  |
| NSPathControl  | `pathControl.pathControlChain`|
| NSSearchField  | `searchField.searchFieldChain`|
| NSSecureTextField | `secureTextField.secureTextFieldChain` |
| NSTableView    | `tableView.nsTableViewChain`  |
| NSOutlineView  | `outlineView.outlineViewChain`|
| NSCollectionView | `collectionView.nsCollectionViewChain` |
| NSBox          | `box.boxChain`                |
| NSTabView      | `tabView.tabViewChain`        |
| NSSplitView    | `splitView.splitViewChain`    |
| NSVisualEffectView | `visualEffectView.nsVisualEffectViewChain` |
| NSWindowController | `windowController.windowControllerChain` |
| NSClickGestureRecognizer | `clickGesture.clickGestureChain` |
| NSPanGestureRecognizer | `panGesture.nsPanGestureChain` |
| NSMagnificationGestureRecognizer | `magnificationGesture.magnificationGestureChain` |
| NSRotationGestureRecognizer | `rotationGesture.nsRotationGestureChain` |
| NSPressGestureRecognizer | `pressGesture.pressGestureChain` |

> **温馨提示：** 只有macOS独有组件才有nsXXXChain等专属扩展，其余基础控件全部用Platform别名链式API。

---

## 🔧 **配置选项**

```swift
// 全局性能配置
TFYChainPerformanceConfig.performanceWarningThreshold = 1.0  // 1ms 警告阈值
TFYChainPerformanceConfig.maxCacheSize = 500               // 最大缓存条目
TFYChainPerformanceConfig.cacheEnabled = true              // 启用缓存

// 获取跨平台缓存统计
let stats = TFYRuntimeUtils.getDetailedCacheStats()
print("缓存效率: \(stats["cacheEfficiency"] ?? "unknown")")
print("当前平台: \(stats["platform"] ?? "unknown")")  // 显示 iOS 或 macOS
```

---

## 🤝 **贡献指南**

我们欢迎所有形式的贡献！

1. 🍴 Fork 这个项目
2. 🌟 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 💬 提交你的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 📤 推送到分支 (`git push origin feature/AmazingFeature`)
5. 🔍 创建一个 Pull Request

---

## 📄 **许可证**

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

---

## 🌟 **Star History**

如果这个项目对你有帮助，请给我们一个 ⭐️！

[![Star History Chart](https://api.star-history.com/svg?repos=your-username/TFYSwiftChainDemo&type=Date)](https://star-history.com/#your-username/TFYSwiftChainDemo&Date)

---

## 👥 **作者**

- **AI Assistant** - *初始工作* - [GitHub](https://github.com/13662049573)

---

## 🙏 **致谢**

- 感谢所有为这个项目做出贡献的开发者
- 特别感谢 Swift 社区的链式编程实践经验
- 灵感来源于现代函数式编程范式

---

<div align="center">

**🚀 让 iOS 开发更简单、更优雅！**

[⬆ 回到顶部](#-tfyenhancedruntimechainsystem)

</div> 