//
//  AppGradients.swift
//  PlannerLife
//
//  Created by nathalia karine on 19/09/2026.
//

import SwiftUI

enum AppGradients {
    static let primaryButton = LinearGradient(
        colors: [AppColors.accentPink, AppColors.accentPurple],
        startPoint: .leading,
        endPoint: .trailing
    )

    static let warmAccent = LinearGradient(
        colors: [Color(red: 0.99, green: 0.85, blue: 0.4), Color(red: 0.99, green: 0.65, blue: 0.4)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let screenBackground = LinearGradient(
        colors: [AppColors.surfacePink, AppColors.surfacePurple, AppColors.surfaceBlue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let logo = LinearGradient(
        colors: [AppColors.accentPink, AppColors.accentPurple],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
