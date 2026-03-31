# SwiftUI macOS ProgressView 进度条

## 简介

演示 SwiftUI 中 ProgressView 的用法，用于显示进度或加载状态。

## 快速开始

```bash
cd swiftui-macos-progress-demo
xcodegen generate
open SwiftUIProgressDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 确定进度

```swift
ProgressView(value: progress)  // 0.0 到 1.0
```

### 不确定进度

```swift
ProgressView("加载中...")
```

### 样式

```swift
.progressViewStyle(.linear)   // 线性
.progressViewStyle(.circular) // 圆形
```

## 完整示例

```swift
struct ContentView: View {
    @State private var progress = 0.5

    var body: some View {
        VStack {
            Text("进度: \(Int(progress * 100))%")
            ProgressView(value: progress)
        }
    }
}
```

## 完整讲解（中文）

### 确定 vs 不确定

- **确定进度**：知道总进度，用 `value` 参数
- **不确定进度**：不知道要多久，只显示动画

### 使用场景

- 文件下载进度
- 上传进度
- 任务完成百分比
- 加载状态指示
