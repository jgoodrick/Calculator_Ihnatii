
import XCTest
import ComposableArchitecture
@testable import AppFeature

@MainActor
class AppFeature_Tests: XCTestCase {
    
    
    func test_tap1_displays_1() async {
        let store = makeSUT()
        
        await store.send(.onNumber(1)) { state in
            state.display = "1"
        }
    }
    
    func test_multiplies_1_by_2_displays_2() async {
        let store = makeSUT()
        
        await store.send(.onNumber(1)) { state in
            state.display = "1"
        }
        await store.send(.multiply)
        await store.send(.onNumber(2)) {
            $0.display = "2"
        }
    }
    
    func test_multiplies_2_by_3_displays_6() async {
        let store = makeSUT()
        
        await store.send(.onNumber(2)) { state in
            state.display = "2"
        }
        await store.send(.multiply)
        await store.send(.onNumber(3)) {
            $0.display = "3"
            
        }
        await store.send(.equal) {
            $0.display = "6"
        }
    }
    
    func test_tap3_tap4_displays_34() async {
        let store = makeSUT()
        
        await store.send(.onNumber(3)) {
            $0.display = "3"
        }
        await store.send(.onNumber(4)) {
            $0.display = "34"
        }
        
    }
    
    func test_tap5_tapDot_tap1_display5dot1() async {
        let store = makeSUT()
        
        await store.send(.onNumber(5)) {
            $0.display = "5"
        }
        await store.send(.dot) {
            $0.display = "5."
        }
        await store.send(.onNumber(1)) {
            $0.display = "5.1"
        }
    }
    
    func test_tap5_tapPlusMinus_displayMinus5() async {
        let store = makeSUT()
        
        await store.send(.onNumber(5)) {
            $0.display = "5"
        }
        await store.send(.plusMinus) {
            $0.display = "-5"
        }
        
    }
    
    func test_tap5_tapDot_tap3_tap1_tapClear_display0() async {
        let store = makeSUT()
        
        await store.send(.onNumber(5)) {
            $0.display = "5"
        }
        await store.send(.dot) {
            $0.display = "5."
        }
        await store.send(.onNumber(3)) {
            $0.display = "5.3"
        }
        await store.send(.onNumber(1)) {
            $0.display = "5.31"
        }
        await store.send(.clear) {
            $0.display = "0"
        }
    }
    
    func test_tap2_tapMinus_tap3_displays_minus1() async {
        let store = makeSUT()
        
        await store.send(.onNumber(2)) { state in
            state.display = "2"
        }
        await store.send(.minus)
        await store.send(.onNumber(3)) {
            $0.display = "3"
            
        }
        await store.send(.equal) {
            $0.display = "-1"
        }
    }
    
    func test_tap3_tapDivide_tap1_displays_1() async {
        let store = makeSUT()
        
        await store.send(.onNumber(3)) {
            $0.display = "3"
        }
        await store.send(.divide)
        await store.send(.onNumber(3))
        await store.send(.equal) {
            $0.display = "1"
        }
    }
    
    //    func test_tap100_tapPercent_displays1() async {
    //        let store = makeSUT()
    //
    //        await store.send(.onNumber(100)) {
    //            $0.display = "100"
    //        }
    //        await store.send(.percent) {
    //            $0.display = "1"
    //        }
    //    }
    
    func test_tap2_tapPlus_tap3_displays_5() async {
        let store = makeSUT()
        
        await store.send(.onNumber(2)) { state in
            state.display = "2"
        }
        await store.send(.plus)
        await store.send(.onNumber(3)) {
            $0.display = "3"
        }
        await store.send(.equal) {
            $0.display = "5"
        }
    }
    
    func test_tap1_tap0_tap1_tapEqual_display101() async {
        let store = makeSUT()
        
        await store.send(.onNumber(1)) {
            $0.display = "1"
        }
        await store.send(.onNumber(0)) {
            $0.display = "10"
        }
        await store.send(.onNumber(1)) {
            $0.display = "101"
        }
        await store.send(.equal)
    }
    
    func test_tap1_tapClear_tap1_tap2_tapPlusMinus_tapPlus_tap5_tapEquals_displayMinus17() async {
        let store = makeSUT()
        
        await store.send(.onNumber(1)) {
            $0.display = "1"
        }
        await store.send(.clear) {
            $0.display = "0"
        }
        await store.send(.onNumber(1)) {
            $0.display = "1"
        }
        await store.send(.onNumber(2)) {
            $0.display = "12"
        }
        await store.send(.plusMinus) {
            $0.display = "-12"
        }
        await store.send(.plus)
        await store.send(.onNumber(5)) {
            $0.display = "5"
        }
        await store.send(.equal) {
            $0.display = "-7"
        }
        
    }
    
    func test_tapClear_tap1_tap2_tapPlusMinus_tapPlus_tap5_tapEquals_displayMinus17() async {
        let store = makeSUT()
        
        await store.send(.clear)
        await store.send(.onNumber(1)) {
            $0.display = "1"
        }
        await store.send(.onNumber(2)) {
            $0.display = "12"
        }
        await store.send(.plusMinus) {
            $0.display = "-12"
        }
        await store.send(.plus)
        await store.send(.onNumber(5)) {
            $0.display = "5"
        }
        await store.send(.equal) {
            $0.display = "-7"
        }
        
    }
    
