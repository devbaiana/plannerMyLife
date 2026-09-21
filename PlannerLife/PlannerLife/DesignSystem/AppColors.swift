//
//  AppColors.swift
//  PlannerLife
//
//  Created by nathalia karine on 17/09/2026.
//

import SwiftUI

enum AppColors {
    // Fundos
    static let background = Color(red: 0.99, green: 0.97, blue: 0.99)       // quase branco, leve rosa
    static let surfacePink = Color(red: 0.99, green: 0.91, blue: 0.95)      // #fce7f3
    static let surfacePurple = Color(red: 0.95, green: 0.91, blue: 1.0)     // #f3e8ff
    static let surfaceBlue = Color(red: 0.86, green: 0.92, blue: 1.0)       // #dbeafe
    static let surfaceGreen = Color(red: 0.86, green: 0.99, blue: 0.91)     // #dcfce7 (sucesso)

    // Ações / destaque
    static let accentPink = Color(red: 0.96, green: 0.45, blue: 0.71)       // #f472b6
    static let accentPurple = Color(red: 0.75, green: 0.52, blue: 0.99)     // #c084fc

    // Texto
    static let textPrimary = Color(red: 0.49, green: 0.13, blue: 0.81)      // #7e22ce (roxo escuro)
    static let textSecondary = Color(red: 0.58, green: 0.20, blue: 0.92)    // roxo médio pra legendas
    static let textOnAccent = Color.white                                   // texto sobre fundo colorido

    // Estado
    static let success = Color(red: 0.53, green: 0.94, blue: 0.67)          // #86efac
    static let error = Color(red: 186 / 255, green: 72 / 255, blue: 6 / 255)
}
