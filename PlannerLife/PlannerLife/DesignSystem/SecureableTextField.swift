import SwiftUI
import UIKit

/// Campo de texto que alterna entre seguro/visível sem recriar o `UITextField`
/// nativo. SwiftUI puro não permite alternar `isSecureTextEntry` num mesmo
/// campo sem perder o foco/seleção — este wrapper resolve isso indo direto
/// ao UIKit.
struct SecureableTextField: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool
    var keyboardType: UIKeyboardType = .default

    func makeUIView(context: Context) -> UITextField {
        let field = UITextField()
        field.placeholder = placeholder
        field.isSecureTextEntry = isSecure
        field.keyboardType = keyboardType
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.delegate = context.coordinator
        field.addTarget(
            context.coordinator,
            action: #selector(Coordinator.textChanged),
            for: .editingChanged
        )
        return field
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }

        if uiView.isSecureTextEntry != isSecure {
            let wasFirstResponder = uiView.isFirstResponder
            // Guardamos a posição do cursor como um número de caracteres, não
            // como o UITextRange em si: o iOS recria o armazenamento interno
            // do campo ao alternar isSecureTextEntry, e um UITextRange antigo
            // aplicado depois disso vira inválido — o campo então trata a
            // seleção inválida como "selecionar tudo".
            let cursorOffset = uiView.offset(
                from: uiView.beginningOfDocument,
                to: uiView.selectedTextRange?.start ?? uiView.endOfDocument
            )
            uiView.isSecureTextEntry = isSecure

            // Ativar isSecureTextEntry faz o iOS reconfigurar o teclado
            // internamente (some autocorreção/preditivo do modo seguro), e
            // nesse processo o campo pode perder o "primeiro respondedor"
            // por um instante. Adiamos o reforço pro próximo ciclo da run
            // loop, depois que essa reconfiguração termina.
            if wasFirstResponder {
                DispatchQueue.main.async {
                    // .text = não reconstrói o buffer interno de digitação do
                    // UIKit em modo seguro (é um buffer separado da
                    // propriedade .text). insertText passa pelo mesmo
                    // caminho de um toque de tecla real, e é o que de fato
                    // realimenta esse buffer.
                    uiView.text = ""
                    uiView.insertText(text)
                    if !uiView.isFirstResponder {
                        uiView.becomeFirstResponder()
                    }
                    if let newPosition = uiView.position(
                        from: uiView.beginningOfDocument,
                        offset: cursorOffset
                    ) {
                        uiView.selectedTextRange = uiView.textRange(from: newPosition, to: newPosition)
                    }
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UITextFieldDelegate {
        private let parent: SecureableTextField

        init(_ parent: SecureableTextField) {
            self.parent = parent
        }

        @objc func textChanged(_ sender: UITextField) {
            parent.text = sender.text ?? ""
        }
    }
}
