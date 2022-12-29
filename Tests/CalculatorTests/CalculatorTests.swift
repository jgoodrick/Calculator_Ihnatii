
import XCTest
import Calculator

final class Calculator_Tests: XCTestCase {
    
    func test_initialState_numberWasTapped_returnsThatNumber() {
        for number in 0...9 {
            let calculator = Calculator()
            let result = calculator.numberWasTapped(number)
            XCTAssertEqual(result, Double(number))
        }
    }
    
    func test_tapped_5_tapped_6_returns56() {
        let calculator = Calculator()
        _ = calculator.numberWasTapped(5)
        let result = calculator.numberWasTapped(6)
        XCTAssertEqual(result, 56.0)
    }
    
    func test_tapped_3_tapped_2_tapped_4_returns324() {
        let calculator = Calculator()
        _ = calculator.numberWasTapped(3)
        _ = calculator.numberWasTapped(2)
        let result = calculator.numberWasTapped(4)
        XCTAssertEqual(result, 324)
    }
    
    func test_tapped_2_clear_returnsZero() {
        let calculator = Calculator()
        _ = calculator.numberWasTapped(2)
        let result = calculator.clear()
        XCTAssertEqual(result, 0)
    }
    
    func test_numberWasTapped_preceededByClear_returnsThatNumber() {
        let calculator = Calculator()
        for number in 0...9 {
            _ = calculator.clear()
            let result = calculator.numberWasTapped(number)
            XCTAssertEqual(result, Double(number))
        }
    }
    
    func test_tapped_8_tappedClear_tapped_4_returns4() {
        let calculator = Calculator()
        _ = calculator.numberWasTapped(8)
        _ = calculator.clear()
        let result = calculator.numberWasTapped(4)
        XCTAssertEqual(result, 4)
    }
    
    func test_tapped_8_tappedPlus_tapped_8_tappedPlus_returns16() {
        let calculator = Calculator()
        _ = calculator.numberWasTapped(8)
        _ = calculator.operationTapped(.plus)
        _ = calculator.numberWasTapped(8)
        let result = calculator.operationTapped(.plus)
        XCTAssertEqual(result, 16)
    }
    
    func test_tapped_4_tappedPlus_tapped_4_tappedPlus_returns8() {
        let calculator = Calculator()
        _ = calculator.numberWasTapped(4)
        _ = calculator.operationTapped(.plus)
        _ = calculator.numberWasTapped(4)
        let result = calculator.operationTapped(.plus)
        XCTAssertEqual(result, 8)
    }
    
    func test_tapped_4_tappedMinus_tapped_2_tappedMinus_returns2() {
        let calculator = Calculator()
        _ = calculator.numberWasTapped(4)
        _ = calculator.operationTapped(.minus)
        _ = calculator.numberWasTapped(2)
        let result = calculator.operationTapped(.plus)
        XCTAssertEqual(result, 2)
    }
    
    func test_tapped_4_tappedMinus_tapped_6_tappedMinus_returnsNegative2() {
        let calculator = Calculator()
        _ = calculator.numberWasTapped(4)
        _ = calculator.operationTapped(.minus)
        _ = calculator.numberWasTapped(6)
        let result = calculator.operationTapped(.plus)
        XCTAssertEqual(result, -2)
    }
    
    func test_tapped_4_tappedMultiply_tapped_6_tappedMultiply_returns24() {
        let calculator = Calculator()
        _ = calculator.numberWasTapped(4)
        _ = calculator.operationTapped(.multiply)
        _ = calculator.numberWasTapped(6)
        let result = calculator.operationTapped(.multiply)
        XCTAssertEqual(result, 24)
    }
    
    func test_tapped_4_tappedMultiply_tapped_6_tappedEquals_returns24() {
        let calculator = Calculator()
        _ = calculator.numberWasTapped(4)
        _ = calculator.operationTapped(.multiply)
        _ = calculator.numberWasTapped(6)
        let result = calculator.tappedEquals()
        XCTAssertEqual(result, 24.0)
    }
    
}
