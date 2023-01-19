

import SwiftUI

struct CapsuleButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        CalculatorButton<Capsule>(
            title: title,
            shape: Capsule(),
            action: action
        )
    }
}
struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButton(title: "example", action: { } )
    }
}
