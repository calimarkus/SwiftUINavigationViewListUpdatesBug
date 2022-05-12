//
//

import SwiftUI

struct ContentView: View {
    @State var selection: Set<Int> = []
    @State var updateCount = 0
    @State var updates: [String] = []

    var body: some View {
        List(0 ..< 10, selection: Binding(get: {
            self.selection
        }, set: { val in
            updateCount += 1
            updates.append("\(updateCount): \(val)")
            self.selection = val
        })) { idx in
            Text("\(idx)")
        }.frame(width: 200.0)

        List {
            Text("Update count: \(updateCount)")
                .font(.title)
            ForEach(updates, id: \.self) { update in
                Text(update)
                    .font(.system(.body, design: .monospaced))
            }
        }
    }
}

// Wrapped in a HStack, 1 update per row selection is triggered, as expected!
struct HStackVersion: View {
    var body: some View {
        HStack(spacing: 0.0) {
            ContentView()
        }
        .onAppear {
            OpenWindows.open("NavigationView")
        }
        .frame(width: 800.0)
    }
}

// Wrapped in a NavigationView, 2 updates per row selection are triggered??
struct NavigationViewVersion: View {
    var body: some View {
        NavigationView {
            ContentView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HStackVersion()
            .frame(height: 200)
        NavigationViewVersion()
            .frame(height: 200)
    }
}
