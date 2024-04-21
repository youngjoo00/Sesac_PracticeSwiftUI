//
//  WhiteTextModifier.swift
//  Sesac_PracticeSwiftUI
//
//  Created by youngjoo on 4/17/24.
//

import SwiftUI

struct BaseVStackModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.black)
            .padding(.horizontal, 16)
    }
    
}

extension View {
    
    func asBaseVStack() -> some View {
        modifier(BaseVStackModifier())
    }
}