    //    func test_tap5000_tapMinus_tap1000_tapEqual_display4000() async {
    //        let store = makeSUT()
    //
    //        await store.send(.onNumber(5000)) {
    //            $0.display = "5,000"
    //        }
    //        await store.send(.minus)
    //        await store.send(.onNumber(1000)) {
    //            $0.display = "1,000"
    //        }
    //        await store.send(.equal) {
    //            $0.display = "4,000"
    //        }
    //    }
    //
    //    func test_tap5000_tapPlus_tap1000_display1000() async {
    //        let store = makeSUT()
    //
    //        await store.send(.onNumber(5000)) {
    //            $0.display = "5,000"
    //        }
    //        await store.send(.plus)
    //        await store.send(.onNumber(1000)) {
    //            $0.display = "1,000"
    //        }
    //    }
    
    func test_tappedPlusMinus() async {
        let store = makeSUT()
        
        await store.send(.plusMinus)
        
    }
    
    func test_tapClear_tap1_tap2_tapPlusMinus_tapPlus_tap5_tapEquals_displayMinus127() async {
        let store = makeSUT()
        
        await store.send(.clear)
        await store.send(.onNumber(1)) {
            $0.display = "1"
        }
        await store.send(.onNumber(0)) {
            $0.display = "10"
        }
        await store.send(.onNumber(0)) {
            $0.display = "100"
        }
        await store.send(.onNumber(0)) {
            $0.display = "1,000"
        }
        
        await store.send(.plus)
        await store.send(.onNumber(5)) {
            $0.display = "5"
        }
        await store.send(.onNumber(0)) {
            $0.display = "50"
        }
        await store.send(.onNumber(0)) {
            $0.display = "500"
        }
        await store.send(.equal) {
            $0.display = "1,500"
        }
        
    }
    
    func test_tapDot_display_dot() async {
        let store = makeSUT()
        
        await store.send(.dot) {
            $0.display = "0."
        }
        
    }
    
    func test_tapDot_tapNumber_display() async {
        let store = makeSUT()
        
        await store.send(.dot) {
            $0.display = "0."
        }
        await store.send(.onNumber(5)) {
            $0.display = "0.5"
        }
        
    }
    
    func test_tapNUmber_tapDot_tapZero_display() async {
        let store = makeSUT()
        
        await store.send(.onNumber(4)) {
            $0.display = "4"
        }
        await store.send(.dot) {
            $0.display = "4."
        }
        await store.send(.onNumber(0)) {
            $0.display = "4.0"
        }
    }
    
    func test_tapPlusMinus_tapNumber_tapNumber() async {
        let store = makeSUT()
        
        await store.send(.plusMinus)
        await store.send(.onNumber(8)) {
            $0.display = "-8"
        }
        await store.send(.onNumber(3)) {
            $0.display = "-83"
        }
    }
    
    func test_tap1_tap0_tapDot_tap0_tap0_tap3_display() async {
        let store = makeSUT()
        
        await store.send(.onNumber(1)) {
            $0.display = "1"
        }
        await store.send(.onNumber(0)) {
            $0.display = "10"
        }
        await store.send(.dot) {
            $0.display = "10."
        }
        await store.send(.onNumber(0)) {
            $0.display = "10.0"
        }
        await store.send(.onNumber(0)) {
            $0.display = "10.00"
        }
        
        await store.send(.onNumber(3)) {
            $0.display = "10.003"
        }
        
    }
    
    func test_zero_displaysCorrectly() async {
        let store = makeSUT()
        
        await store.send(.onNumber(1)) {
            $0.display = "1"
        }
        await store.send(.dot) {
            $0.display = "1."
        }
        await store.send(.clear) {
            $0.display = "0"
        }
        await store.send(.onNumber(2)) {
            $0.display = "2"
        }
        await store.send(.dot) {
            $0.display = "2."
        }
    }
    
    func test_tap1_tap0_tapDot_tap0_tap0_tap3_tap0_tap0_display() async {
        let store = makeSUT()
        
        await store.send(.onNumber(1)) {
            $0.display = "1"
        }
        await store.send(.onNumber(0)) {
            $0.display = "10"
        }
        await store.send(.dot) {
            $0.display = "10."
        }
        await store.send(.onNumber(0)) {
            $0.display = "10.0"
        }
        await store.send(.onNumber(0)) {
            $0.display = "10.00"
        }
        
        await store.send(.onNumber(3)) {
            $0.display = "10.003"
        }
        
        await store.send(.onNumber(0)) {
            $0.display = "10.0030"
            XCTAssertEqual($0.brain.numberOfTrailingZeroes, 1)
        }
        await store.send(.onNumber(0)) {
            $0.display = "10.00300"
            XCTAssertEqual($0.brain.numberOfTrailingZeroes, 2)
        }
        
    }
    
    func test_A() async {
        
        let store = makeSUT()
        
        await store.send(.onNumber(5)) {
            $0.display = "5"
        }
        await store.send(.onNumber(0)) {
            $0.display = "50"
        }
        await store.send(.onNumber(0)) {
            $0.display = "500"
        }
        await store.send(.dot) {
            $0.display = "500."
            XCTAssertEqual($0.brain.numberOfTrailingZeroes, 0)
        }
    }
    
    
    
}

extension AppFeature_Tests {
    typealias TestStore = ComposableArchitecture.TestStore<AppFeature.State, AppFeature.Action, AppFeature.State, AppFeature.Action, ()>

    func makeSUT() -> TestStore {
        TestStore(initialState: AppFeature.State(), reducer: AppFeature())
    }
}
