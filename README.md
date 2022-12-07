# ScrollViewOffset

SwiftUI, Get the offset value of ScrollView

## Supported Platforms

* iOS 13.0

## Usage

```swift
import SwiftUI
import ScrollViewOffset

struct ContentView: View {
    var body: some View {
        ScrollViewOffset(.vertical, showsIndicators: false) { offset in
            print("offset = \(offset)")
        } content: {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}
```

## Installation

You can add ScrollViewOffset to an Xcode project by adding it as a package dependency

From the File menu, select Swift Packages -> Add Package Dependency...
Enter https://github.com/HumorousGhost/ScrollViewOffset into the package repository URL text field.
Link ScrollViewOffset to your application target.
