# UserDefaultsManager
Simple manager for User Defaults in Swift


## How it works
UserDefaultsManager uses generics type to save and retrieve all type of data:
- Int
- String
- Character
- Bool
- Double
- Float
- **Codable**


The only thing you have to do is to pass your data throght the ***Storable*** struct:
`Storable(value: "AnykindOfValue")`

# How to use it
## Example with Codable
```swift
struct Person: Codable {
    let name: String
    let surname: String
    let age: Int
    let married: Bool
}

let johnSmith = Person(name: "John", surname: "Smith", age: 30, married: true)

// saving the Person model
UserDefaultsManager.shared.setValue(key: .custom("john"), data: Storable(value: johnSmith))

// retrieving the Person model
let personSaved = UserDefaultsManager.shared.getValue(.custom("john"), model: Person.self)
```

## Example with Built-in Data Types
```swift
// saving a String value
let hello = "hello"
UserDefaultsManager.shared.setValue(key: .custom("hello"), data: Storable(value: hello))

// saving an Int value
let myAge = 24
UserDefaultsManager.shared.setValue(key: .custom("myAge"), data: Storable(value: myAge))

// retrieving the String value
let helloSaved = UserDefaultsManager.shared.getValue(.custom("hello"), model: String.self)

// retrieving the Int value
let myAgeSaved = UserDefaultsManager.shared.getValue(.custom("myAge"), model: Int.self)
```

## Remove the preference:
```swift
UserDefaultsManager.shared.remove(key: .custom("mykey"))
```

# Author
@gemix95 emmanuele.corporente@gmail.com
