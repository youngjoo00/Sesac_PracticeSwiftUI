//
//  ContentView.swift
//  Sesac_PracticeSwiftUI
//
//  Created by youngjoo on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack { // Z 스택으로 뷰의 순서를 나타냄
            Color(.black) // Z Stack 전체영역 검은색
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: "star")
                    .frame(width: 60, height: 60)
                    .background(.blue)
                    .padding(.top, 1)// 뭐임 이거
                
                Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
                    .font(.title2)
                    .bold()
                
                subTitleHStackView("매일 포인트 받는 출석체크·퀴즈")
                subTitleHStackView("새로운 이벤트")
                subTitleHStackView("미션 추천")
                
                Spacer()
                
                Text("[선택] 맞춤형 서비스 이용 동의")
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                
                Button("동의하기") {
                    print("clicked")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .clipShape(.buttonBorder)
                
                Button("다음에하기") {
                    print("clicked")
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .asBaseVStack()
        }
    }
    
    func subTitleHStackView(_ text: String) -> some View {
        HStack {
            Image(systemName: "star")
            Text(text)
        }
    }
}

#Preview {
    ContentView()
}
