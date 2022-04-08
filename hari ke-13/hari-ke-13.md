# Protocol

Selamat Datang di hari ke-13 Tantangan100hari SwiftUI bersama Stargan

Link youtube : https://youtu.be/JHHPPnc2v6Y

Tantangan100hari SwiftUI adalah sebuah program untuk belajar SwiftUI dalam 100 hari

Setiap hari kita akan belajar paling lama 1 jam tentang satu topik dalam Swift dan SwiftUI

bagikan pengelaman belajar anda di media sosial,

pastikan anda subscribe channel stargan untuk mendapatkan update setiap hari selama 100 hari

<https://www.youtube.com/channel/UCLk_BuhUhc70L0XAZ3C0McQ>


topik kita hari ini Protocol

Protocol mendefinisikan sebuah cetak biru / blueprint untuk methods, property, atau yang lain,

Protocol ini kemudian dapat di adopsi sebuah class, struc, maupun enum untuk mengimplementasi persyaratan

tipe apapun yang memenuhi persyaratan sebuah Protocol dapat dikatakan sesuai dengan Protocol

atau conform to that Protocol

kita pasti akan menggunakan Protocol ini di proyek pertama SwiftUI kita



Chapters:
0:00 Pembukaan
0:25 sintak protocol
9:48 kenapa di Swift ada protocol
21:38 persyaratan method
26:19 persyaratan mutating method
30:19 persyatan Initializer
34:14 protocol sebagai type


## sintak untuk mendefisikan protocol

```
protocol NamaProtokol {

}

protocol ProtokolLainnya {

}

struc SebuahStruck: NamaProtokol, protokolLainnya {
    // conform to namaProtokol, ProtokolLainnya
}

class namaKelas: SuperKelas, NamaProtokol, ProtokolLainnya {

}

protocol NamaProtokol {
  var kuduDapatDiatur: Int { get set }
  var gakHarusKuduBisaDiatur: Int { get }
}

protocol ProtokolLainnya {
  static tipeProperti: String { get set }
}


protocol CukupSatuProperti {
  var nama: String { get set }
}

protocol NamaLengkap {
  var namaLengkap: String { get }
}

struct NamaOrang: CukupSatuProperti, NamaLengkap {
    var nama: String
    var marga: String?
    var namaLengkap: String {
        return nama + (marga != nil ? " " + marga! :  "" )
    }
}

var namaMenteri = NamaOrang(nama: "Luhut")
namaMenteri.marga = "Panjaitan"

print(namaMenteri.namaLengkap)

```


## kenapa di Swift ada protocol

karena dengan protocol kita bisa menentukan bagaimana sebuah Tipe bekerja, method apa aja yg harus dimiliki, properti apa aja yg mesti dipunyai, Swift akan memaksa untuk agar aturan itu dipenuhi jika kita ingin sebuah tipe dikatakan sesuai dengan protocol

dalam prakteknya dengna protocol kita dapat memperlakukan kode kita secara lebih generic

misal kan method putar harus menerima obyek sekrup

dengan protocol kita bisa mengatakan methods putar dapat menerima object apapun yang sesuai dengan pengunci

```
import UIKit

var greeting = "Hello, stargan"


struct Sekrup {
    var nama: String
}

func putar(_ sekrup: Sekrup){
    print("putar \(sekrup.nama)")
}

protocol Pengerat {
    var nama: String { set get }
    var pemutar: String { get }
}

struct Baut: Pengerat {
    let pemutar = "Tang"
    var nama: String
}


struct Mur: Pengerat  {
    var pemutar: String
    var nama: String
}

struct Knop: Pengerat  {
    var pemutar: String
    var nama: String

    init() {
        pemutar = "tang"
        nama = "knop bintang"
    }

    init(nama: String) {
        self.nama = nama
        pemutar = "tang"
    }

    init(_ nama: String,_ pemutar: String) {
        self.nama = nama
        self.pemutar = pemutar
    }

}

func eratkan(_ pengerat: Pengerat){
    print("putar \(pengerat.nama) menggunakan \(pengerat.pemutar)")
}

// var baut = Baut() // harus dengan argument
var baut = Baut(nama: "baut")
baut.nama = "bautQ"

var knop = Knop(nama: "knop")
var knop2 = Knop("knop2", "tang")

var mur = Mur(pemutar: "tang", nama: "mur")

eratkan(baut)

eratkan(knop)

eratkan(mur)

```


## Method pada protocol,  persyaratan method

```
protocol SebuahProtokolDenganMethods {
  static func sebuahTipeMethod()
  func acak() -> Int
}
```

contoh

```
import Foundation

protocol UIDGenerator {
  func acak() -> String
}

class UIDGeneratorV1: UIDGenerator {
    func acak() -> String {
        print(Int64(Date().timeIntervalSince1970 * 1000))
        return "ini acak versi 4"
    }
}

var uidv1 = UIDGeneratorV1()
print(uidv1.acak())
```

## mutating method requirement / persyaratan mutating method

ada kalanya sebuah method perlu memodifikasi instance nya, untuk instance method pada sebuah value types (struct dan enum)
kita tempatkan keyword **mutating** di depan keyword func

proses ini sudah kita bahas dalam video sebelumnya

contoh
```

protocol Toggleable {
    mutating func toggle()
}

enum Saklar: Toggleable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var saklarLampu = Saklar.off
saklarLampu.toggle()
print(saklarLampu)
```


## persyaratan initializer

```
import Foundation

protocol SebijiProtokol {
  init(sebuahParameter: Int)
}

protocol SebongkahProtokol {
    init()
}

// implementasi persyarataan inializer pada class

class SebijiKelas: SebijiProtokol {
    required init(sebuahParameter: Int) {
        // kerjain sesuai disini
    }
}


class KelasSuper {
    init() {
        //
    }
}


class SubKelas: KelasSuper, SebijiProtokol {
    required init(sebuahParameter: Int) {
        // code here
    }
}

class KelasApalagi: KelasSuper, SebongkahProtokol {
    // required dari protocol, override daari kelas
    required override init() {
        //
    }
}

```

## protocol sebagai type

```
import Foundation

// protocol as Type
import Foundation

// protocol as Type

protocol RandomGenerator {
    func random() -> Double
}

class LinearGenerator: RandomGenerator {
    var nilaiAcakTerakhir = 11.0
    let m = 83948.0
    let a = 33347.0
    let c = 9875837.0

    func random() -> Double {
        nilaiAcakTerakhir = ( (nilaiAcakTerakhir * c + a).remainder(dividingBy: m))
        return nilaiAcakTerakhir / m
    }
}

class GeneratorApaAja: RandomGenerator {
    var nilaiAcakTerakhir = 42.0
    let m = 43446494.0
    let a = 3877.0
    let c = 29573.0

    func random() -> Double {
        nilaiAcakTerakhir = ( (nilaiAcakTerakhir * c + a ).remainder(dividingBy: m) )
        return nilaiAcakTerakhir / m
    }
}

let generator = GeneratorApaAja()
print(generator.random())

class dadu {
    let sisi: Int
    let generator: RandomGenerator

    init(sisi: Int, generator: RandomGenerator){
        self.sisi = sisi
        self.generator = generator
    }

    func lempar() -> Int {
        let angka = generator.random() * Double(sisi)
        return (Int( angka.remainder(dividingBy: Double(sisi)) ) + sisi ) % sisi + 1
    }
}

var dadu8 = dadu(sisi: 8, generator: generator)

for _ in 1...8 {
    //
    print(dadu8.lempar())
}



```
