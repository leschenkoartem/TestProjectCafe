//
//  CafesViewModel.swift
//  TestProject
//
//  Created by Artem Leschenko on 20.04.2023.
//

import Foundation

class CafesViewModel: ObservableObject {
    @Published var listCafe = [Vendor]()
    
    init() {
        Task {
            await getCafes(word: "")
        }
    }
    
    func getCafes(word: String) async {
            do {
                listCafe = try await JSONManager.shared.getInfo(word: word)
            } catch {
                // Обработка ошибок
            }
        }
}
