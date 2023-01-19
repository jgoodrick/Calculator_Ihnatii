
import XCTest
import ComposableArchitecture
@testable import AppFeature

class AppFeature_Tests: XCTestCase {

    func test_tap1_displays_1() async {
        let store = TestStore(initialState: AppFeature.State(display: ""), reducer: AppFeature())
        
        await store.send(.onNumber(1)) { state in
            state.display = "1"
        }
    }
}
