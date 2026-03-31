import SwiftUI

struct ContentView: View {
    @State private var progress = 0.3
    @State private var isLoading = false

    var body: some View {
        Form {
            Section("基础进度条") {
                ProgressView(value: progress)
                    .progressViewStyle(.linear)

                ProgressView(value: progress)
                    .progressViewStyle(.circular)
            }

            Section("带标签") {
                VStack(alignment: .leading, spacing: 10) {
                    Text("下载进度")
                    ProgressView(value: progress)
                    Text("\(Int(progress * 100))%")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Section("不确定进度") {
                ProgressView("加载中...")
                    .progressViewStyle(.linear)

                ProgressView()
                    .progressViewStyle(.circular)
            }

            Section("模拟操作") {
                Button(isLoading ? "加载中..." : "开始下载") {
                    simulateDownload()
                }
                .disabled(isLoading)

                if isLoading {
                    VStack(alignment: .leading, spacing: 10) {
                        ProgressView(value: progress)
                        Text("已完成 \(Int(progress * 100))%")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .formStyle(.grouped)
        .padding()
    }

    func simulateDownload() {
        isLoading = true
        progress = 0

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            progress += 0.05
            if progress >= 1.0 {
                timer.invalidate()
                isLoading = false
            }
        }
    }
}
