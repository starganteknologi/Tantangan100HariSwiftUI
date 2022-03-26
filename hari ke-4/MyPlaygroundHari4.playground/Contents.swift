//REVIEW
//mendefiniskan variable dengan type annotation
var mahasiswa: [String] = ["Abang", "Budi", "Cak Kang", "Budi" ]

//mendefinisikan strings dari item array
let mahasiswaA = mahasiswa[0]

mahasiswa.append("Aman")

//string combination
let mahasiswaAA = mahasiswaA + mahasiswa[4]

let makananFavoritAbang = "Bakso"

var makanan = Set<String>()

makanan.insert("rawon")
makanan.insert("rawon")
makanan.insert("Bakso")
makanan.insert("Soto")

var makananBerkuah: Set = ["Bakso", "Soto"]

let adaMakananFavoritAbangDiMakanan:Bool

adaMakananFavoritAbangDiMakanan = makanan.contains(makananFavoritAbang) //

if adaMakananFavoritAbangDiMakanan {
    print("ada donk makanan Abang.")
} else {
    print("nope nope nope")
}

makananBerkuah.isSubset(of: makanan)

//var bandara: [String: String] = [:]

var bandara = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

let bandaraTransit = bandara["DUB"]

// ENUM



//==================================
// Enum
//==================================
enum NamaEnum {
    // definisi enum
}

enum MataAngin {
    case utara
    case selatan
    case timur
    case barat
}

let pintuKeluarMall = MataAngin.selatan

var arahKakiMelangkah = MataAngin.utara

arahKakiMelangkah = .barat

switch arahKakiMelangkah {
case .utara:
    print("ikut kompas ke utara terus ini")
case .selatan:
    print("ada juga kutub selakan")
case .timur:
    print("bakal ketemu matahari terbit")
case .barat:
    print("hmm matahari bs tenggelam disini ?")
}

enum Planet: CaseIterable{
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//Looping pada Enum
for planet in Planet.allCases {
    print(planet)
}

enum BangunRuang {
    case kubus(sisi: Double)
    case balok(panjang: Double, lebar: Double, tinggi: Double)
}

let ruang = BangunRuang.kubus(sisi: 3)

switch ruang {
case .kubus(sisi: let sisi):
    print("volume kubus adalah \(sisi * sisi * sisi)")
case .balok(panjang: let panjang, lebar: let lebar, tinggi: let tinggi ):
    print("volume balok adalah \(panjang * lebar * tinggi)")
}


let ruang2 = BangunRuang.balok(panjang: 2, lebar: 2, tinggi: 2)

switch ruang2 {
case .kubus(sisi: let sisi):
    print("volume kubus adalah \(sisi * sisi * sisi)")
case .balok(panjang: let panjang, lebar: let lebar, tinggi: let tinggi ):
    print("volume balok adalah \(panjang * lebar * tinggi)")
}
