//
//  CafeViewModel.swift
//  TestProject
//
//  Created by Artem Leschenko on 19.04.2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var searchingText = ""
    @Published var listCafe = [Vendor]()
    
}
