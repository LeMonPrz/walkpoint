//
//  Login_FormApp.swift
//  Login Form
//
//  Created by Atichet Ekchiewchan on 12/3/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct Login_FormApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
