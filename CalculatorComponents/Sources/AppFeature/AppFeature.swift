
import SwiftUI
import ComposableArchitecture
import CalculatorViews
import CalculatorBrain

public struct AppFeature {
    
    public init() {}
    
}

public extension AppFeature {
    
    struct State: Equatable {
        public init() {}
        var display: String = "0"
        let brain = CalculatorBrain()
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

extension CalculatorBrain: Equatable {
    public static func == (lhs: CalculatorBrain, rhs: CalculatorBrain) -> Bool {
        lhs === rhs
    }
}

extension AppFeature: ReducerProtocol {
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .clear:
                let result = state.brain.tapped(.clear)
                display(result, in: &state)
                return .none
            case .dot:
                let result = state.brain.tapped(.dot)
                display(result, in: &state)
                if !state.display.contains(".") {
                    state.display += "."
                }
                return .none
            case .plusMinus:
                let result = state.brain.tapped(.plusMinus)
                display(result, in: &state)
                return .none
            case .percent:
                let result = state.brain.tapped(.percent)
                display(result, in: &state)
                return .none
            case .equal:
                let result = state.brain.tapped(.equals)
                display(result, in: &state)
                return .none
            case .plus:
                let result = state.brain.tapped(operation: .plus)
                display(result, in: &state)
                return .none
            case .onNumber(let number):
                guard (0...9).contains(number) else {
                    assertionFailure("This should be possible")
                    return .none
                }
                guard state.display.filter({ char in char.isNumber }).count <= 9 else {
                    return .none
                }
                let result = state.brain.tapped(number: number)
                display(result, in: &state)
                return .none
            case .minus:
                let result = state.brain.tapped(operation: .minus)
                display(result, in: &state)
                return .none
            case .multiply:
                let result = state.brain.tapped(operation: .multiply)
                display(result, in: &state)
                return .none
            case .divide:
                let result = state.brain.tapped(operation: .divide)
                display(result, in: &state)
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
            display: viewStore.state.display,
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


extension Double {
    var isEquivalentToInteger: Bool {
        if self == Double(Int(self)) {
            return true
        } else {
            return false
        }
    }
}

extension AppFeature {
    func display(_ number: Double, in state: inout State) {
        if number.isEquivalentToInteger, state.brain.numberOfTrailingZeroes == 0 {
            state.display = Int(number).delimited
        } else {
            var result = number.delimited
            
            if result.contains(".") {
                result += String(repeating: "0", count: state.brain.numberOfTrailingZeroes)
            } else {
                result += "."
                result += String(repeating: "0", count: state.brain.numberOfTrailingZeroes)
            }

            state.display = result
        }
    }
}


//    here we formatted the number and add "," to a String of numbers (for instance: 999,999,999) - this extenshion is if the number is Double
extension Double {
    
    
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 9
        numberFormatter.roundingMode = .floor

        return numberFormatter
    }()
    
    var delimited: String {
        return Double.numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

// and this extension is if the number is a hole Int.
extension Int {
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 9
        numberFormatter.roundingMode = .floor
        
        return numberFormatter
    }()
    
    var delimited: String {
        return Int.numberFormatter.string(from: NSNumber(value: self)) ?? ""
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

