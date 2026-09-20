import SwiftUI

struct AppIcon: View {
    let resource: ImageResource
    var size: CGFloat = 20

    init(_ resource: ImageResource, size: CGFloat = 20) {
        self.resource = resource
        self.size = size
    }

    var body: some View {
        Image(resource)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
    }
}

#Preview {
    HStack {
        AppIcon(.bell)
        AppIcon(.target, size: 32)
        AppIcon(.sparkles, size: 40)
    }
    .foregroundStyle(AppColors.textPrimary)
}
