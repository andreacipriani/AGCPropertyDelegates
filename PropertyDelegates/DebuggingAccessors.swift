import Foundation

@propertyDelegate
public final class DebuggingAccessors<T> {
    private let label: String
    private var _value: T?

    public init(_ label: String, shouldPrintCaller: Bool = true) {
        self.label = label
    }
    
    public var value: T? {
        get {
            print("get \(label) = \(makeDescription(of: _value)) on \(currentThreadDescription)")
            return _value
        } set {
            print("set \(label) = \(makeDescription(of: value)) on \(currentThreadDescription)")
            _value = newValue
        }
    }

    private var currentThreadDescription: String {
        let fullDescription = Thread.current.description
        if let range = fullDescription.range(of: "number = ") {
            let threadNumber = fullDescription[range.upperBound...].prefix(1)
            return String("thread: \(threadNumber)")
        }
        return fullDescription
    }
    
    private func makeDescription(of optionalValue: T?) -> String {
        return optionalValue != nil ? "\(optionalValue!)" : "nil"
    }
}

public final class DebuggingAccessorsExample {
    @DebuggingAccessors("name")
    var name: String
    
    @DebuggingAccessors("surname")
    var surname: String
    
    func run() {
        name = "Andreo"
        DispatchQueue(label: "bg").async {
            self.name = "Andrea"
        }
        
        surname = "Capriani"
        DispatchQueue(label: "bg").async {
            self.surname = "Cipriani"
        }
    }
}
