
import SwiftUI
import ComposableArchitecture
import AppFeature

@main
struct CalculatorApp: App {
    
    let store = Store(
        initialState: AppFeature.State(),
        reducer: AppFeature()
    )
        
    var body: some Scene {
        WindowGroup {
            AppView(store: store)
        }
    }
}

