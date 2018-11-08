# LogSheet

[![CI Status](https://img.shields.io/travis/b0ttleneck/LogSheet.svg?style=flat)](https://travis-ci.org/b0ttleneck/LogSheet)
[![Version](https://img.shields.io/cocoapods/v/LogSheet.svg?style=flat)](https://cocoapods.org/pods/LogSheet)
[![License](https://img.shields.io/cocoapods/l/LogSheet.svg?style=flat)](https://cocoapods.org/pods/LogSheet)
[![Platform](https://img.shields.io/cocoapods/p/LogSheet.svg?style=flat)](https://cocoapods.org/pods/LogSheet)

## Features

This is my agenda for this repository, 

- [x] Maintain a CSV File which maintain your logs
- [ ] Export CSV File using UIActivityViewController
- [ ] UI ListView which shows all logs with a detail view.
- [ ] Filter Button where, you can filter logs on LogType.
- [ ] Update/Delete Option 


## Installation

LogSheet is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LogSheet'
```

## Usage

0. **Initialize**

```swift
import LogSheet
```

Then, you need a LogSheet object for futher actions,
```swift
let logSheet = LogSheet.instance
```

1. **Create Log**

At any point, you want to create a log then call write(_:) method which expects LogModel() Object. 

```swift

// Structure Your Log Model
let model = LogModel(identifer: 123, name: "New Error ", description: "This is my Error. I should write a detailed explanation", tags: [.buisnessError], type: .verbose, createTimestamp: Date(), updateTimestamp: Date())

// Call Write method to persist
if logSheet.write(log: model) {
    print("Successfully Written")
}
else {
    print("Failed while writing")
}

```

2. **Read Log**

There is a read method which expect LogID if you want to get that particlaur log. Else, You have to pass nil in the parameter.

```swift

// All Logs
if let data = logSheet.read(nil) {
print("Logs Count: \(data.cout)")
}

// Any Particular Log
if let data = logSheet.read(123) {
    print(data.description)
}

```

## Author

Abhishek Kumar Ravi, ab.abhishek.ravi@gmail.com

## License

LogSheet is available under the MIT license. See the LICENSE file for more info.
