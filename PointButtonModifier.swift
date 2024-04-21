//
//  PointButtonModifier.swift
//  Sesac_PracticeSwiftUI
//
//  Created by youngjoo on 4/17/24.
//

import SwiftUI

struct PointButtonModifier: ViewModifier {
    
    @Binding var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

extension View {
    
    // 매개변수는 Binding 구조체 타입으로 값을 넘기는거로구만
    func asPointButton(backgroundColor: Binding<Color>) -> some View {
        modifier(PointButtonModifier(backgroundColor: backgroundColor))
    }
}
