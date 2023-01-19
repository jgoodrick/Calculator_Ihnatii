

import SwiftUI

struct CircleButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        CalculatorButton<Circle>(
            title: title,
            shape: Circle(),
            action: action
        )
    }
}


struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(title: "Example", action: {})
    }
}
