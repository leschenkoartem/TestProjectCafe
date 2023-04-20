//
//  SearchView.swift
//  TestProject
//
//  Created by Artem Leschenko on 19.04.2023.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var vm: SearchViewModel
    @EnvironmentObject var CafesVM: CafesViewModel
    
    var body: some View {
        VStack {
            CustomTextField(text: $vm.searchingText)
            if !CafesVM.listCafe.isEmpty {
                ScrollView {
                    ForEach(CafesVM.listCafe, id: \.id) { item in
                        CafeView(cafe: item)
                            .padding(.bottom)
                    }
                    Spacer().frame(height: 110)
                }
            } else {
                Spacer()
                Text("Sorry! No results found...")
                    .foregroundColor(.green)
                    .font(.title)
                    .padding(.bottom)
                    .bold()
                Text("Please try a different search requestor browse businesses from the list")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .opacity(0.75)
                
                Spacer()
            }
        }.onAppear {
            Task {
                await CafesVM.getCafes(word: "")
            }
            vm.searchingText = ""
        }
        .onChange(of: vm.searchingText) { newValue in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                Task {
                    await CafesVM.getCafes(word: vm.searchingText)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(SearchViewModel())
            .environmentObject(CafesViewModel())
    }
}
