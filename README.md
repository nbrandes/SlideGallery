# SwiftUI SlideGallery

A SwiftUI sliding gallery that can display views of any type.

<img src=https://raw.githubusercontent.com/nbrandes/SlideGallery/main/Docs/Media/slidegallery.gif width=300 align="right" />

## Contents

- [Add the Package](#package)
- [Usage](#usage)
- [Parameters](#parameters)
- [Example](#example)

## Package

### For Xcode Projects

File > Swift Packages > Add Package Dependency: https://github.com/nbrandes/SlideGallery

### For Swift Packages

Add a dependency in your `Package.swift`

```swift
.package(url: "https://github.com/nbrandes/SlideGallery.git"),
```

## Usage

Initialize SlideGallery with an array of views

```swift
SlideGallery(views)
```

## Parameters

SlideGallery can be initialized with the following parameters

Required:
* `views: [AnyView]` - An array of views to display

Optional:
* `height: CGFloat` - Height of the gallery
* `tintColor: Color` - Color used to tint the controls

```swift
SlideGallery(views, height: 400, tintColor: .blue)
```

## Example

```swift
import SwiftUI
import SlideGallery

struct ContentView: View {
    
    let views = [AnyView(View1()), AnyView(View2()), AnyView(View3())]
    
    var body: some View {
        SlideGallery(views)
    }
}

struct View1: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2019/01/25/11/18/girl-3954232_1280.jpg")){ image in
            image.image?
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .scaledToFit()
                .clipped()
        }
    }
}

struct View2: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://media.istockphoto.com/id/505872798/photo/portrait-of-beautiful-girl-at-night.jpg?s=1024x1024&w=is&k=20&c=ERkdHgXzBQqhCx6C0D5WmEjbFcETV-xx2rtWX25rT50=")){ image in
            image.image?
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .scaledToFit()
                .clipped()
        }
    }
}

struct View3: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://media.istockphoto.com/id/1330558678/photo/kabukicho-shinjuku-at-night.jpg?s=1024x1024&w=is&k=20&c=hVrI4ULidUBMzIBypa22-OvcTcFlmPu9xlXWHPD19b8=")) { image in
            image.image?
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .scaledToFit()
                .clipped()
        }
    }
}
```


