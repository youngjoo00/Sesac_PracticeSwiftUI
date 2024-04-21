//
//  MyRandomImageView.swift
//  Sesac_PracticeSwiftUI
//
//  Created by youngjoo on 4/20/24.
//

import SwiftUI

struct Section: Hashable, Identifiable {
    let id = UUID()
    var secionTitle: String
}

// 이미지 그대로 어떻게 넘기죠..?
struct MyRandomImageView: View {
    
    @State private var section: [Section] = [
        Section(secionTitle: "1번째 섹션"),
        Section(secionTitle: "2번째 섹션"),
        Section(secionTitle: "3번째 섹션"),
        Section(secionTitle: "4번째 섹션"),
        Section(secionTitle: "5번째 섹션"),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 30) {
                    ForEach($section, id: \.self) { item in
                        NavigationLink {
                            DetailImageView(title: item.secionTitle, url: RandomImageView().url)
                        } label: {
                            ImageSectionView(sectionTitle: item.secionTitle.wrappedValue)
                        }
                        
                    }
                }
            }
            .navigationTitle("My Random Image")
            .navigationBarTitleDisplayMode(.large)
        }
        
        
    }
    
}

#Preview {
    MyRandomImageView()
}

struct ImageSectionView: View {
    
    var sectionTitle: String
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text(sectionTitle)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<5) { _ in
                        RandomImageView()
                    }
                }

            }
        }
        .font(.title)
        .asBaseVStack()
    }
}

struct RandomImageView: View {
    
    let url = URL(string: "https://picsum.photos/200/300")
    
    var body: some View {
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView()
                    .frame(width: 100, height: 100)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 3.5, height: 150)
                    .clipShape(.buttonBorder)
            case .failure:
                Image(systemName: "xmark")
            @unknown default:
                Image(systemName: "xmark")
            }
        }
    }
}
