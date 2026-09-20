//
//  GoalCard.swift
//  PlannerLife
//
//  Created by nathalia karine on 17/09/2026.
//

import SwiftUI

struct GoalCard: View {
    let title: String
    let isCompleted: Bool

    var body: some View {
        HStack {
            AppIcon(isCompleted ? .circleCheck : .circle, size: 24)
                .foregroundStyle(isCompleted ? AppColors.textPrimary : AppColors.textSecondary)
            Text(title)
                .font(AppFonts.body)
                .foregroundStyle(AppColors.textPrimary)
                .strikethrough(isCompleted)
            Spacer()
        }
        .padding(AppSpacing.medium)
        .background(AppColors.background)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    VStack {
        GoalCard(title: "Beber 2L de água", isCompleted: true)
        GoalCard(title: "Meditar 10 minutos", isCompleted: false)
    }
    .padding()
}
