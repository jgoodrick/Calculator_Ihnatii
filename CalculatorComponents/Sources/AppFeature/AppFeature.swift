
import SwiftUI
import ComposableArchitecture
import CalculatorViews
import CalculatorСomponent

public struct AppFeature {
    public init() {}
}

public extension AppFeature {
    struct State: Equatable {
        public init() {}
        var display: String = "0"
    }
    
    enum Action: Equatable {
        case onNumber(Int)
        case clear
        case dot
        case plusMinus
        case percent
        case equal
        case plus
        case minus
        case multiply
        case divide
    }
}

extension AppFeature: ReducerProtocol {
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .clear:
                print("tapped clear")
                return .none
            case .dot:
                print("dot is working")
                return .none
            case .plusMinus:
                print("plusMinus is working")
                return .none
            case .percent:
                print("percent is working")
                return .none
            case .equal:
                print("equal is working")
                return .none
            case .plus:
                print("operation is working")
                return .none
            case .onNumber(let number):
                print("\(number)")
                return .none
            case .minus:
                return .none
            case .multiply:
                return .none
            case .divide:
                return .none
            }
        }
    }
}

public struct AppView: View {
    
    let store: StoreOf<AppFeature>
    @ObservedObject var viewStore: ViewStoreOf<AppFeature>
    
    public init(store: StoreOf<AppFeature>) {
        self.store = store
        self.viewStore = ViewStore(store)
    }
    
    public var body: some View {
        MainView(
            buttonsView: ButtonsView(
                onNumber: { number in
                    viewStore.send(.onNumber(number))
                },
                onClear: { viewStore.send(.clear) },
                onPlusMinus: { viewStore.send(.plusMinus) },
                onDot: { viewStore.send(.dot) },
                onPercent: { viewStore.send(.percent) },
                onEqual: { viewStore.send(.equal) },
                onDivide: { viewStore.send(.divide)},
                onMultiply: { viewStore.send(.multiply)},
                onMinus: { viewStore.send(.minus)},
                onPlus: { viewStore.send(.plus)}
            )
        )
    }
}


struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(
            store: .init(
                initialState: .init(),
                reducer: EmptyReducer()
            )
        )
    }
}

