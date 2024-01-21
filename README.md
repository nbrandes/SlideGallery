# SwiftUI SlideGallery

A sliding gallery that can display views of any type, for SwiftUI.

<img src=https://raw.githubusercontent.com/nbrandes/SlideGallery/main/Docs/Media/slidegallery.gif width=300 align="right" />

## Contents

- [Add the Package](#package)
- [Usage](#usage)
- [Parameters](#parameters)
- [Example](#example)

## Package

### For Xcode Projects

File > Add Package Dependencies > Enter Package URL: https://github.com/nbrandes/SlideGallery

### For Swift Packages

Add a dependency in your `Package.swift`

```swift
.package(url: "https://github.com/nbrandes/SlideGallery.git"),
```

## Usage

Initialize `SlideGallery` with an array of views

```swift
SlideGallery(views)
```

## Parameters

`SlideGallery` can be initialized with the following parameters

Required:
`views: [AnyView]` - An array of views to display

Optional:
`height: CGFloat` - (Default 400) - Height of the gallery
`controlColor: Color` - (Default .red)- Color used to tint the controls
`autoScroll: Bool` - (Deafault false) - Enable/Disable Autoscrolling
```swift
SlideGallery(views, height: 400, controlColor: .red, autoScroll: true)
```

## Example

```swift
import SwiftUI
import SlideGallery

let url1 = "https://cdn.pixabay.com/photo/2019/01/25/11/18/girl-3954232_1280.jpg"
let url2 = "https://media.istockphoto.com/id/505872798/photo/portrait-of-beautiful-girl-at-night.jpg?s=1024x1024&w=is&k=20&c=ERkdHgXzBQqhCx6C0D5WmEjbFcETV-xx2rtWX25rT50="
let url3 = "https://media.istockphoto.com/id/1330558678/photo/kabukicho-shinjuku-at-night.jpg?s=1024x1024&w=is&k=20&c=hVrI4ULidUBMzIBypa22-OvcTcFlmPu9xlXWHPD19b8="

struct ContentView: View {
    let views = [
        AnyView(ImageView(url: url1)),
        AnyView(ImageView(url: url2)),
        AnyView(ImageView(url: url3)),
        AnyView(CustomView()),
        AnyView(ListView()),
    ]
    var body: some View {
        SlideGallery(views, controlColor: .blue, autoScroll: true)
    }
}

struct ImageView: View {
    var url: String
    var body: some View {
        AsyncImage(url: URL(string: url)){ image in
            image.image?
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .scaledToFit()
                .clipped()
        }
    }
}

struct CustomView: View {
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .foregroundColor(.gray)
            Button("Sign Up") {
                //Do something
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ListView: View {
    var body: some View {
        List {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
        }
    }
}
```


