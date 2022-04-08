# extension

Selamat Datang di hari ke-14 Tantangan100hari SwiftUI bersama Stargan

Link youtube : <https://youtu.be/d2HAVD_z0TI>

Tantangan100hari SwiftUI adalah sebuah program untuk belajar SwiftUI dalam 100 hari

Setiap hari kita akan belajar paling lama 1 jam tentang satu topik dalam Swift dan SwiftUI

bagikan pengelaman belajar anda di media sosial,

pastikan anda subscribe channel stargan untuk mendapatkan update setiap hari selama 100 hari

<https://www.youtube.com/channel/UCLk_BuhUhc70L0XAZ3C0McQ>

topik kita hari ini extension

extension menambahkan fungsioanalitas pada existing Type , baik itu class, enum, struc atau protocol

## yang bisa dilakukakan oleh ektension

- menambahkan computed instance properti daan computed type properti
- mendefinisikan instance methods dan type methods
- mendefinisikan initializer baru
- dan membuat tipe existing menjadi sessuai dengan sebuah protocol


## sintak

extension TypeYangAkanDiExtend {
  // implementasi
}

protocol SebuahProtokol {

}

protocol SebongkahProtokol {

}

extension SebuahType: SebuahProtokol, SebongkahProtokol {

}

Contoh-contoh

## //computer property

```
// computed properties

extension Double {
    var km: Double { return self * 1000 }
    var m: Double { return self }
    var cm: Double { return self / 100 }
    var mm: Double { return self / 1000 }
    var ft: Double { return self / 3.28084 }
}

let satuInchi = 25.0.mm

let luas = 50.0.cm * 50.0.cm

print("luasnya \(luas)")


print("satu inchi = \(satuInchi) meter")
```

## // initializer

```

struct Ukuran {
    var panjang: Double = 0.0, lebar: Double = 0.0
}

struct Titik {
    var x: Double = 0.0, y: Double = 0.0
}

struct Persegi {
    var titikAwal = Titik()
    var ukuran = Ukuran()
}

let persegi = Persegi()

print(persegi.ukuran)

let persegiCustom = Persegi(titikAwal: Titik(x: 1.0, y: 1.0) , ukuran: Ukuran(panjang: 2.0 , lebar: 3.0) )
```

kemudian kita ingin mengubah inisialisai dari persegi
kita ingin hitung mulai dari tengah

```
extension Persegi {
    init(tengah: Titik, ukuran: Ukuran) {
        let titikX = tengah.x - (ukuran.panjang / 2)
        let titikY = tengah.y - (ukuran.lebar / 2)
        self.init(titikAwal: Titik(x: titikX, y: titikY), ukuran: ukuran)
    }
}

let persegiDariTengah = Persegi(tengah: Titik(x: 1.0, y: 1.0) , ukuran: Ukuran(panjang: 2.0 , lebar: 3.0) )
print(persegiDariTengah.titikAwal)
```

sebuah contoh lain :


//swift secara otomatis generatae initialize sesuai property

jika sebuah tipe mempunyai custom  custom inilizernya maka dia akan override initializer yang di sediakan oleh
swift


```
struct Angkutan {
    let nama: String
    let jenis: String
    let jumlahPenumpang: Int
    let massal: Bool
}

extension Angkutan {
    init( nama: String, jenis: String, massal: Bool ) {
        self.nama = nama
        self.jenis = jenis
        self.massal = massal
        self.jumlahPenumpang = massal ? 1000 : 3
    }
}
```

## menambahkan methods

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

## mutating instance method

extension Int {
    mutating func kuadrat() {
        return self = self * self
    }
}

var angka = 3
print( angka.kuadrat() )

## nested / bersarang

```

extension Int {
    enum Kind {
        case negatif, nol, positif
    }

    var jenis: Kind {
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

func printJenisInteger ( _ angka: [Int]) {
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

printJenisInteger([10,2,-3,0,-4,28])

```

## extension pada protocol

```
protocol Prokes {
  var tempat: String { get }
  func lakukan()
}
```

artinya semua yang comform Prokes harus mempunyai method lakukan

kita dapat menambahkan fungsi defol Prokes dengan extension

```
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

struct ProkesRumah: Prokes {
    var tempat: String
    func lakukan() {
        print("ganti baju segera setelah dari luar masuk ke \(tempat)")
    }
}

let prokesKelas = ProkesKelas(tempat: "kelas")
prokesKelas.lakukan()
prokesKelas.lakukan()

var prokesRumah = ProkesRumah(tempat: "rumah")
prokesRumah.lakukan()
```
