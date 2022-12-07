import SwiftUI

public struct ScrollViewOffset<Content>: View where Content: View {
    
    /// The scroll view's content.
    public var content: Content

    /// The scrollable axes of the scroll view.
    ///
    /// The default value is ``Axis/vertical``.
    public var axes: Axis.Set

    /// A value that indicates whether the scroll view displays the scrollable
    /// component of the content offset, in a way that's suitable for the
    /// platform.
    ///
    /// The default is `true`.
    public var showsIndicators: Bool
    
    /// The scroll view's offset change call back
    public let onOffsetChange: (CGFloat) -> Void
    
    /// Creates a new instance that's scrollable in the direction of the given
    /// axis and can show indicators while scrolling.
    ///
    /// - Parameters:
    ///   - axes: The scroll view's scrollable axis. The default axis is the
    ///     vertical axis.
    ///   - showsIndicators: A Boolean value that indicates whether the scroll
    ///     view displays the scrollable component of the content offset, in a way
    ///     suitable for the platform. The default value for this parameter is
    ///     `true`.
    ///   - content: The view builder that creates the scrollable view.
    public init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true, onOffsetChange: @escaping (_ offset: CGFloat) -> Void, @ViewBuilder content: () -> Content) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.onOffsetChange = onOffsetChange
        self.content = content()
    }
    
    public var body: some View {
        ScrollView(axes, showsIndicators: self.showsIndicators) {
            offsetReader
            content
                .padding(.top, -8)
        }
        .coordinateSpace(name: "frameLayer")
        .onPreferenceChange(OffsetPreferenceKey.self, perform: self.onOffsetChange)
    }
    
    var offsetReader: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(in: .named("frameLayer")).minY
                )
        }
        .frame(height: 0)
    }
    
}
