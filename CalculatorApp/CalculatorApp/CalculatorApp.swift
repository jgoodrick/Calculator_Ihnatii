
import SwiftUI
import ComposableArchitecture

@main
struct CalculatorApp: App {
    
    let store = Store(initialState: AppFeature.State(), reducer: AppFeature())
        
    var body: some Scene {
        WindowGroup {
            AppView(store: store)
        }
    }
}

struct AppFeature: ReducerProtocol {
    
}

extension AppFeature {
    struct State: Equatable {
        
    }
    enum Action: Equatable {
        
    }
    
    var body: some ReducerProtocol<State, Action> {
        EmptyReducer()
    }
}

struct AppView: View {
    
    let store: StoreOf<AppFeature>
    @ObservedObject var viewStore: ViewStoreOf<AppFeature>
    
    init(store: StoreOf<AppFeature>) {
        self.store = store
        self.viewStore = ViewStore(store)
    }
    
    var body: some View {
        Color.green
    }
}
