
import Foundation
import SwiftUI

struct ModuleEnvironment: EnvironmentKey {
    public static var defaultValue: ModuleEnvironment = ModuleEnvironment()
    var circleButton: CalculatorButton<Circle>.Style = .init()
    var capsuleButton: CalculatorButton<Capsule>.Style = .init()
}

extension EnvironmentValues {
    var module: ModuleEnvironment {
        get { self[ModuleEnvironment.self] }
        set { self[ModuleEnvironment.self] = newValue }
    }
}



