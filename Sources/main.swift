import Cocoa

@main
struct ProgressApp: App {
    var body: some Scene {
        Window("ProgressView 进度条", id: "main") {
            ContentView()
        }
        .defaultSize(width: 400, height: 400)
    }
}
