//
//  NewsView.swift
//  Santander
//
//  Created by Thiago Valentim on 26/07/23.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        TabView {
            ForEach(viewModel.news, id: \.id) { news in
                Rectangle()
                    .foregroundColor(.white) // cor das bordas
                    .frame(width: 333, height: 115) //altura e largura
                    .background(.white) // cor de fundo
                    .cornerRadius(6) // arredondamento das bordas
                    .shadow(color: .black.opacity(0.15), radius: 4.5, x: .zero, y: 4) //efeito sombreado do elemento (retangulo no caso)
                    .overlay {
                        HStack {
                            AsyncImage(from: URL(string:  news.iconUrl), frame: CGSize(width: 30, height: 30))
                            {
                                image in
                                image
                                    .renderingMode(.template)
                                    .foregroundColor(Color.santanderRed)
                            } placeholder: {
                                ProgressView()
                            }
                            Text(viewModel.news.description)
                                .font(.openSansSemiBold(size: 14))
                                .padding(.leading, 6.0)
                                .kerning(0.14)
                                .foregroundColor(Color(red: 038, green: 0.38, blue: 0.38))
                        }
                        .padding(.all, 20.0) // .all pega todos os lados do elmento
                    }
            }
        }
        //Precisa falar para a table view o estilo, no caso para que lado ela vai scrollar
        .tabViewStyle(.page)
        .pageControlAppearance(backgroundColor: Color.santanderRed) // uma modificacao da extension que já existe no swift, para ser adicionado a cor propria escolhida
    }
    
    struct NewsView_Previews: PreviewProvider {
        static var previews: some View {
            NewsView()
        }
    }
}
