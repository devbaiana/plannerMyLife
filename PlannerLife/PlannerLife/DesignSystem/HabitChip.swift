//
//  HabitChip.swift
//  PlannerLife
//
//  Created by nathalia karine on 17/09/2026.
//

import SwiftUI

struct HabitChip: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color? = AppColors.accentPink
    var fontColor: Color? = AppColors.textPrimary
    
    
    var body: some View {
        Button(action: action){
            Text(title)
                .padding(AppSpacing.medium)
                .foregroundColor(fontColor)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .circular))
            
        }
    }
}


#Preview {
    HabitChip(title: "Beber água", action: {})
}
