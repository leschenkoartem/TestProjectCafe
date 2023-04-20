//
//  CustomTabBar.swift
//  TestProject
//
//  Created by Artem Leschenko on 19.04.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case magnifyingglass = "magnifyingglass.circle"
    case bookmark = "bookmark"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    var tabColor = Color(.label).opacity(0.7)
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? tabColor : .gray)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background()
            .cornerRadius(12)
            .padding()
            .shadow(radius: 2)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.bookmark))
    }
}
