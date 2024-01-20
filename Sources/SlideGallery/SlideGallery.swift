//
//  SlideGallery.swift
//  SlideGallery
//
//  Created by Nick Brandes on 1/19/24.
//
import SwiftUI

@available(iOS 16.0, *)
public struct SlideGallery: View {
    @State var currentIndex: Int = 0
    @State var views: [AnyView]
    var tintColor: Color
    var height: CGFloat
    
    public init(_ views: [AnyView], height: CGFloat = 400, tintColor: Color = .red) {
        self.views = views
        self.height = height
        self.tintColor = tintColor
    }
    
    public var body: some View {
        VStack {
            ZStack {
                ForEach(0..<views.count, id: \.self) { index in
                    views.remove(at: index)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 300)
                        .scaledToFit()
                        .offset(x: offset(for: index))
                        .mask(
                            VStack {
                                Rectangle().frame(width: UIScreen.main.bounds.width)
                            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        )
                }
                
                
            }
            .frame(height: 400)
            .gesture(
                DragGesture()
                    .onEnded { gesture in
                        if gesture.translation.width < 0 {
                            withAnimation {
                                currentIndex = (currentIndex + 1) % views.count
                            }
                        } else if gesture.translation.width > 0 {
                            withAnimation {
                                currentIndex = (currentIndex - 1 + views.count) % views.count
                            }
                        }
                    }
            )
            HStack {
                Button(action: {
                    withAnimation {
                        currentIndex = (currentIndex - 1 + views.count) % views.count
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                        .tint(tintColor)
                }
                .disabled(currentIndex == 0)

                Spacer()

                Button(action: {
                    withAnimation {
                        currentIndex = (currentIndex + 1) % views.count
                    }
                }) {
                    Image(systemName: "chevron.right")
                        .font(.largeTitle)
                        .tint(tintColor)
                }
                .disabled(currentIndex == views.count - 1)
            }
            .padding(.horizontal)
            .frame(maxHeight: .infinity, alignment: .bottom)
            HStack(spacing: 10) {
                ForEach(0..<views.count, id: \.self) { index in
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(index == currentIndex ? tintColor : .gray)
                        .onTapGesture {
                            withAnimation {
                                currentIndex = index
                            }
                        }
                }
            }
            .padding(.top, 10)
        }
        .frame(height: height)
    }
    
    private func opacity(for index: Int) -> Double {
        let offset = abs(currentIndex - index)
        if offset == 0 {
            return 1.0
        } else if offset == 1 {
            return 0.7
        } else {
            return 0.3
        }
    }
    
    private func offset(for index: Int) -> CGFloat {
        let offset = currentIndex - index
        return CGFloat(offset) * UIScreen.main.bounds.width
    }
}

