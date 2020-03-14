import Foundation

/// Conforming types provide capability to generate Random instance of themselves.
/// - UseCases:
/// 1. This is particularly during unit tests where one wants to feed input to function.
/// Constant input are bad choices and random input exercise the function under tests in
/// different scenarios.
/// 2. Generating test models for prototyping or SwiftUI previewing
/// - Defaults:
/// Most Standard Library types are provided with default implementation.
public protocol Random {
    static var random: Self { get }
}

extension Int: Random {
    public static var random: Int {
        return Int.random(in: ClosedRange(uncheckedBounds: (lower: -127, upper: 128)))
    }
}

extension Float: Random {
    public static var random: Float {
        return Float.random(in: ClosedRange(uncheckedBounds: (lower: -127.0, upper: 128.0)))
    }
}

extension String: Random {
    
    public static var random: String {
        return NSUUID().uuidString
    }
    
    public static var randomAlphabet: String {
        let randomAlphabet = ("a"..."z").characters.pickRandomly
        return String(randomAlphabet)
    }
    
    public static func random(minLength: UInt) -> String {
        let chars = [Character].random(atLeast: minLength) { Character.randomAlphabet }
        return String(chars)
    }
    
}

extension Character: Random {
    
    public static var random: Character {
        return String.random(minLength: 1).first!
    }
    
    public static var randomAlphabet: Character {
        return ("a"..."z").characters.pickRandomly
    }
}

extension ClosedRange where Bound == Unicode.Scalar {
    var range: ClosedRange<UInt32>  { return lowerBound.value...upperBound.value }
    var scalars: [Unicode.Scalar]   { return range.compactMap(Unicode.Scalar.init) }
    var characters: [Character]     { return scalars.map(Character.init) }
}

extension Bool: Random {
    
    public static var random: Bool {
        return Bool.random()
    }
    
}

extension Array: Random where Element: Random {

    public static var random: Array<Element> {
        return random(atLeast: 0)
    }

    /// Random but at least contains 1 item
    public static var random1: Array<Element> {
        var thisRand = self.random
        while thisRand.isEmpty {
            thisRand = self.random
        }
        return thisRand
    }
    
    /// Returns array with atLeast count and might be up to 20 more.
    public static func random(atLeast count: UInt, generation: () -> Element = { Element.random } ) -> Array<Element> {
        let randomRange = ClosedRange(uncheckedBounds: (lower: Int(count), upper: Int(count) + 20))
        let range = 0..<Int.random(in: randomRange)
        return range.map {_ in generation() }
    }
    
    public static func random(times count: Int) -> [Element] {
        let randoms = random(atLeast: UInt.init(count), generation: { Element.random })
        return randoms.suffix(count)
    }

}

extension Dictionary: Random where Key: Random, Value: Random {

    public static var random: Dictionary<Key, Value> {
        return [Int].random.reduce(into: [Key: Value]()) { res, _ in
            res[Key.random] = Value.random
        }
    }

    /// Random but at least contains 1 item
    public static var random1: Dictionary<Key, Value> {
        var thisRand = self.random
        while thisRand.isEmpty {
            thisRand = self.random
        }
        return thisRand
    }
}

extension RandomAccessCollection where Index == Int {

    var pickRandomly: Element {
        let randomIndex = Int.random(in: ClosedRange(uncheckedBounds: (lower: 0, upper: self.count - 1)))
        return self[randomIndex]
    }

}


extension Optional: Random where Wrapped: Random {
    
    public static var random: Optional<Wrapped> {
        let shouldContainValue = Bool.random
        return shouldContainValue ? .some(.random) : .none
    }
    
}

extension UInt: Random {
    public static var random: UInt {
        return UInt((0..<127).pickRandomly)
    }
}

