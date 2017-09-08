# GradientLoading

![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)

- Easy to use Loading View in iOS

![alt tag](Images/GradientLoading.gif)

## Requirements
- iOS 8.0+
- Swift 3.0

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

#### CocoaPods
GradientLoading is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GradientLoading'
```

## Usage
```swift
// Setup Text, Font, Stroke Color, Stroke Width.
GradientLoading.shared.setFontAttributes(text: "Jennie")

// use setCollectionColors or setColors.
GradientLoading.shared.setCollectionColors(.aurora)
// GradientLoading.shared.setColors([])

GradientLoading.shared.show()
```

## Author

feather, dev.thefeather@gmail.com

## License

GradientLoading is available under the MIT license. See the LICENSE file for more info.
