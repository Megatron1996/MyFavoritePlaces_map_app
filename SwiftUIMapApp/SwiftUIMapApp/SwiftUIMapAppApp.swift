//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by Zohidjon on 04/03/26.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
//            ContentView()
        }
    }
}
