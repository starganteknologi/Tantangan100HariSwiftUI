# Property dan Method


Selamat Datang di hari ke-12 Tantangan100hari SwiftUI bersama Stargan

Link youtube : https://youtu.be/3AAAshoBMio

Tantangan100hari SwiftUI adalah sebuah program untuk belajar SwiftUI dalam 100 hari

Setiap hari kita akan belajar paling lama 1 jam tentang satu topik dalam Swift dan SwiftUI

bagikan pengelaman belajar anda di media sosial, rayakan pengetahuan baru anda

pastikan anda subscribe channel stargan untuk mendapatkan update setiap hari selama 100 hari

<https://www.youtube.com/channel/UCLk_BuhUhc70L0XAZ3C0McQ>

topik kita hari ini tentang property dan method

## property

### instance property

instance property adalah property yang dimiliki oleh setiap instance yang kita buat, tiap instance mempunya nilai properti sendiri untuk setiap instance

### type property

kita juga mendefinisikan property yang dimiliki oleh tipe itu sendiri, hanya ada 1 copy dari tipe property, g peduli seberapa banyak instance dari tipe tersebut yang dibuat


Chapters:
0:00 pembukaan
1:20 instance property
2:37 type property
6:00 querying dan setting type property
15:05 instance methods
27:51 mutating type method pada enum
29:44 type methods


```
import UIKit
import CoreFoundation

var greeting = "Hello, stargan"



struct IniStruct {
    //
}

let iniInstance1 = IniStruct()

struct SuatuStruct {
    static var storedTypeProperty = "suatu nilai"
    static var computedTypeProperty: Int {
        return 6
    }
    var instanceProperty = "string"
}

let ss = SuatuStruct(instanceProperty: "dapat diisi")

enum SuatuEnum {
    static var storedTypeProperty = "suatu nilai"
    static var computedTypeProperty: Int {
        return 6
    }
}

class suatuClass {
    static var storedTypeProperty = "suatu nilai"
    static var computedTypeProperty: Int {
        return 6
    }
    class var overrideableComputerTypeProperty: Int {
        return 107
    }
}

// querying dan setting type property

print(SuatuStruct.storedTypeProperty)
SuatuStruct.storedTypeProperty = "nilai lainnya"
print(SuatuStruct.storedTypeProperty)
print(SuatuEnum.computedTypeProperty)
print(suatuClass.computedTypeProperty)

//

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    var currentLevel = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                // store this as new overall maximum input level
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)

print(AudioChannel.maxInputLevelForAllChannel)
rightChannel.currentLevel = 11
print(AudioChannel.maxInputLevelForAllChannel)

```

## Method

### instance method

instance method adalah methods yang dimiliki oleh instance dari suatu class, struct atau enum

kita membuat instance method di dalam kurung kurawal.
instance methods hanya dapat dipanggil dari satu instance

```
// instance methods
class Counter {
    var count = 0
    func increment() {
        count += 1
    }

    func increment(by amount: Int) {
        count += amount
    }

    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
print(counter.count)
counter.increment(by: 5)
print(counter.count)
print(counter.reset())
print(counter.count)

// class adalah tipe reference

let counter2 = Counter()
print(counter.count)


struct Titik {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let suatuTitik = Titik(x: 4.0, y: 5.0)
if suatuTitik.isToTheRightOf(x: 1.0) {
    print("titik ini di sebelah kanan dari garis x == 1.0")
}

// merubah value type dari dalam instance methods

struct TitikDapatDigeser {
    var x = 0.0, y = 0.0
    mutating func geserSebesar(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var titikLainnya = TitikDapatDigeser(x: 1.0, y: 1.0)
titikLainnya.geserSebesar(x: 2, y: 3)
print("titik ini sekarang ada di \(titikLainnya.x) , \(titikLainnya.y)")


// assigning to self within mutating method

struct TitikSendiri {
    var x = 0.0, y = 0.0
    mutating func geserSebesar(x deltaX: Double, y deltaY: Double) {
        self = TitikSendiri(x: x + deltaX, y: y + deltaY)
    }
}

var titikSendiri = TitikSendiri(x: 2, y: 2)
titikSendiri.geserSebesar(x: 1, y: 3)
print(titikSendiri.x)

// mutating methods for enumeration

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var bubleLight = TriStateSwitch.low
bubleLight.next()
print(bubleLight)

// type methods

class SuatuClass {
    class func suatuTypeMethod() {
        //code goes here
    }
}

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int){
        if level > highestUnlockedLevel {
            highestUnlockedLevel = 1
        }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String

    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }

    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Alma")
player.complete(level: 1)
print("level tertinggi terbuka adalah \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "zeta")
if player.tracker.advance(to: 6) {
    print("pemain skrg berada di level 6")
} else {
    print("level 6 belum kebuka")
}

```
