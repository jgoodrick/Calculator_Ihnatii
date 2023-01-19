
import Foundation
import SwiftUI


extension View {
    func makeOrange() -> some View {
        environment(\.module.circleButton.color, .orange)
    }
    
    func makeLightGray() -> some View {
        environment(\.module.circleButton.color, Color(.lightGray))
    }
}
