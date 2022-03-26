# HARI KE-3 Tantangan100hari SwiftUI : Type Collection Swift

arrays, set, dictionaries

Chapters:
- 0:00 Pembukaan
- 0:20 review hari pertama tentang tipe sederhana 
- 1:18 Collection type
- 6:31 Collection type:Array
- 7:11 Collection type:Set
- 11:48 Collection type:Dictionaries
- 13:04 Ringkasan


## Chapter 1. PEMBUKAAN

Selamat datang di hari ke-3 #Tantangan100hari SwiftUI bersama Stargan

hari ini kita akan belajar tentang dcollection type

arrays, set, dictionaries

## Chapter 2. Review

Tipe data sederhana

```SwiftUI
//mendefiniskan variable dengan type annotation
var intejerB:Int = 3
//mendefinisikan strings 

var teks1 = "ini adalah strings pertama"

var teks2 = "ini adalah strings kedua"

let teksGabungan = teks1 + " sisipan 🤫 " +teks2

var apakahBenar = false
apakahBenar = !apakahBenar
apakahBenar.toggle()

```

## Chapter 3.  Collection type

### Array

```Swift
var arrayKosongInt: [Int] = []
print("arrayKosongInt ber tipe [Int] dengan jumlah \(arrayKosongInt.count) items.")

arrayKosongInt.append(3)
// arrayKosongInt now contains 1 value of type Int
arrayKosongInt = []
// arrayKosongInt sekarang kosong, tapi tetap bertipe [Int]


// creating array with type annotation
var mahasiswa: [String] = ["Abang", "Budi", "Cak Kang", "Budi" ]

// versi pendek, tidak mendefinisikan tipe array jika kita menginisialisasi array literal dengan nilai yang bertipe sama

var mahasiswi = ["Ani", "Bulan", "Cici" ]

// karena nilai bertipe sama Swift secara cerdas dapat menyimpulkan bahwa [String] adalah type yg sesuai untuk variabel mahasiswi
```

#### Mengakses dan Memodifikasi Array

```Swift
print("mahasiswa sejumlah \(mahasiswa.count) .")

if mahasiswa.isEmpty {
    print("lis mahasiswa kosong.")
} else {
    print("lis mahasiswa tidak kosong.")
}


// menambah item baru pada array 
mahasiswa.append("doni")

// alternatif utk menambah item
mahasiswa += ["edi", "fulan", "gerhana"]

// mengakses array
let mahasiswaKesatu = mahasiswa[0]

// mengubah nilai array 
mahasiswa[0] = "Awan"

print(mahasiswa[0])

//insert arrray
mahasiswa.insert("Enol", at: 0)

// remove item pada array
mahasiswa.remove(at: 1)

```

### SET Type

sintak 

```Set<Element> dimana Element adalah tipe ```

membuat Set kosong 

```Swift
var makanan = Set<String>()

makanan.insert("rawon")
makanan.insert("rawon")
makanan.insert("ayam panggan")
makanan.insert("ayam goreng")
makanan.insert("Bakso")
makanan.insert("Soto")
makanan.insert("Sop")


var makananBerkuah: Set = ["Bakso", "Soto"]

Karena semua nilai dalam literal array memiliki tipe yang sama, Swift dapat menyimpulkan bahwa Set<String> adalah tipe yang benar untuk digunakan untuk variabel makananBerkuah

```

#### Mengakses dan Memodifikasi Set

```Swift

if makanan.isEmpty {
    print("restonya tutup kali g ada makanan.")
} else {
    print("menu makan restoran ada \(makanan.count) makanan.")
}

// insert ke Set 
makananBerkuah.insert("Sop")

// menghapus item Set
if let menuDihapus = makanan.remove("Bakso") {
    print("\(menuDihapus)? udah kagak ada.")
} else {
    print("Emang kagak ada di daftar makanan itu mah.")
}


//check apakah Set mengandung item tertentu
if makanan.contains("rawon") {
    print("ada donk rawon.")
} else {
    print("nope nope nope")
}
```

#### Operasi fungsi pada Set 

union , intersection, subtracting, symmetricDifference

Keanggotaan pada Set

```Swift
makananBerkuah.isSubset(of: makanan)
```

### Dictionary

```Swift
var namesOfIntegers: [Int: String] = [:]

namesOfIntegers[16] = "sixteen"


var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
```


