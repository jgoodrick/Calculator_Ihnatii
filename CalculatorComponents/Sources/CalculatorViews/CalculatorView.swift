
import SwiftUI

public struct MainView: View {
    public init(buttonsView: ButtonsView) {
        self.buttonsView = buttonsView
    }
    
    let buttonsView: ButtonsView
    
    public var body: some View {
        VStack {
            Spacer(minLength: 0)
            
            Text("0")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 90))
                .foregroundColor(.white)
                .padding()
            
            buttonsView
        }
        .padding()
        .background(.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            buttonsView: ButtonsView(
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
        )
    }
}
