
import XCTest
@testable import CalculatorBrain

final class CalculatorBrain_Tests: XCTestCase {
    
    func test_initialState_numberWasTapped_returnsThatNumber() {
        for number in 0...9 {
            let calculator = CalculatorBrain()
            let result = calculator.tapped(number: number)
            XCTAssertEqual(result, Double(number))
        }
    }
    
    func test_tapped_5_tapped_6_returns56() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 5)
        let result = calculator.tapped(number: 6)
        XCTAssertEqual(result, 56.0)
    }
    
    func test_tapped_3_tapped_2_tapped_4_returns324() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 3)
        _ = calculator.tapped(number: 2)
        let result = calculator.tapped(number: 4)
        XCTAssertEqual(result, 324)
    }
    
    func test_tapped_2_clear_returnsZero() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 2)
        let result = calculator.tapped(.clear)
        XCTAssertEqual(result, 0)
    }
    
    func test_numberWasTapped_preceededByClear_returnsThatNumber() {
        let calculator = CalculatorBrain()
        for number in 0...9 {
            _ = calculator.tapped(.clear)
            let result = calculator.tapped(number: number)
            XCTAssertEqual(result, Double(number))
        }
    }
    
    func test_tapped_8_tappedClear_tapped_4_returns4() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 8)
        _ = calculator.tapped(.clear)
        let result = calculator.tapped(number: 4)
        XCTAssertEqual(result, 4)
    }
    
    func test_tapped_8_tappedPlus_tapped_8_tappedPlus_returns16() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 8)
        _ = calculator.tapped(operation: .plus)
        _ = calculator.tapped(number: 8)
        let result = calculator.tapped(operation: .plus)
        XCTAssertEqual(result, 16)
    }
    
    func test_tapped_4_tappedPlus_tapped_4_tappedPlus_returns8() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(operation: .plus)
        _ = calculator.tapped(number: 4)
        let result = calculator.tapped(operation: .plus)
        XCTAssertEqual(result, 8)
    }
    
    func test_tapped_4_tappedMinus_tapped_2_tappedMinus_returns2() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(operation: .minus)
        _ = calculator.tapped(number: 2)
        let result = calculator.tapped(operation: .plus)
        XCTAssertEqual(result, 2)
    }
    
    func test_tapped_4_tappedMinus_tapped_6_tappedMinus_returnsNegative2() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(operation: .minus)
        _ = calculator.tapped(number: 6)
        let result = calculator.tapped(operation: .plus)
        XCTAssertEqual(result, -2)
    }
    
    func test_tapped_4_tappedMultiply_tapped_6_tappedMultiply_returns24() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(operation: .multiply)
        _ = calculator.tapped(number: 6)
        let result = calculator.tapped(operation: .multiply)
        XCTAssertEqual(result, 24)
    }
    
    func test_tapped_4_tappedMultiply_tapped_6_tappedEquals_returns24() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(operation: .multiply)
        _ = calculator.tapped(number: 6)
        let result = calculator.tapped(.equals)
        XCTAssertEqual(result, 24.0)
    }
    
    func test_tapped_4_tappedDivide_tapped4_tappedEquals_returns1() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(operation: .divide)
        _ = calculator.tapped(number: 4)
        let result = calculator.tapped(.equals)
        XCTAssertEqual(result, 1)
    }
    
    func test_clearRegister_tappedMinus_tapped5_tappedEquals_returnsNegative5() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(operation: .minus)
        _ = calculator.tapped(number: 5)
        let result = calculator.tapped(.equals)
        XCTAssertEqual(result, -5)
    }
    
    func test_tapped7_tapped2_tappetMinus_tapped1_tapped1_tappedEquals_return61() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 7)
        _ = calculator.tapped(number: 2)
        _ = calculator.tapped(operation: .minus)
        _ = calculator.tapped(number: 1)
        _ = calculator.tapped(number: 1)
        let result = calculator.tapped(.equals)
        XCTAssertEqual(result, 61)
    }
    
    func test_tappedDot_tapped5_retunr0dot5() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(.dot)
        let result = calculator.tapped(number: 5)
        XCTAssertEqual(result, 0.5)
    }
    
    func test_tappedDot_tapped2_tapped2_return0dot22() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(.dot)
        _ = calculator.tapped(number: 2)
        let result = calculator.tapped(number: 2)
        XCTAssertEqual(result, 0.22)
    }
    
    func test_tappedDot_tapped5_tapped5_tappedPlus_tappedDot_tapped1_tapped1_tappedEquals_return0dot66() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(.dot)
        _ = calculator.tapped(number: 5)
        _ = calculator.tapped(number: 5)
        _ = calculator.tapped(operation: .plus)
        _ = calculator.tapped(.dot)
        _ = calculator.tapped(number: 1)
        _ = calculator.tapped(number: 1)
        let result = calculator.tapped(.equals)
        XCTAssertEqual(result, 0.66)
    }
    
    
    func test_tappedEqualsWithInterstitialOperations() {
        let calculator = CalculatorBrain()
        //        XCTAssertEqual(calculator.snapshot, .init())
        _ = calculator.tapped(number: 2)
        //        XCTAssertEqual(calculator.snapshot, .init(lhs: "2"))
        _ = calculator.tapped(operation: .plus)
        //        XCTAssertEqual(calculator.snapshot, .init(lhs: "2", pendingOperation: .plus))
        _ = calculator.tapped(number: 4)
        //        XCTAssertEqual(calculator.snapshot, .init(lhs: "2", pendingOperation: .plus, rhs: "4"))
        _ = calculator.tapped(.equals)
        //        XCTAssertEqual(calculator.snapshot, .init(
        //            lhs: "6",
        //            pendingOperation: nil,
        //            rhs: nil,
        //            dotIsPending: false,
        //            previous: .init(
        //                pendingOperation: .plus,
        //                rhs: "4"
        //            )
        //        ))
        //        XCTAssertEqual(calculator.snapshot.pendingOperation, nil)
        _ = calculator.tapped(.equals)
        _ = calculator.tapped(.equals)
        _ = calculator.tapped(operation: .minus)
        _ = calculator.tapped(number: 5)
        _ = calculator.tapped(.equals)
        _ = calculator.tapped(.equals)
        _ = calculator.tapped(operation: .multiply)
        let result = calculator.tapped(.equals)
        XCTAssertEqual(result, 20)
    }
    
    func test_tapped5_tappedPlus_tappedEqual_tappedEqual_return15() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 5)
        XCTAssertEqual(calculator.snapshot, .init(lhs: "5"))
        _ = calculator.tapped(operation: .plus)
        XCTAssertEqual(calculator.snapshot, .init(lhs: "5", pendingOperation: .plus))
        _ = calculator.tapped(.equals)
        XCTAssertEqual(calculator.snapshot, .init(
            lhs: "10",
            pendingOperation: nil,
            rhs: nil,
            previous: .init(
                pendingOperation: .plus,
                rhs: "5"
            )
        ))
        let result = calculator.tapped(.equals)
        XCTAssertEqual(result, 15)
    }
    
    func test_checkingProperlyChangingTheRHS() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 2)
        _ = calculator.tapped(operation: .plus)
        _ = calculator.tapped(.equals)
        _ = calculator.tapped(.equals)
        _ = calculator.tapped(operation: .minus)
        _ = calculator.tapped(number: 1)
        let result = calculator.tapped(.equals)
        XCTAssertEqual(result, 5)
    }
    
    func test_tappedPlusAndMinus() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(.plusMinus)
        XCTAssertEqual(calculator.snapshot, .init(lhs: "-4"))
        let result = calculator.tapped(number: 4)
        XCTAssertEqual(result, -44)
    }

    func test_tappedPlusAndMinus2() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(operation: .plus)
        _ = calculator.tapped(.plusMinus)
        XCTAssertEqual(calculator.snapshot, .init(lhs: "4", pendingOperation: .plus))
        let result = calculator.tapped(number: 5)
        XCTAssertEqual(result, -5)
    }

    func test_tappedPlusAndMinus_thenTappedDot() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(.plusMinus)
        _ = calculator.tapped(.dot)
        _ = calculator.tapped(number: 5)
        _ = calculator.tapped(number: 6)
        XCTAssertEqual(calculator.snapshot, .init(lhs: "-4.56"))
