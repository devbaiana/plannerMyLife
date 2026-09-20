//
//  PrimaryButton.swift
//  PlannerLife
//
//  Created by nathalia karine on 17/09/2026.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppFonts.headline)
                .foregroundStyle(AppColors.textOnAccent)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppSpacing.medium)
                .background(AppGradients.primaryButton)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .shadow(color: AppColors.accentPurple.opacity(0.3), radius: 8, y: 4)
        }
    }
}
#Preview {
    PrimaryButton(title: "Adicionar meta", action: {})
        .padding()
}
