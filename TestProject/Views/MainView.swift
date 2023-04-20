//
//  ContentView.swift
//  TestProject
//
//  Created by Artem Leschenko on 19.04.2023.
//

import SwiftUI

struct MainView: View {
    
    @State var selector: Tab = .magnifyingglass
    
    var body: some View {
        ZStack {
            VStack {
                switch selector {
                case .magnifyingglass:
                    SearchView()
                case .bookmark:
                    MarkedView()
                }
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selector)
                    .padding(.bottom)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(SearchViewModel())
    }
}
