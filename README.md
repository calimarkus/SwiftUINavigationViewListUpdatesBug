# SwiftUINavigationViewListUpdatesBug

Given the below code, I made a strange observation (on macOS). If a List is wrapped in a NavigationView I suddenly get two updates per click on a row (one on mouseDown - aka holding the mouse click down and not releasing it, one on mouseUp - aka releasing the mouse click). This doesn't happen on a plain simple list, or if it's wrapped in an HStack instead. Does anyone know why and how I can control / change this behavior?

See HStack version in action:

[![HStack based][1]][1]

See NavigationView version in action:

[![NavigationView based][2]][2]
 

```swift
struct ContentView: View {
    @State var selection: Set<Int> = []

    var body: some View {
        List(0..<20, selection: Binding(get: {
            self.selection
        }, set: { val in
            print("set \(val)")
            self.selection = val
        })) { idx in
            Text("\(idx)")
        }

        Color.red
        Color.green
        Color.blue
    }
}

// Wrapped in a HStack, 1 update per row selection is triggered, as expected!
struct HStackVersion: View {
    var body: some View {
        HStack(spacing:0.0) {
            ContentView()
        }
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
```


  [1]: https://i.stack.imgur.com/AQtAc.gif
  [2]: https://i.stack.imgur.com/VQdzT.gif


Also see Stackoverflow: https://stackoverflow.com/questions/72209813/swiftui-list-selection-binding-updates-twice-on-every-click-if-wrapped-in-navig?noredirect=1#comment127581690_72209813
