//
//  LoginView.swift
//  PlannerLife
//
//  Created by nathalia karine on 19/09/2026.
//

import SwiftUI


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack {
            AppGradients.screenBackground.ignoresSafeArea()

            VStack(spacing: AppSpacing.xlarge) {
                header
                formCard
                Text("💜 Transforme seus sonhos em realidade")
                    .font(AppFonts.caption)
                    .foregroundStyle(AppColors.textSecondary)
            }
            .padding(AppSpacing.large)
            .scrollableAndDismissesKeyboard()
        }
    }

    private var header: some View {
        VStack(spacing: AppSpacing.small) {
            AppIcon(.sparkles, size: 40)
                .foregroundStyle(AppColors.textOnAccent)
                .frame(width: 80, height: 80)
                .background(AppGradients.logo)
                .clipShape(Circle())
                .shadow(color: AppColors.accentPurple.opacity(0.3), radius: 8, y: 4)

            Text("Bem-vindo de volta! ✨")
                .font(AppFonts.title)
                .foregroundStyle(AppColors.textPrimary)
            Text("Entre e continue suas metas")
                .font(AppFonts.body)
                .foregroundStyle(AppColors.textSecondary)
        }
    }

    private var formCard: some View {
        VStack(spacing: AppSpacing.medium) {
            AuthTextField(label: "Email", placeholder: "seu@email.com",
                          icon: .mail, keyboardType: .emailAddress,
                          text: $email)
            AuthTextField(label: "Senha", placeholder: "••••••••",
                          icon: .lockKeyhole, isSecure: true, text: $password)

            Button("Esqueceu a senha?") {}
                .font(AppFonts.caption)
                .foregroundStyle(AppColors.textSecondary)
                .frame(maxWidth: .infinity, alignment: .trailing)

            PrimaryButton(title: "Entrar", action: {})

            HStack(spacing: AppSpacing.xsmall) {
                Text("Ainda não tem uma conta?")
                Button("Cadastre-se") {}
                    .fontWeight(.semibold)
            }
            .font(AppFonts.caption)
            .foregroundStyle(AppColors.textPrimary)
        }
        .padding(AppSpacing.large)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .shadow(color: AppColors.accentPurple.opacity(0.2), radius: 16, y: 8)
    }
}

#Preview {
    LoginView()
}