//        let result = calculator.numberWasTapped(5)
//        XCTAssertEqual(result, -5)
    }
    
    func test_tappedPlus_thenTappedPercent() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(operation: .plus)
        _ = calculator.tapped(.percent)
        XCTAssertEqual(calculator.snapshot, .init(lhs: "0.04", pendingOperation: .plus))
//                let result = calculator.numberWasTapped(5)
//                XCTAssertEqual(result, -5)
    }
    
    func test_tappedDifferentOptions() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 5)
        _ = calculator.tapped(operation: .plus)
        _ = calculator.tapped(number: 3)
        _ = calculator.tapped(operation: .minus)
        _ = calculator.tapped(number: 1)
        _ = calculator.tapped(number: 1)
        _ = calculator.tapped(.equals)
        _ = calculator.tapped(.plusMinus)
        _ = calculator.tapped(.dot)
        _ = calculator.tapped(number: 2)
        _ = calculator.tapped(operation: .multiply)
        _ = calculator.tapped(number: 2)
        _ = calculator.tapped(.plusMinus)
        let result = calculator.tapped(.equals)
        XCTAssertEqual(result, -6.4)
        
    }
    
    func test_tap1_tap0_tap0_tap0_tapplus_tap5_tap0_tap0_return500() {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 1)
        _ = calculator.tapped(number: 0)
        _ = calculator.tapped(number: 0)
        _ = calculator.tapped(number: 0)
        _ = calculator.tapped(operation: .plus)
        _ = calculator.tapped(number: 5)
        _ = calculator.tapped(number: 0)
        let result = calculator.tapped(number: 0)
        XCTAssertEqual(result, 500)
        
    }

    func test_tapNUmber_tapDot_tapZero_display() async {
        let calculator = CalculatorBrain()
        _ = calculator.tapped(number: 4)
        _ = calculator.tapped(.dot)
        _ = calculator.tapped(number: 0)
        XCTAssertEqual(calculator.numberOfTrailingZeroes, 1)
    }

