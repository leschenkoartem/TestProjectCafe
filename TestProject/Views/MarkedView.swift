//
//  MarkedView.swift
//  TestProject
//
//  Created by Artem Leschenko on 19.04.2023.
//

import SwiftUI

struct MarkedView: View {
    @State var marked = [Vendor]()
    var body: some View {
        ScrollView{
            ForEach(marked, id: \.id) { mark in
                CafeView(cafe: mark)
            }.padding(.vertical)
        }.onAppear {
            Task {
                do {
                    try marked = await JSONManager.shared.getInfo(word: "").filter { $0.favorited }
                }
            }
        }
    }
}

struct MarkedView_Previews: PreviewProvider {
    static var previews: some View {
        MarkedView()
    }
}
