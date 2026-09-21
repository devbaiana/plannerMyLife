//
//  DebugMenu.swift
//  PlannerLife
//
//  Created by nathalia karine on 20/09/2026.
//

import SwiftUI

#if DEBUG
private struct DebugMenuModifier: ViewModifier {
    @State private var isPresented = false
    @State private var position: CGPoint?
    private let buttonSize: CGFloat = 48
    private let areaName = "debugArea"

    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { proxy in
                    debugButton
                        .position(position ?? defaultPosition(in: proxy.size))
                        .gesture(
                            DragGesture(minimumDistance: 8, coordinateSpace: .named(areaName))
                                .onChanged { value in
                                    position = clamped(value.location, in: proxy.size)
                                }
                        )
                }
                .coordinateSpace(name: areaName)
            }
            .sheet(isPresented: $isPresented) {
                DebugMenuView()
            }
    }

    private var debugButton: some View {
        Image(systemName: "ladybug.fill")
            .foregroundStyle(AppColors.textOnAccent)
            .frame(width: buttonSize, height: buttonSize)
            .background(AppGradients.primaryButton)
            .clipShape(Circle())
            .shadow(radius: 6, y: 3)
            .onTapGesture { isPresented = true }
    }

    private func defaultPosition(in size: CGSize) -> CGPoint {
        CGPoint(x: size.width - buttonSize, y: size.height - buttonSize * 2)
    }

    private func clamped(_ point: CGPoint, in size: CGSize) -> CGPoint {
        let half = buttonSize / 2
        return CGPoint(
            x: min(max(point.x, half), size.width - half),
            y: min(max(point.y, half), size.height - half)
        )
    }
}

extension View {
    func debugMenu() -> some View { modifier(DebugMenuModifier()) }
}

struct DebugMenuView: View {
    var appVersion = UIApplication.appVersion ?? "Versão indisponível"
    var body: some View {
        VStack{
            NavigationStack {
                List {
                    NavigationLink("Cores") { ColorsCatalogView() }
                    NavigationLink("Gradientes") { GradientsCatalogView() }
                    NavigationLink("Fontes") { FontsCatalogView() }
                    NavigationLink("Espaçamentos") { SpacingCatalogView() }
                    NavigationLink("Ícones") { IconsCatalogView() }
                    NavigationLink("Componentes") { ComponentsCatalogView() }
                }
                Text("App Version: \(appVersion)")
                    .navigationTitle("Debug")
            }
        }
        
    }
}
public extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
#else
extension View {
    func debugMenu() -> some View { self }
}
#endif

#Preview {
    DebugMenuView()
}
