import UIKit

var greeting = "Hello, stargan"

extension String {
  // implementasi
}

protocol SebuahProtokol {

}

protocol SebongkahProtokol {

}


extension String: SebuahProtokol, SebongkahProtokol {

}

extension Double {
    var km: Double { return self * 1000 }
    var m: Double { return self }
    var cm: Double { return self / 100  }
    var mm: Double { return self / 1000 }
    var ft: Double { return self / 3.28084 }
}

let satuInchi = 25.0.mm

let luas = 50.0.cm * satuInchi

print("satu inchi = \(satuInchi) meter")
print("luas \(luas)")

struct Ukuran {
    var panjang: Double = 0.0 , lebar: Double = 0.0
}

struct Titik {
    var x: Double = 0.0, y: Double = 0.0
}

struct Persegi {
    var titikAwal = Titik()
    var ukuran = Ukuran()
}

let persegi = Persegi()

print(persegi.titikAwal)

let persegiCustom = Persegi(titikAwal: Titik(x: 1.0, y: 1.0) , ukuran: Ukuran(panjang: 2.0 , lebar: 3.0) )

print(persegiCustom.titikAwal)

extension Persegi {
    init(tengah: Titik, ukuran: Ukuran) {
        let titikX = tengah.x - (ukuran.panjang / 2)
        let titikY = tengah.y - (ukuran.lebar / 2)
        self.init(titikAwal: Titik(x: titikX, y: titikY), ukuran: ukuran)
    }
}

let persegiDariTengah = Persegi(tengah: Titik(x: 1.0, y: 1.0) , ukuran: Ukuran(panjang: 2.0 , lebar: 3.0) )

print(persegiDariTengah.titikAwal)

struct Angkutan {
    let nama: String
    let jenis: String
    let jumlahPenumpang: Int
    let massal: Bool
}

extension Angkutan {
    init (nama: String) {
        self.nama = nama
        self.jenis = "angkot"
        self.jumlahPenumpang = 7
        self.massal = false
    }
}

var angkotDefol = Angkutan(nama: "defol", jenis: "bis", jumlahPenumpang: 50, massal: true)
print(angkotDefol.jumlahPenumpang)

var angkot = Angkutan(nama: "A")
print(angkot.jumlahPenumpang)

extension Int {
    func ulangi(fungsi: () -> Void ) {
        for _ in 0..<self {
            fungsi()
        }
    }
}

3.ulangi {
    print("merdeka")
}

extension Int {
    mutating func kuadrat() {
        return self = self * self
    }
}

var angka = 3
angka.kuadrat()

print(angka.kuadrat())

print(angka)


extension Int {
    enum Jenis {
        case negatif, nol, positif
    }

    var jenis: Jenis {
        switch self {
        case 0:
            return .nol
        case let x where x > 0 :
            return .positif
        default:
            return .negatif
        }
    }
}

func printJenisInteger (_ angka: [Int]) {
    for angka in angka {
        switch angka.jenis {
        case .negatif:
            print("-",terminator: " ")
        case .nol:
            print("0",terminator: " ")
        case .positif:
            print("+",terminator: " ")
        }
    }
}

printJenisInteger([5,7,-5,0,-6])

protocol Prokes {
    var tempat: String { get }
    func lakukan()
}

extension Prokes {
    func lakukan() {
        print("pake masker selama di \(tempat)")
    }
}

struct ProkesKelas: Prokes {
    var tempat: String
}

let prokesKelas = ProkesKelas(tempat: "kelas")
prokesKelas.lakukan()

struct ProkesRumah: Prokes {
    var tempat: String
    func lakukan() {
        print("ganti baju dari luar ke \(tempat)")
    }
}

let prokesRumah = ProkesRumah(tempat: "rumah")
prokesRumah.lakukan()

