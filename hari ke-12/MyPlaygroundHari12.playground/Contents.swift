
var greeting = "Hello Stargan"

// instance properti

struct IniStruct {
    var iniProperty: String
}

let iniInstance1 = IniStruct(iniProperty: "saatu")

let iniInstance2 = IniStruct(iniProperty: "dua")

print(iniInstance1.iniProperty)
print(iniInstance2.iniProperty)

// type properti

struct SuatuStruct {
    static var storedTypeProperty = "suatu nilai"
    static var computedTypeProperty: Int {
        return 6
    }
    var instanceProperty = "string"
}

let ss = SuatuStruct(instanceProperty: "ini adalah instance property")

let ss1 = SuatuStruct(instanceProperty: "kita isi yang lain")


enum SuatuEnum {
    static var storedTypeProperty = "suatu nilai"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SuatuClass {
    static var storedTypeProperty = "suatu nilai"
    static var computedTypeProperty: Int {
        return 9
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
print(SuatuClass.computedTypeProperty)

print(ss.instanceProperty)


struct AudioChannel {
    static let thresholdLevel = 10
    static var maksInputLevelUntukSemuaChannel = 0
    
    var levelSekarang = 0 {
        didSet {
            if levelSekarang > AudioChannel.thresholdLevel {
                // capping
                levelSekarang = AudioChannel.thresholdLevel
            }
            
            if levelSekarang > AudioChannel.maksInputLevelUntukSemuaChannel {
                AudioChannel.maksInputLevelUntukSemuaChannel = levelSekarang
            }
        }
    }
}

var channelKiri = AudioChannel()
var channelKanan = AudioChannel()

channelKiri.levelSekarang = 7
print(channelKiri.levelSekarang)

print(channelKanan.levelSekarang)
channelKanan.levelSekarang = 6

print(channelKanan.levelSekarang)

print(AudioChannel.maksInputLevelUntukSemuaChannel)


// METHODS

// INSTANCE METHOD

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
counter.increment(by: 7)
print(counter.count)

let counter2 = Counter()

print("counter2 \(counter2.count)")

struct Titik {
    var x = 0.0 , y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let suatuTitik = Titik(x: 4.0, y: 3.0)
if suatuTitik.isToTheRightOf(x: 2) {
    print("ya diebelah kanan nin")
}


struct TitikDapatDigeser {
    var x = 0.0 , y = 0.0
    
    mutating func geserSebesar(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var titikLainnya = TitikDapatDigeser(x: 1, y: 1)
titikLainnya.geserSebesar(x: 2, y: 3)
print("titik ini sekarang ada di \(titikLainnya.x) , \(titikLainnya.y)")

titikLainnya.y = 12
print("titik ini sekarang ada di \(titikLainnya.x) , \(titikLainnya.y)")

struct TitikSendiri {
    var x = 0.0, y = 0.0
    mutating func geserSebesar(x deltaX: Double, y deltaY: Double) {
        self = TitikSendiri(x: x + deltaX, y: y + deltaY)
    }
}

var titikSendiri = TitikSendiri(x: 2, y: 3)
titikLainnya.geserSebesar(x: 1, y: 3)

// method method for enumeration
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

class SuatuClassLain {
    class func suatuTypeMethod() {
        //code goes here
    }
}

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock (_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
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
    
    func complet(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
    playerName = name
    }
}

var player1 = Player(name: "Alma")
player1.complet(level: 1)
print("level tertinggi terbuka adalah \(LevelTracker.highestUnlockedLevel)")

player1.complet(level: 20)
print("level tertinggi terbuka adalah \(LevelTracker.highestUnlockedLevel)")

var player2 = Player(name: "zeta")
if player2.tracker.advance(to: 10) {
    print("pemain skrg berada di level 10")
} else {
    print("level 10 belum kebuka")
}

