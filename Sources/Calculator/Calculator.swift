
public final class Calculator {
    
    private var lhs: String?
    private var pendingOperation: ArithmeticOperation? // optional, because it could be activated or it could be not
    private var rhs: String?
    private var dotIsPending: Bool = false
    
    public init() {}
    
}

private extension Calculator {
    // In order to work with functions inside extention Calculator we need to change lhs as a String to a Double(optional).
    var lhsAsDouble: Double? {
        //This code represents that only if there is something in lhs, than we procced further, or else - just show nil (or we specificly pointed out in operationTapped that lhs that stored nil is stored 0, as a String
        guard let lhs else { return nil }
        // In this code we assinged lhs which we wrapped as a Double to new property, called "lhsCastAsADouble", and told the code that either it a Double, or if it's not - than return Error
        guard let lhsCastAsADouble = Double(lhs) else { fatalError() }
        return lhsCastAsADouble
    }
    
    var rhsAsDouble: Double? {
        // Same as with lhs
        guard let rhs else { return nil }
        guard let rhsCastAsADouble = Double(rhs) else { fatalError() }
        return rhsCastAsADouble
    }
    
    var register: String? {
        //This code represents that if there if no pendingOperations (plus, minus etc) than continue to work with lhs, else - if there is already some pending Operations - then all further numbers that will be tapped, will be stored in rhs
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
            case .divide:
                self.lhs = String(unwrappedLHS / unwrappedRHS)
            }
        }
    }
    
    var shouldPrependDot: Bool {
        guard dotIsPending else { return false } // guard tells us that only if "dotIsPending" equals falls - we need to go further with this function, else - we need to stop (return false)
        guard let register = register else {
            return true //
        }
        return !register.contains(".")
    }
}

public extension Calculator {
    
    
    func numberWasTapped(_ tappedInteger: Int) -> Double {
        //This code tell us that we take number that was tapped and change it's type from Int to String, and than store it in new property - displayNumber
        var displayNumber = String(tappedInteger)
        
        if shouldPrependDot {
            // Because now we have displayNumber as a String, we could add "." as a String to displayNumber and than store it together in that displayNumber
            displayNumber = "." + displayNumber
        }
        //This code tells us that if there is something in register (some Integer) then procced further and avoid "else" statement, else - than put in register those tapped Number (wrapped as a String and than returned as a Double Type)
        guard var unwrappedRegister = register else {
            register = displayNumber
            return Double(tappedInteger)
        }
        //If the condition of the "guard" statement is true, than append new number that was tapped to register, and store it in "lhsAsDouble"
        unwrappedRegister.append(displayNumber)
        register = unwrappedRegister
        return lhsAsDouble ?? 0
    }
    
    func clear() -> Double {
        lhs = nil
        return 0
    }
    
    func tappedDot() -> Double {
        if register == nil {
            register = "0"
        }
        //If the condition of Bool statement is true - than take first element ($0) and if it some number - than unwrapped it as Double, or return 0 if it no numbers, and than - unwrapped it in register as String.
        dotIsPending = true
        return register.map({Double($0) ?? 0}) ?? 0
    }
    
    func operationTapped(_ operation: ArithmeticOperation) -> Double {
        
        resolvePendingOperation()
        
//        guard lhs != nil else { return 0 } In this code we just say that if LHS in not nil of nothing - than show us the value or if it's nil, just show us 0 (but the value inside of lhs is still nil)
        
        // Here we telling that if lhs (left side of equation) is nil or nothing at all, than we should treat lhs as lhs with a value of 0. And is it displayed as a String because lhs is the tipe of String
        
        if lhs == nil {
            lhs = "0"
        }
        
        pendingOperation = operation
        //Here we must return lhsAsDouble because when we tapped new operation and if all conditions is matched in "resolvePendingOperaion" (wich is number in lhs, pending operation and tapped number in rhs), that by tipping new operation we automaticly resolve the operarion and store new value (new number) in lhsAsDouble and would show it as final number in view
        return lhsAsDouble ?? 0
    }
    
    enum ArithmeticOperation {
        case plus
        case minus
        case multiply
        case divide
    }
    
    func tappedEquals() -> Double {
        //This code must resolve the operation and retur the result that stored in lhsAsDouble (or - returned 0 if something goes wrong)
        resolvePendingOperation()
        
        return lhsAsDouble ?? 0.0
    }
}

private extension Double {
    func forDisplay() -> String {
        String(self)
    }
}



