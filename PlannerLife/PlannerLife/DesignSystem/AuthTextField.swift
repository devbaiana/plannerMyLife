//
//  AuthTextField.swift
//  PlannerLife
//
//  Created by nathalia karine on 19/09/2026.
//

import SwiftUI

struct AuthTextField: View {
    let label: String
    let placeholder: String
    let icon: ImageResource
    var isSecure = false
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String

    @State private var isRevealed = false

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            Text(label)
                .font(AppFonts.caption)
                .foregroundStyle(AppColors.textPrimary)

            HStack(spacing: AppSpacing.small) {
                AppIcon(icon)
                    .foregroundStyle(AppColors.textSecondary)

                field

                if isSecure {
                    Button {
                        isRevealed.toggle()
                    } label: {
                        AppIcon(isRevealed ? .eyeOff : .eye)
                            .foregroundStyle(AppColors.textSecondary)
                    }
                }
            }
            .padding(AppSpacing.medium)
            .background(.white.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(AppColors.accentPurple.opacity(0.4), lineWidth: 1)
            )
        }
    }

    @ViewBuilder
    private var field: some View {
        if isSecure && !isRevealed {
            SecureField(placeholder, text: $text)
        } else {
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
        }
    }
}
//
//#Preview {
//    AuthTextField()
//}
