

import SwiftUI

struct CalculatorButton<ShapeView: Shape>: View {
    
    let title: String
    let shape: ShapeView
    let action: () -> Void
    
    struct Style: Equatable {
        var color: Color = .init(.darkGray)
        var font: Font = .largeTitle
        var foregroundColor: Color = .white
    }
    
    @Environment(\.module.circleButton) var style
    
    var body: some View {
        Button(
            action: action,
            label: {
                shape
                    .fill(style.color)
                    .overlay {
                        Text(title)
                            .font(style.font)
                    }
            }
        )
        .foregroundColor(style.foregroundColor)
    }
}


struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton<Circle>(title: "example", shape: Circle(), action: { } )
    }
}
