//
//  DebugCatalog.swift
//  PlannerLife
//
//  Created by nathalia karine on 20/09/2026.
//

import SwiftUI

#if DEBUG
struct ColorsCatalogView: View {
    private let colors: [(String, Color)] = [
        ("background", AppColors.background),
        ("surfacePink", AppColors.surfacePink),
        ("surfacePurple", AppColors.surfacePurple),
        ("surfaceBlue", AppColors.surfaceBlue),
        ("surfaceGreen", AppColors.surfaceGreen),
        ("accentPink", AppColors.accentPink),
        ("accentPurple", AppColors.accentPurple),
        ("textPrimary", AppColors.textPrimary),
        ("textSecondary", AppColors.textSecondary),
        ("success", AppColors.success),
        ("error", AppColors.error)
    ]

    var body: some View {
        List(colors, id: \.0) { name, color in
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(color)
                    .frame(width: 44, height: 44)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(.secondary.opacity(0.3)))
                Text(name).font(AppFonts.body)
            }
        }
        .navigationTitle("Cores")
    }
}

struct GradientsCatalogView: View {
    private let gradients: [(String, LinearGradient)] = [
        ("screenBackground", AppGradients.screenBackground),
        ("logo", AppGradients.logo),
        ("primaryButton", AppGradients.primaryButton),
        ("warmAccent", AppGradients.warmAccent)
    ]

    var body: some View {
        List(gradients, id: \.0) { name, gradient in
            VStack(alignment: .leading) {
                Text(name).font(AppFonts.caption)
                RoundedRectangle(cornerRadius: 12).fill(gradient).frame(height: 56)
            }
        }
        .navigationTitle("Gradientes")
    }
}

struct FontsCatalogView: View {
    private let fonts: [(String, Font)] = [
        ("title", AppFonts.title),
        ("headline", AppFonts.headline),
        ("body", AppFonts.body),
        ("caption", AppFonts.caption)
    ]

    var body: some View {
        List(fonts, id: \.0) { name, font in
            Text("\(name): Beber 2L de água").font(font)
        }
        .navigationTitle("Fontes")
    }
}

struct SpacingCatalogView: View {
    private let spacings: [(String, CGFloat)] = [
        ("xsmall", AppSpacing.xsmall),
        ("small", AppSpacing.small),
        ("medium", AppSpacing.medium),
        ("large", AppSpacing.large),
        ("xlarge", AppSpacing.xlarge)
    ]

    var body: some View {
        List(spacings, id: \.0) { name, value in
            HStack {
                Text("\(name) (\(Int(value)))").font(AppFonts.body)
                Spacer()
                Rectangle().fill(AppColors.accentPurple).frame(width: value, height: 16)
            }
        }
        .navigationTitle("Espaçamentos")
    }
}

struct IconsCatalogView: View {
    private let icons: [(String, ImageResource)] = [
        ("bell", .bell),
        ("book", .book),
        ("calendarDays", .calendarDays),
        ("chartColumn", .chartColumn),
        ("chartLine", .chartLine), 
        ("chartPie", .chartPie),
        ("circle", .circle), 
        ("circleCheck", .circleCheck), ("droplet", .droplet),
        ("dumbbell", .dumbbell),
        ("eye", .eye), 
        ("eyeOff", .eyeOff),
        ("footprints", .footprints), 
        ("lightbulb", .lightbulb), 
        ("lockKeyhole", .lockKeyhole),
        ("logOut", .logOut),
        ("mail", .mail),
        ("menu", .menu),
        ("plus", .plus),
        ("sparkles", .sparkles),
        ("squarePlus", .squarePlus),
        ("target", .target),
        ("user", .user),
        ("x", .x),
        ("zap", .zap)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: AppSpacing.medium) {
                ForEach(icons, id: \.0) { name, resource in
                    VStack(spacing: AppSpacing.xsmall) {
                        AppIcon(resource, size: 28)
                            .foregroundStyle(AppColors.textPrimary)
                        Text(name).font(AppFonts.caption).lineLimit(1)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Ícones")
    }
}

struct ComponentsCatalogView: View {
    @State private var text = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                PrimaryButton(title: "Adicionar meta", action: {})
                GoalCard(title: "Beber 2L de água", isCompleted: true)
                GoalCard(title: "Meditar 10 minutos", isCompleted: false)
                HabitChip(title: "Beber água", action: {})
                AuthTextField(label: "Email", placeholder: "seu@email.com",
                              icon: .mail, text: $text)
            }
            .padding()
        }
        .navigationTitle("Componentes")
    }
}
#endif

#Preview {
    ColorsCatalogView()
}
