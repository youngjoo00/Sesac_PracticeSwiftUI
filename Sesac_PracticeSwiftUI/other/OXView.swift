//
//  OXView.swift
//  Sesac_PracticeSwiftUI
//
//  Created by youngjoo on 4/17/24.
//

import SwiftUI

struct OXView: View {
    
    @State var random: Int
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: "star")
                    .frame(width: 60, height: 60)
                    .background(.gray)
                
                Text("등기부 등본은 집주인만 발급받을 수 있다?")
                    .font(.title)
                
                Text("매잎 푸는 금융 퀴즈 \(random)")
                
                SeleteButtonView()
                
            }
            .asBaseVStack()

        }
    }
}

#Preview {
    OXView(random: 0)
}

struct SeleteButtonView: View {
    
    @State private var button1BackgroundColor: Color = .blue
    @State private var button2BackgroundColor: Color = .red
    
    var body: some View {
        HStack {
            Button("그렇다") {
                print("Yes")
            }
            .asPointButton(backgroundColor: $button1BackgroundColor)
            
            Spacer()
                .frame(width: 20)
            
            Button("아니다") {
                print("No")
            }
            .asPointButton(backgroundColor: $button2BackgroundColor)
        }
    }
}
