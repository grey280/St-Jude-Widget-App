//
//  St_NudeApp.swift
//  Shared
//
//  Created by David on 21/08/2021.
//

import SwiftUI
import WidgetKit
import Intents

@main
struct St_NudeApp: App {
    @Environment(\.scenePhase) private var scenePhase
    #if os(iOS)
    @UIApplicationDelegateAdaptor(StJudeAppDelegate.self) var appDelegate
    #endif
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase) { newValue in
                    if newValue == .active {
                        WidgetCenter.shared.reloadAllTimelines()
                        if #available(macOS 12.0, *) {
                            if let getAmountRaisedShortcut = INShortcut(intent: GetAmountRaisedIntent()) {
                                INVoiceShortcutCenter.shared.setShortcutSuggestions([getAmountRaisedShortcut])
                            }
                        }
                    }
                }
        }
    }
}
