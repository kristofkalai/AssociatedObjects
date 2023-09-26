//
//  ContentView.swift
//  Example
//
//  Created by Kristóf Kálai on 2023. 09. 26..
//

import SwiftUI
import AssociatedObjects

private struct AssociatedObjectKeys {
    static var testValue = "testValue"
}

// Declaration somewhere, e.g. in another package ...
protocol TestProtocol { }

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

final class ViewModel: TestProtocol, ObservableObject {
    init() {
        assert(testValue == .zero)
        print(testValue)
        let newValue = 10
        testValue = newValue
        assert(testValue == newValue)
        print(testValue)
    }
}

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
