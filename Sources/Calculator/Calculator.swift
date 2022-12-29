
public final class Calculator {
    
    private var lhs: String?
    private var pendingOperation: ArithmeticOperation?
    private var rhs: String?
    
    public init() {}
}

private extension Calculator {
    var lhsAsDouble: Double? {
        guard let lhs else { return nil }
        guard let lhsCastAsADouble = Double(lhs) else { fatalError() }
        return lhsCastAsADouble
    }
    
    var rhsAsDouble: Double? {
        guard let rhs else { return nil }
        guard let rhsCastAsADouble = Double(rhs) else { fatalError() }
        return rhsCastAsADouble
    }
    
    var register: String? {
        get {
            if pendingOperation == nil {
                return lhs
            } else {
                return rhs
            }
        }
        set {
            if pendingOperation == nil {
                lhs = newValue
            } else {
                rhs = newValue
            }
        }
    }
    
    func resolvePendingOperation() {
        switch (lhsAsDouble, pendingOperation, rhsAsDouble) {
        case (.none, _, _), (_, .none, _), (_, _, .none): break
        case (.some(let unwrappedLHS), .some(let pendingOperation), .some(let unwrappedRHS)):
            switch pendingOperation {
            case .plus:
                self.lhs = String(unwrappedLHS + unwrappedRHS)
            case .minus:
                self.lhs = String(unwrappedLHS - unwrappedRHS)
            case .multiply:
                self.lhs = String(unwrappedLHS * unwrappedRHS)
            }
        }
    }

}

public extension Calculator {
    func numberWasTapped(_ number: Int) -> Double {
        guard var unwrappedRegister = register else {
            register = String(number)
            return Double(number)
        }
        unwrappedRegister.append(String(number))
        register = unwrappedRegister
        return lhsAsDouble ?? 0
    }
    
    func clear() -> Double {
        lhs = nil
        return 0
    }
    
    func operationTapped(_ operation: ArithmeticOperation) -> Double {
        
        resolvePendingOperation()
        
        guard lhs != nil else { return 0 }
        pendingOperation = operation
        return lhsAsDouble ?? 0
    }
    
    enum ArithmeticOperation {
        case plus
        case minus
        case multiply
    }
    
    func tappedEquals() -> Double {
        resolvePendingOperation()
        
        return lhsAsDouble ?? 0.0
    }
}
