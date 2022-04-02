import UIKit

var greeting = "Selamat Datang di Topik lanjutan dari Closure"

## Closure adalah tipe reference

contoh fungsi untuk incremental
```
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let naik10 = makeIncrementer(forIncrement: 10)
naik10()
naik10()
//
let buatFungsiNaik = { (interval: Int ) -> () -> Int in
    var jumlahTotal = 0
    func incrementer() -> Int {
        jumlahTotal += interval
        return jumlahTotal
    }
    return incrementer
}

let kenaikan7 = buatFungsiNaik(7)

kenaikan7()
kenaikan7()

let kenaikan11 = buatFungsiNaik(11)
kenaikan11()
```

## escaping closure
```
var completionHandlers: [ () -> Void ] = []

func fungsiDenganEscapingClosure(completionHandler: @escaping () -> Void ) {
    completionHandlers.append(completionHandler)
}

func fungsiDenganNonEscapingClosure(closure: () -> Void ){
    closure()
}

class sebuahKelas {
    var x = 10
    func kerjainSesuatu(){
    fungsiDenganEscapingClosure{
            self.x = 100
        }
        fungsiDenganNonEscapingClosure {
            x = 200
        }
    }
}

let instance = sebuahKelas()

completionHandlers.first?()
print(instance.x)

instance.kerjainSesuatu()
print(instance.x)


completionHandlers.first?()
print(instance.x)

class kelasLain {
    var x = 5
    func kerjainSesuatu() {
        fungsiDenganEscapingClosure {
            [self] in x = 15
        }
        fungsiDenganNonEscapingClosure {
            x = 25
        }
    }
}

let instanceLain = kelasLain()
instanceLain.kerjainSesuatu()
print(instanceLain.x)


completionHandlers[1]()
print(instanceLain.x)

struct sebuahStruk {
    var x = 10
    mutating func kerjainSesuatu() {
        fungsiDenganNonEscapingClosure {
            x = 200
        }
        fungsiDenganEscapingClosure {
            //x = 100
        }
    }
}

//auto closure

var daftarHewan = ["Ayam","Gajah","Buaya","Cicak","Domba","Elang"]
print(daftarHewan)

let hewanDikasihMakan = { daftarHewan.remove(at: 0) }
print(daftarHewan)

print("sekarang giliran \(hewanDikasihMakan())!")
print(daftarHewan)

func kasihMakan(hewan giliran: () -> String ) {
    print("lagi ngasih makan \(giliran())!")
}

kasihMakan(hewan: { daftarHewan.remove(at: 0) })

func kasihMakanLagi(hewan hewanDiKasihMakan: @autoclosure() -> String ){
    print("skrg lagi ngasih makan \(hewanDiKasihMakan())!")
}


kasihMakanLagi(hewan: daftarHewan.remove(at: 0))

var hewanDikasihMakanClosure: [ () -> String ] = []

func kumpulanHewanYgDikasihMakan(_ hewanDikasihMakan: @autoclosure @escaping () -> String ){
    hewanDikasihMakanClosure.append(hewanDikasihMakan)
}

kumpulanHewanYgDikasihMakan(daftarHewan.remove(at: 0))
kumpulanHewanYgDikasihMakan(daftarHewan.remove(at: 0))

print("terdapat \(hewanDikasihMakanClosure.count) closure")

print(daftarHewan)

for hewanDikasihMakanClosure in hewanDikasihMakanClosure {
    print("lagi ngasih makan \(hewanDikasihMakanClosure())")
}

print(daftarHewan)
```
