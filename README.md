# AssociatedObjects
Helper functions for associated objects! 🛟

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/AssociatedObjects", exact: .init(0, 0, 2))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## Usage

```swift
private struct AssociatedObjectKeys {
    static var testValue = "testValue"
}

// Declaration somewhere, e.g. in another package ...
// protocol TestProtocol { }

extension TestProtocol {
    var testValue: Int {
        get {
            getAssociatedObject(self, AssociatedObjectKeys.testValue, defaultValue: .zero)
        }
        nonmutating set {
            setAssociatedObject(self, AssociatedObjectKeys.testValue, newValue)
        }
    }
}

final class Class: TestProtocol {
    init() {
        assert(testValue == .zero)
        print(testValue)
        let newValue = 10
        testValue = newValue
        assert(testValue == newValue)
        print(testValue)
    }
}
```

For details see the Example app.