//    func test_equals_resolvesDot() {
//        let calculator = CalculatorBrain()
//        _ = calculator.numberWasTapped(4)
//        _ = calculator.numberWasTapped(7)
//        _ = calculator.operationTapped(.plus)
//        _ = calculator.numberWasTapped(5)
//        _ = calculator.numberWasTapped(6)
//        _ = calculator.tapped(.dot)
//        _ = calculator.tapped(.equals)
//        _ = calculator.numberWasTapped(6)
//        XCTAssertEqual(calculator.snapshot, .init(lhs: "-4.56"))
//    }

//    func test_checkingIncrementWithoutInsertingOperation() {
//        let calculator = CalculatorBrain()
//        _ = calculator.numberWasTapped(2)
//        XCTAssertEqual(calculator.snapshot, .init(lhs: "2"))
//        _ = calculator.operationTapped(.plus)
//        XCTAssertEqual(calculator.snapshot, .init(lhs: "2", pendingOperation: .plus))
//        _ = calculator.tapped(.equals)
//        _ = calculator.tapped(.equals)
//        _ = calculator.numberWasTapped(5)
//        XCTAssertEqual(calculator.snapshot, .init(
//            lhs: "5",
//            pendingOperation: nil,
//            rhs: nil,
//            previous: .init(
//                pendingOperation: .plus,
//                rhs: "2"
//            )
//        ))
//        let result = calculator.tapped(.equals)
//        XCTAssertEqual(result, 7)
//    }
    
}




extension CalculatorBrain {
    struct StateSnapshot: Equatable {
        var lhs: String?
        var pendingOperation: ArithmeticOperation?
        var rhs: String?
        var dotIsPending: Bool = false
        var previous: Previous = .init()
    }
    var snapshot: StateSnapshot {
        StateSnapshot.init(
            lhs: lhs,
            pendingOperation: pendingOperation,
            rhs: rhs,
            dotIsPending: dotIsPending,
            previous: previous
        )
    }
}

extension CalculatorBrain.StateSnapshot: CustomStringConvertible {
    var description: String {
        "\(lhs ?? "nil") | \(pendingOperation.map({"\($0)"}) ?? "nil") | \(rhs ?? "nil") | dp: \(dotIsPending) | previous: \(previous.pendingOperation.map({"\($0)"}) ?? "nil") \(previous.rhs ?? "nil")"
    }
}
