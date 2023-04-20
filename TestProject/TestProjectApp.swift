//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Artem Leschenko on 19.04.2023.
//

import SwiftUI

@main
struct TestProjectApp: App {
    @StateObject var vmCafes = SearchViewModel()
    @StateObject var CafesList = CafesViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vmCafes)
                .environmentObject(CafesList)
        }
    }
}
