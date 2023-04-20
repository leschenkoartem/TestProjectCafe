//
//  CafeView.swift
//  TestProject
//
//  Created by Artem Leschenko on 19.04.2023.
//

import SwiftUI

struct CafeView: View {
    
    var cafe: Vendor
    var textCateg: String {
        get {
            var final = ""
            for i in cafe.categories {
                final += ("•\(i.name) ")
            }
            return final
        }
    }

    var body: some View {
        
        VStack(alignment: .leading) {
            ZStack {
                AsyncImage(url: URL(string: cafe.coverPhoto.mediaURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }.frame(maxWidth: .infinity, maxHeight: 200)
                    .cornerRadius(20)
                    .overlay {
                        VStack {
                            HStack {
                                Spacer()
                                ZStack {
                                    Circle()
                                        .frame(width: 45)
                                        .foregroundColor(cafe.favorited ? .green : .white)
                                    Image(systemName: "bookmark" + (cafe.favorited ? ".fill": ""))
                                        .font(.custom("", size: 25))
                                        .foregroundColor(cafe.favorited ? .white : .green)
                                        .animation(.easeOut(duration: 0.4), value: cafe.favorited)
                                }.onTapGesture {
                                    // код для зміни статусу
                                }
                            }.padding()
                            Spacer()
                            HStack {
                                Text(cafe.areaServed)
                                    .fontWeight(.light)
                                    .padding(4)
                                    .padding(.horizontal, 5)
                                    .background(Color(.systemGray6).opacity(0.75))
                                    .cornerRadius(30)
                                
                                Spacer()
                            }.padding()
                        }
                    }
            }.padding(.bottom, 5)
            
            Text(cafe.companyName)
                .foregroundColor(Color(.label).opacity(0.65))
                .bold()
            
           
            VStack(alignment: .leading) {
                    ForEach(cafe.categories, id: \.id) { item in
                        HStack {
                            Image("cake")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                            
                            Text(item.name).opacity(0.75)
                        }
                    }
                
            }
            
        Text(textCateg).foregroundColor(Color(.label).opacity(0.4))
        }.padding(.horizontal)
    }
}

struct CafeView_Previews: PreviewProvider {
    static var previews: some View {
        CafeView(cafe: Vendor(id: 123, companyName: "Dedcxwe", areaServed: "London", shopType: "shop", favorited: false, follow: false, businessType: "Errw", coverPhoto: CoverPhoto(id: 12, mediaURL: "https://i.imgur.com/CzXTtJV.jpg", mediaType: .image), categories: [Category(id: 21, name: "Pets", image: CoverPhoto(id: 12, mediaURL: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg", mediaType: .image)), Category(id: 12, name: "Dadad", image: CoverPhoto(id: 12, mediaURL: "https://media-staging.chatsumer.app/48/1830f855-6315-4d3c-a5dc-088ea826aef2.svg", mediaType: .image))], tags: [Tag(id: 32, name: "salas", purpose: ""), Tag(id: 43, name: "wercwec", purpose: "ecd")]))
    }
}
