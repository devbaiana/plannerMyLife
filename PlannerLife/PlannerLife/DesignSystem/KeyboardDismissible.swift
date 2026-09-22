import SwiftUI

private struct KeyboardDismissibleScroll: ViewModifier {
    func body(content: Content) -> some View {
        ScrollView {
            content
        }
        .scrollDismissesKeyboard(.interactively)
        .onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil, from: nil, for: nil
            )
        }
    }
}

extension View {
    /// Envolve o conteúdo em um `ScrollView` que rola quando o teclado cobre
    /// os campos, e fecha o teclado ao arrastar ou ao tocar fora de um campo.
    func scrollableAndDismissesKeyboard() -> some View {
        modifier(KeyboardDismissibleScroll())
    }
}
