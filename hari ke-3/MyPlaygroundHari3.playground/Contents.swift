
//REVIEW TIPE SEDERHANA
//mendefiniskan variable dengan type annotation
var intejerB:Int = 3
//mendefinisikan strings
let x = 10.1

var teks1 = "ini adalah strings pertama"

var teks2 = "ini adalah strings kedua"

let teksGabungan = teks1 + " sisipan 🤫 " + teks2

var apakahBenar = false
apakahBenar = !apakahBenar
apakahBenar.toggle()


// COLLECTION TYPE

var arrayKosongInt: [Int] = []
print("arrayKosongInt ber tipe [Int] dengan jumlah \(arrayKosongInt.count) items.")

arrayKosongInt.append(3)
print("arrayKosongInt ber tipe [Int] dengan jumlah \(arrayKosongInt.count) items.")
arrayKosongInt = []

//arrayKosongInt.append("tes")


// creating array with type annotation
var mahasiswa: [String] = ["Abang", "Budi", "Cak Kang", "Budi" ]


// versi pendek, tidak mendefinisikan tipe array jika kita menginisialisasi array literal dengan nilai yang bertipe sama

var mahasiswi = ["Ani", "Bulan", "Cici" ]


// karena nilai bertipe sama Swift secara cerdas dapat menyimpulkan bahwa [String] adalah type yg sesuai untuk variabel mahasiswi

// #### Mengakses dan Memodifikasi

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
mahasiswa.insert("Dua", at: 2)


// remove item pada array
mahasiswa.remove(at: 1)

//### SET

//Set<Element> dimana Element adalah tipe

var makanan = Set<String>()


makanan.insert("rawon")
makanan.insert("rawon")
makanan.insert("ayam panggan")
makanan.insert("ayam goreng")
makanan.insert("Bakso")
makanan.insert("Soto")
makanan.insert("Sop")

var makananBerkuah: Set = ["Bakso", "Soto"]

// Karena semua nilai dalam literal array memiliki tipe yang sama, Swift dapat menyimpulkan bahwa Set<String> adalah tipe yang benar untuk digunakan untuk variabel makananBerkuah

// #### Mengakses dan Memodifikasi Set

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

makanan.insert("Bakso")
// Operasi fungsi pada Set
makananBerkuah.isSubset(of: makanan)

// ## Dictionary
var namesOfIntegers: [Int: String] = [:]

namesOfIntegers[16] = "sixteen"


// var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]


