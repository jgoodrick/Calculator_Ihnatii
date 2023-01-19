
import SwiftUI

public struct ButtonsView: View {
    public init(
        onNumber: @escaping (Int) -> Void,
        onClear: @escaping () -> Void,
        onPlusMinus: @escaping () -> Void,
        onDot: @escaping () -> Void,
        onPercent: @escaping () -> Void,
        onEqual: @escaping () -> Void,
        onDivide: @escaping () -> Void,
        onMultiply: @escaping () -> Void,
        onMinus: @escaping () -> Void,
        onPlus: @escaping () -> Void
    ) {
        self.onNumber = onNumber
        self.onClear = onClear
        self.onPlusMinus = onPlusMinus
        self.onDot = onDot
        self.onPercent = onPercent
        self.onEqual = onEqual
        self.onDivide = onDivide
        self.onMultiply = onMultiply
        self.onMinus = onMinus
        self.onPlus = onPlus
    }
    
    
    let onNumber: (Int) -> Void
    let onClear: () -> Void
    let onPlusMinus: () -> Void
    let onDot: () -> Void
    let onPercent: () -> Void
    let onEqual: () -> Void
    let onDivide: () -> Void
    let onMultiply: () -> Void
    let onMinus: () -> Void
    let onPlus: () -> Void
    
    public var body: some View {
        Grid {
            GridRow {
                CircleButton(title: "AC", action: onClear)
                    .makeLightGray()
                CircleButton(title: "+/-", action: onPlusMinus)
                    .makeLightGray()
                CircleButton(title: "%", action: onPercent)
                    .makeLightGray()
                CircleButton(title: "/", action: onDivide)
                    .makeOrange()
            }
            GridRow {
                CircleButton(title: "7", action: {onNumber(7)})
                CircleButton(title: "8", action: {onNumber(8)})
                CircleButton(title: "9", action: {onNumber(9)})
                CircleButton(title: "*", action: onMultiply)
                    .makeOrange()
            }
            GridRow {
                CircleButton(title: "4", action: {onNumber(4)})
                CircleButton(title: "5", action: {onNumber(5)})
                CircleButton(title: "6", action: {onNumber(6)})
                CircleButton(title: "-", action: onMinus)
                    .makeOrange()
            }
            GridRow {
                CircleButton(title: "1", action: {onNumber(1)})
                CircleButton(title: "2", action: {onNumber(2)})
                CircleButton(title: "3", action: {onNumber(3)})
                CircleButton(title: "+", action: onPlus)
                    .makeOrange()
            }
            GridRow {
                CapsuleButton(title: "0", action: {onNumber(0)})
                    .gridCellColumns(2)
                    .gridCellUnsizedAxes(.vertical)
                CircleButton(title: ".", action: onDot)
                CircleButton(title: "=", action: onEqual)
                    .makeOrange()
            }
        }
    }
}


struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(
            onNumber: {_ in },
            onClear: {},
            onPlusMinus: {},
            onDot: {},
            onPercent: {},
            onEqual: {},
            onDivide: {},
            onMultiply: {},
            onMinus: {},
            onPlus: {}
        )
    }
}

