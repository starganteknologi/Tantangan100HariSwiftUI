
# HARI KE-4 Tantangan100hari SwiftUI : Swift Enum

Enumerasi
Enumerasi mendefinisikan tipe umum untuk grup nilai yang saling terkait dan memungkinkan untuk bekerja dengan nilai tersebut dengan cara yang aman untuk tipe dalam kode kita.

hal yang akan dipelajari 
- sintak Enum 
- mencocokkan nilai Enum dengan Switch 
- Looping pada Enum
- mengaitkan nilai pada Enum (Assosiated Value)

Chapters:
- 0:00 Pembukaan
- 0:20 review hari 1-3
- 1:18 Enum
- 13:04 Ringkasan


## Chapter 1. PEMBUKAAN

Selamat datang di hari ke-4 #Tantangan100hari SwiftUI bersama Stargan

hari ini kita akan belajar tentang Enum type

Enumerasi
Enumerasi mendefinisikan tipe umum untuk grup nilai yang saling terkait dan memungkinkan untuk bekerja dengan nilai tersebut dengan cara yang aman untuk tipe dalam kode kita.

hal yang akan dipelajari 
- sintak Enum 
- mencocokkan nilai Enum dengan Switch 
- Looping pada Enum
- mengaitkan nilai pada Enum (Assosiated Value)

## Chapter 2. Review

```Swift
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
```

## Chapter 4. Enum

sintak
```

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

arahKakiMelangkah = .timur

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
    print("volume kubus adalah \(panjang * lebar * tinggi)")
}
```





