
import XCTest
@testable import AppFeature

final class NumberDisplay_Tests: XCTestCase {

    func test_5point0_displaysAs_5() {
        var (sut, state) = makeSUT()
        sut.display(5.0, in: &state)
        XCTAssertEqual(state.display, "5")
    }

    func test_5point01_displaysAs_5point01() {
        var (sut, state) = makeSUT()
        sut.display(5.01, in: &state)
        XCTAssertEqual(state.display, "5.01")
    }

    func test_5point010_displaysAs_5point010() {
        var (sut, state) = makeSUT()
        sut.display(5010, in: &state)
        XCTAssertEqual(state.display, "5,010")
    }

    func test_5000point1_displaysAs_5comma000point1() {
        var (sut, state) = makeSUT()
        sut.display(5000.1, in: &state)
        XCTAssertEqual(state.display, "5,000.1")
    }
    
    func test_50point100_displaysAS_50point100() {
        var (sut, state) = makeSUT()
        sut.display(500.00, in: &state)
        XCTAssertEqual(state.display, "500")
    }

}

extension NumberDisplay_Tests {
    func makeSUT() -> (sut: AppFeature, state: AppFeature.State) {
        let state = AppFeature.State()
        let sut = AppFeature()
        return (sut: sut, state: state)
    }
}
