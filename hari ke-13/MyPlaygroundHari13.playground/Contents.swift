import Foundation
//

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
        return nama + ( marga != nil ? " " + marga! : "" )
    }
}

var namaMenteri = NamaOrang(nama: "Luhut")
print(namaMenteri.namaLengkap)

namaMenteri.marga = "Panjaitan"
print(namaMenteri.namaLengkap)

// kenapa kok di swift protokol

// putar sekrup

// putar sebuah object tipe apapun yang sesui dengan pengerat

struct Sekrup {
    var nama: String
}

func putar( _ sekrup: Sekrup ){
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

struct Mur: Pengerat {
    var pemutar: String
    var nama: String
}

struct Knop: Pengerat {
    var pemutar: String
    var nama: String
    
    init() {
        pemutar = "tang"
        nama = "knop bintang"
    }
    
    init(nama: String) {
        self.nama = nama
        pemutar = "taang"
    }
    
    init(_ nama: String, _ pemutar: String) {
        self.nama = nama
        self.pemutar = pemutar
    }
}

func eratkan(_ pengerat: Pengerat) {
    print("putar \(pengerat.nama) menggunakan \(pengerat.pemutar)")
}

var baut = Baut(nama: "baut")
baut.nama = "bautQ"

eratkan(baut)

var knop = Knop("mur", "tang")
eratkan(knop)

var mur = Mur(pemutar: "tang", nama: "mur")
eratkan(mur)


protocol SebuahProtokolDengaanMethods {
    static func sebuahTipeMethod()
    func acak() -> Int
}


protocol UIDGenerator {
    func acak() -> String
}

class UIDGeneratorV1 : UIDGenerator {
    func acak() -> String {
        print(Int64(Date().timeIntervalSince1970 * 1000))
        return "ini acak versi 4"
    }
}

var uidv1 = UIDGeneratorV1()
print(uidv1.acak())

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


protocol SebijiProtokol {
    init(sebuahParameter: Int)
}

protocol SebongkahProtokol {
    init()
}

class SebijiKelas: SebijiProtokol {
    required init(sebuahParameter: Int) {
        //kode disini
    }
}

class KelasSuper {
    init() {
        //kode
    }
}

class SubKelas: KelasSuper, SebongkahProtokol {
    // required dari protocol, override dari kelas
    required override init() {
        //kode disini
    }
}

protocol RandomGenerator {
    func random() -> Double
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
        return ( Int(angka.remainder(dividingBy: Double(sisi))) + sisi ) % sisi + 1
    }
}

var dadu8 = dadu(sisi: 8, generator: generator)

for _ in 1...8 {
    //
    print(dadu8.lempar())
}

