//
//

import SwiftUI

@main
struct testApp: App {
    var body: some Scene {
        Group {
            WindowGroup("HStack (as expected)") {
                HStackVersion()
            }.handlesExternalEvents(matching: Set(arrayLiteral: "HStack"))

            WindowGroup("NavigationView (too many updates)") {
                NavigationViewVersion()
            }.handlesExternalEvents(matching: Set(arrayLiteral: "NavigationView"))
        }
    }
}

enum OpenWindows {
    static func open(_ name: String) {
        if let url = URL(string: "testApp://\(name)") {
            NSWorkspace.shared.open(url)
        }
    }
}
