import Foundation

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int{
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let naik10 = makeIncrementer(forIncrement: 10)
naik10()
naik10()

let buatFungsiNaik = { (interval: Int) -> () -> Int in
    var jumlahTotal = 0
    func incrementer() -> Int{
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

// ## escaping

var completionHandlers: [ () -> Void ] = []

func fungsiDengaanEscapingClosure(completionHandler: @escaping () -> Void ) {
    completionHandlers.append(completionHandler)
}

func fungsiDenganNonEscapingClossure(closure: () -> Void ){
    closure()
}

class sebuahKelas {
    var x = 10
    func kerjainSesuatu(){
        fungsiDengaanEscapingClosure {
            self.x = 100
        }
        fungsiDenganNonEscapingClossure {
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

struct sebuahStruk {
    var x = 10
    mutating func kerjainSesuatu(){
        fungsiDenganNonEscapingClossure {
            x = 200
        }
        fungsiDengaanEscapingClosure {
            ///x = 100
        }
    }
}


// auto closure

var daftarHewan = ["Ayam","Gajah","Buaya","Cicak","Domba","Elang"]
print(daftarHewan)

let hewanDikasihMakan = { daftarHewan.remove(at: 0)}
print(daftarHewan)
print("ngasih makan hewan apa \(hewanDikasihMakan())")
print(daftarHewan)

func kasihMakan(hewan giliran: () -> String ) {
    print("lagi ngaasih makan \(giliran())")
}

kasihMakan(hewan: { daftarHewan.remove(at: 0)} )
print(daftarHewan)

func kasihMakanLagi(hewan hewanDikasiMakan: @autoclosure () -> String ) {
    print("skrg lagi ngasih makan \(hewanDikasiMakan())")
}

kasihMakanLagi(hewan: daftarHewan.remove(at: 0))
print(daftarHewan)

var kumpulanHewanYgDiKasihMakan: [ () -> String ] = []

func kumpulanKasihMakanHewan(_ hewanDikasihMakan: @autoclosure @escaping () -> String ) {
    kumpulanHewanYgDiKasihMakan.append(hewanDikasihMakan)
}

kumpulanKasihMakanHewan(daftarHewan.remove(at: 0))
kumpulanKasihMakanHewan(daftarHewan.remove(at: 0))

print(daftarHewan)

for hewanClosure in kumpulanHewanYgDiKasihMakan {
    print("lagi ngasih makan \(hewanClosure())")
}

print(daftarHewan)
