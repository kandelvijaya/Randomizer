# Randomizer

  Conforming types to `Random` provide capability to generate Random instance of themselves.
  
```swift
let randomInts = [Int].random
let isSuccess = Bol.random
let randomDict = [String: Double].random

// misc
let randomDictWithAtLeast1Item = [String: Double].random1 
let random10Ints = [Int].random(times: 10)
```
  
  ## UseCases:
  1. This is particularly during unit tests where one wants to feed input to function.
  Constant input are bad choices and random input exercise the function under tests in
  different scenarios.
  2. Generating test models for prototyping or SwiftUI previewing

## Defaults:
  Most Standard Library types are provided with default implementation.

## Installation: Swift Package Manager

The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler. 

Once you have your Swift package set up, adding Randomizer as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```
dependencies: [
.package(url: "https://github.com/kandelvijaya/Randomizer.git", from: "1.0.0")
]
```
