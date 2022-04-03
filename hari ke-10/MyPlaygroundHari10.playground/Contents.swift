var greeting = "hari ke-10 tantangan100hari SwiftUI"

// sintak untuk

struct pegawai {
    /// di ini codenya
}

class pegawaiLain {
    //
}

struct Dimensi {
    var panjang = 0.0
    var lebar = 0.0
    var tinggi = 0.0
}

class Mobil {
    var dimensi = Dimensi()
    var kecepatanMaksimal = 0
    var nama: String?
}

let dimensi = Dimensi()
let angkot = Mobil()

// akses properti

print("panjang satu dimensi adalah \(dimensi.panjang)")
print("lebar angkot adalah \(angkot.dimensi.lebar)")

// assign propertiess

angkot.nama = "A55"
print("nama angkot = \(angkot.nama!)")

var dimensiKecil = Dimensi(panjang: 5, lebar: 5, tinggi: 5)

let dimensiMobil = dimensiKecil

print(dimensiMobil)

dimensiKecil.panjang = 10

print("dimensi kecil berubah jadi \(dimensiKecil.panjang)")

print("dimensi mobil tetap \(dimensiMobil.panjang)")

let transjakarta = Mobil()

transjakarta.dimensi = dimensiKecil
transjakarta.nama = "blokm-senayan"
transjakarta.kecepatanMaksimal = 10

print(transjakarta.nama!)

let tjLain = transjakarta
let tjKota = tjLain

tjKota.nama = "rambutan-rebo"
print(transjakarta.nama!)

if tjKota === transjakarta {
    print("sama aja , tj tj jg")
} else {
    print("beda donk")
}

// properties

struct AngkutanUmum {
    var penumpang: [String]
    let sopir: String
}

var angkot22 = AngkutanUmum(penumpang: ["aca","budi","cuaan","didi"], sopir: "eka")
angkot22.penumpang.remove(at: 0)
print(angkot22.penumpang)
//angkot22.sopir = "gaanti"

let taksi = AngkutanUmum(penumpang: ["fifa"], sopir: "hadi")

//taksi.penumpang.remove(at: 0)

// lazy

class DataImporter {
    // kode panjang banget
    var filename = "data.txt"
    // kode panjang lagi
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}

let manager = DataManager()
manager.data.append("data baaru")
manager.data.append("baru lagi")

print(manager.data)

print(manager.importer.filename)

// computed properties

struct Titik {
    var x = 0.0, y = 0.0
}

struct Ukuran {
    var lebar = 0.0, tinggi = 0.0
}

struct persegi {
    var titikAwal = Titik()
    var ukuran = Ukuran()
    var tengah: Titik {
        get {
            let tengahX = titikAwal.x + (ukuran.lebar / 2)
            let tengahY = titikAwal.y + (ukuran.tinggi / 2)
            return Titik(x: tengahX, y: tengahY)
        }
        set(tengahBaru) {
            titikAwal.x = tengahBaru.x - (ukuran.lebar / 2)
            titikAwal.y = tengahBaru.y - (ukuran.tinggi / 2)
        }
    }
}

var kotak = persegi(titikAwal: Titik(x: 0.0, y: 0.0), ukuran: Ukuran(lebar: 5, tinggi: 5))

print(kotak)
print(kotak.tengah)

kotak.tengah = Titik(x: 5, y: 5)
print(kotak.tengah)

print(kotak)


//newValue

struct persegiBaru {
    var titikAwal = Titik()
    var ukuran = Ukuran()
    var tengah: Titik {
        get {
            let tengahX = titikAwal.x + (ukuran.lebar / 2)
            let tengahY = titikAwal.y + (ukuran.tinggi / 2)
            return Titik(x: tengahX, y: tengahY)
        }
        set {
            titikAwal.x = newValue.x - (ukuran.lebar / 2)
            titikAwal.y = newValue.y - (ukuran.tinggi / 2)
        }
    }
}

var kotakBaru = persegiBaru(titikAwal: Titik(x: 0.0, y: 0.0), ukuran: Ukuran(lebar: 5, tinggi: 5))

print(kotakBaru)

struct persegiMini {
    var titikAwal = Titik()
    var ukuran = Ukuran()
    var tengah: Titik {
        get {
            Titik(x: titikAwal.x + (ukuran.lebar / 2), y: titikAwal.y + (ukuran.tinggi / 2))
        }
        set {
            titikAwal.x = newValue.x - (ukuran.lebar / 2)
            titikAwal.y = newValue.y - (ukuran.tinggi / 2)
        }
    }
}

let kotakBaruLagi = persegiMini(titikAwal: Titik(x: 0.0, y: 0.0), ukuran: Ukuran(lebar: 5, tinggi: 5))

print(kotakBaruLagi)
