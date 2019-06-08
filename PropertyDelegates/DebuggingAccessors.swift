import Foundation

@propertyDelegate
public final class DebuggingAccessors<T> {

    private let label: String
    private var _value: T?

    public init(_ label: String) {
        self.label = label
    }
    
    public var value: T? {
        get {
            print("Accessed property * \(label) * with value \(makeDescription(of:_value)) on thread \(currentThreadDescription)")
            return _value
        } set {
            print("Property * \(label) * set from \(makeDescription(of: value)) to \(makeDescription(of: newValue)) on thread \(currentThreadDescription)")
            _value = newValue
        }
    }
    
    private var currentThreadDescription: String {
        return Thread.current.description
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
