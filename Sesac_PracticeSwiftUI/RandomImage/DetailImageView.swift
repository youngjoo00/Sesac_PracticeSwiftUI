//
//  DetailImageView.swift
//  Sesac_PracticeSwiftUI
//
//  Created by youngjoo on 4/22/24.
//

import SwiftUI

struct DetailImageView: View {
    
    @Binding var title: String
    var url: URL?
    var body: some View {
        VStack {
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

            Text(title)
                .font(.largeTitle)
                .padding()
            TextField("비어있어요", text: $title)
                .padding(20)
                .background(Color.gray)
        }
    }
}
