//
//  DailyNoteClone1App.swift
//  DailyNoteClone1
//
//  Created by juri on 2023/01/28.
//

import SwiftUI

@main
struct DailyNoteClone1App: App {
    @StateObject var store = DiaryStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
