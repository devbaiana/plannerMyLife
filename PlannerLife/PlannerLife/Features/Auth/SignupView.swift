//
//  SignupView.swift
//  PlannerLife
//
//  Created by nathalia karine on 19/09/2026.
//

import SwiftUI

struct SignupView: View {
    @State var email = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        ZStack{
            AppGradients.screenBackground.ignoresSafeArea()
            VStack(spacing: AppSpacing.xlarge){
                header
                form
                Text("🌈 Comece hoje mesmo sua transformação")
                    .font(AppFonts.caption)
                    .foregroundStyle(AppColors.textSecondary)
            }
            .padding(AppSpacing.large)
        }
    }
    var header: some View {
        VStack(spacing: AppSpacing.small){
            AppIcon(.sparkles, size: 40)
                .foregroundStyle(AppColors.textOnAccent)
                .frame(width: 80, height: 80)
                .background(AppGradients.logo)
                .clipShape(Circle())
                .shadow(color: AppColors.accentPurple.opacity(0.3), radius: 8, y: 4)
            
            Text("Crie sua conta! 🌟")
                .font(AppFonts.title)
                .foregroundStyle(AppColors.textPrimary)
            
            Text("Comece sua jornada de conquistas")
                .font(AppFonts.body)
                .foregroundStyle(AppColors.textSecondary)
        }
    }
    var form: some View {
        VStack(spacing: AppSpacing.medium){
            AuthTextField(label: "Nome Completo",
                          placeholder: "Seu Nome",
                          icon: .user,
                          text: $name)
            AuthTextField(label: "Email",
                          placeholder: "seu@email.com",
                          icon: .mail,
                          keyboardType: .emailAddress,
                          text: $email)
            AuthTextField(label: "Senha",
                          placeholder: "••••••••",
                          icon: .lockKeyhole,
                          isSecure: true,
                          text: $password)
            AuthTextField(label: "Confirmar senha",
                          placeholder: "••••••••",
                          icon: .lockKeyhole,
                          isSecure: true,
                          text: $confirmPassword)
            
            PrimaryButton(title: "Criar Conta", action: {})
            HStack(spacing: AppSpacing.xsmall) {
                Text("Já tem uma conta?")
                Button("Entrar") {}
                    .fontWeight(.semibold)
            }
            .font(AppFonts.caption)
            .foregroundStyle(AppColors.textPrimary)
            
        }
        .padding(AppSpacing.large)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .shadow(color: AppColors.accentPurple.opacity(0.2), radius: 16, y: 8)
    }
    
}

#Preview {
    SignupView()
}
