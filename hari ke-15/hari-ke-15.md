# REVIEW DASAR DASAR SWIFT

kita akan mereview sejenak untuk memberi kita napas dan melihat kembali apa yang telah kita pelajari selama 15 hari

bagimana kita mendefiniskan konstantan dengan keyword let dan variable dengan keyword var

nilai sebuah konstanta tidak dapat diubah setelah diatur

sedangkan variabel dapat dirubah

```
 let jumlahHariDalamSeminggu = 7
 var jumlahCutiBersamaTahunIni = 12
 ```

---

## Collection Type

### Array

array dengan type annotation

```
var let angkaBulan = [1,2,3,4,5,6,7,8,9,10,11,12]
var mahasiswa: [String] = ["Abang", "Budi", "Cak Kang", "Budi" ]
//menambah item pada array
mahasiswa.append("doni")
mahasiswa += ["edi", "fulan", "gerhana"]
let mahasiswaKesatu = mahasiswa[0]

print(mahasiswaKesatu)
mahasiswa[0] = "Awan"

//insert arrray
mahasiswa.insert("Enol", at: 0)

// remove item pada array
mahasiswa.remove(at: 1)
```

### Set

tidak ada item yang sama

#### sintak set

```
var makanan = Set<String>()

makanan.insert("rawon")
makanan.insert("rawon")
makanan.insert("ayam panggan")
makanan.insert("ayam goreng")
makanan.insert("Bakso")
makanan.insert("Soto")
makanan.insert("Sop")

var makananBerkuah: Set = ["Bakso", "Soto"]

if makanan.contains("rawon") {
  print("ada")
}

// menghapus
if let menuDihapus = makanan.remove("Bakso") {
  print("menu \(menuDihapus)")
}
```

#### operasi pada set

union , intersection, subtracting, symmetricDifference

```
makananBerkuah.isSubset(of: makanan)
```

### Dictionary

mendefiniskan Dictionary

```
let kodepos:[String: String] = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

let namaBulan: [Int: String] = [1:"Januari", 2: "Februaari", 3: "Maret", 4: "April", 5: "Mei", 6: "Juni", 7: "Juli", 8: "Agustus", 9: "September", 10: "Oktober", 11: "November", 12:"Desember" ]

print(namaBulan[1]!)
```

---

## Enum

```
enum NamaEnum {
    // definisi enum
}

enum MataAngin {
    case utara
    case selatan
    case timur
    case barat
}

let utara = MataAngin.utara
```

### looping pada Enum

// agar Enum bisa di looping kita akan buat biar comform terhadap protocol CaseIterable

```
enum Planet: CaseIterable{
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//Looping pada Enum

for planet in Planet.allCases {
    print(planet)
}
```

### Assosiated value pada Enum

```
enum BangunRuang {
    case kubus(sisi: Double)
    case balok(panjang: Double, lebar: Double, tinggi: Double)
}

let ruang = BangunRuang.kubus(sisi: 3)

switch ruang {
case .kubus(let sisi):
    print("volume kubus adalah \(sisi * sisi * sisi)")
case .balok(panjang: let panjang, lebar: let lebar, tinggi: let tinggi ):
    print("volume kubus adalah \(panjang * lebar * tinggi)")
}

```

## OPERATOR


Operators terdiri atas unary, binary, or ternary:

- Unary operators yaitu operasi atas satu target
cth (-a).
Unary prefix operaator yang muncul sebelum target
unary postfix operators muncul setelah target (such as b!).

- Binary operators yaitu operasi atas dua target + - * / %

- Ternary operators beroperasi pada 3 target.
cth ternary conditional operator (a ? b : c).

## Jenis-jenis operator

- operator penugasan =

- operator aritmatika + - * / %

- operator perbandingan == != > < >= <=

  batasan operator perbandingan > < >= <=  tidak berlaku pada boolean

- Range Operator / Operator Rentang
a nilai awal
b nilai akhir

  - rentang tertutup a...b
  - rentang tertutup a..<b
  - rentang sebelah a... atau ...b
  - rentang setengah terbuka sebelah ...<

contoh

```
for angka in 1..<15 {
        print ("angka \(angka)")
}
```



## Pernyataan kondisi

pernyataan kondisi dengan satu atau lebih kondisi
mengguna **if**
```
let tahun = 2022

let ikn = "nusantara"
if ikn == "nusantara" && tahun >= 2024 {
	print(" upacara bendera di kota baru")
} else {
	print("upcaranya masih di jakarta")
}
```

agar lebih mudah terbaca bisa pake Swith

```
let makanan = "soto ayam"
switch makanan {
	case "rawon":
		print("rawon setan tunjungan maknyus")
	case "sop":
		print("sop pake jeruk ada asem2nya seger")
	case let x where x.hasPrefix("soto"):
		print("\(x) mantap bener")
	default:
		print("semua makanan masuk gan")
}
```

Nil-coalesing operator

m ?? n

m adalah tipe Opsional , Unwrap m jika berisi nilai, dan kembalikan default n jika m adalah nil

```
var m:Int?
let n = 11
let mval = m ?? n
```

---

## LOOPING

for-in loop untuk iterasi arrays, dictionaries, range, string dan sekuence lainnya

```
//contoh iterasi pada dictionary

let sisiSisi = ["segitiga": 3, "persegi": 4, "lingkaran": 1, "segilima": 5]

for (namaBangunDatar, jumlahSisi) in sisiSisi {
	print("\(namaBangunDatar) mempunyai \(jumlahSisi) sisi")
}
```

### looping dengan nilai interval

mengunakan stride

```
var kodeGenap:[Int] = []
let intervalPengkodean = 4
let maksimumKode = 100
for kode in stride(from:0, to:maksimumKode, by: intervalPengkodean ){
    kodeGenap.append(kode)
}
print(kodeGenap)
```

## while loops

bentuk pertama

```
while kondisi {
	//pernyataaan
}
```

bentuk kedua memastikan minimal kode dieksekusi minimal sekali

```
repeat {
	//pernyataaan
}
while kondisi
```

### skip loop

#### continue

gunakan continue utk keluar dari satu iterasi

```
let filenames = ["gambar.jpg", "catatan.txt", "lover.jpg", "banner.xcf"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(filename)")
}
```


#### break

gunakan break untuk keluar dari iterasi dan melewati semua iterasi tersisa

contoh
mencari kelipatan persekutaan terkecil KPK

```
let bilangan1 = 57
let bilangan2 = 18
var kpk:Int?

for i in 1...1_000_000 {
    print(i)
    if(i.isMultiple(of: bilangan1) && i.isMultiple(of: bilangan2) ){
        kpk = i
        break
    }
}

print("kpk dari \(bilangan1) dan \(bilangan2) adalah \(kpk!)")
```


## DAY 7 FUNGSI

### mendefiniskan fungsi

```
func luasLingkaran(jariJari r: Double) -> Double {
    return Double.pi * r * r
}

print(luasLingkaran(jariJari: 12))
```

jariJari adalah label parameter

### Fungsi dengan nilai kembalian multiple / multiple return values optional

contoh :

```

func minMedMax(array: [Int]) -> (min: Int, med: Double, max: Int)? {
    if array.isEmpty { return nil }
    var sementaraMin = array[0]
    var sementaraMax = array[0]
    var median: Double = Double(( array[0] + array[0] ) / 2)
    for nilai in array[1..<array.count]{
        if nilai < sementaraMin {
            sementaraMin = nilai
        } else if nilai > sementaraMax {
            sementaraMax = nilai
        }
    }
    median = Double((sementaraMax + sementaraMin) / 2)

    return (sementaraMin, median, sementaraMax)
}

print(minMedMax(array: [2,3,1,3,4])!)
//print(minMedMax(array: [])!) hati hati untuk tidak mengwrap nill

let (min,med,max) = minMedMax(array: []) ?? (0,0,0)
print("nilai minimal adalah \(min)")


let mmm = minMedMax(array: [])
print("nilai maksimal adalah \(mmm?.max ?? 0 )")

```


### fungsi dengan variadic parameter

variadic parameter dapat menerima 0 ataupun lebih nilai dalam satu tipe

```
func hitungRerata(_ bilangan: Double...) -> Double {
    var total: Double = 0
    for angka in bilangan {
        total += angka
    }
    return total / Double(bilangan.count)
}

hitungRerata(1,2,3,5.1,6,1)
```

## DAY 8

### in out parameter pada fungsi

contoh

```
var tabungan:Double = 0
var tabunganUSD:Double = 0

func menabung(sejumlah uang: Double, di akun: inout Double ) {
    akun += uang
}

menabung(sejumlah: 100_000, di: &tabungan)

print(tabungan)
```

### tipe fungsi
setiap fungsi mempunyai tipe spesifik, terdiri atas tipe parameter dan tipe kembalian

```
func hitungPenambahan(_ a: Int, _ b: Int) -> Int {
    return a + b
}
```

tipe fungsi tersebut adalah (Int, Int) -> Int

yang dapat dibaca sebagai
"sebuah fungsi yang mempunyai dua parameter, yang keduanya adalah Int, dan mengembalikan sebuah nilai int"

### menggunakan tipe fungsi sebagai parameter fungsi lain

anda dapat menggunakan tipe fungsi seperti (Int, Int) -> sebagai tipe parameter untuk fungsi lainnya

contoh
```

func cetakHasilHitung(_ fungsiMatematika: (Int, Int) -> Int, _ m: Int , _ n: Int) {
    print(fungsiMatematika(m,n))
}

cetakHasilHitung(hitungPenambahan, 12, 13)

```


## tipe fungsi sebagai tipe kembalian

kita dapat menggunakan tipe fungsi sebagai kembalian suatu fungsi dengan menuliskan tipe fungsi tepat setelah panah return


```

func maju(_ input: Int) -> Int {
    return input + 1
}

func mundur(_ input: Int) -> Int {
    return input - 1
}

func pilihFungsiLangkah(isMundur: Bool) -> (Int) -> Int {
    return  isMundur ? mundur : maju
}

var posisi = 5

let mendekatiNol = pilihFungsiLangkah(isMundur: posisi > 0 )

let menuju10 = pilihFungsiLangkah(isMundur: posisi > 10 )

print("menuju 0")
//itung mundur

while posisi > 0 {
    print(posisi)
    posisi = mendekatiNol(posisi)
}

while posisi <= 10 {
    print(posisi)
    posisi = menuju10(posisi)
}
```


### nested fungsion / fungsi dalam fungsi

kita dapat menuliskan kembali fungsi tersebut dengan

```

func pilihFungsiLangkahBaru(isMundur: Bool) -> (Int) -> Int {
    func maju(_ input: Int) -> Int {
        return input + 1
    }
    func mundur(_ input: Int) -> Int {
        return input - 1
    }
    return  isMundur ? mundur : maju
}

let mendekatiNolLagi = pilihFungsiLangkahBaru(isMundur: posisi > 0)


while posisi > 0 {
    print(posisi)
    posisi = mendekatiNolLagi(posisi)
}
```

## HARI 9 CLOSURE

Closur the monster of Swift


Closure dapat berupa salah satu dari 3 bentuk

- fungsi global adalah closure yang mempunyai nama dan tidak menangkap nilai
- nested function adalah closure yang mempunyai nama dan dapat menangkap nilai dari fungsi didalamnya
- ekspresi closure adalah closure tanpa nama yang di tulis dalam sintak sederhana/ringan yang dapat menangkap nilai dari konteks sekitarnya

contoh-contoh closure

```
let donasi = { (donatur: String ) in
    print("menerima uang dari \(donatur)")
}

let donasi2 = { (donatur: String ) -> Bool in
    print("menerima uang dari \(donatur)")
    return true
}

let donasiTanpaNama = { () -> Bool in
    print("tanpa nama")
    return true
}
```

contoh penggunaan closure pada sorted

pada sorted untu parameter by: adalah bertipe (Type, Type) -> Bool

```
let siswa: Set = ["hofi", "juraa", "kepsek","zetaa","beta"]
let urutanBarisanPakeClosure = siswa.sorted(by: { (nama1: String, nama2: String) -> Bool in
    if nama1 == "kepsek" {
        return true
    } else if nama2 == "kepsek" {
        return false
    }
    return nama1 < nama2
})

print(urutanBarisanPakeClosure)
```

dapat dipendekkan

```
let urutanClosureLagi = siswa.sorted { nama1, nama2 in
    if nama1 == "kepsek" {
        return true
    } else if nama2 == "kepsek" {
        return false
    }
    return nama1 < nama2
}
```

## hari ke 10 Struct


### perbandingan Struct dan Class

struct dan kelas adalah suatu blok dengan tujuan umum, dapat ditambahkan properties dan method untuk menambahkan fungsionalitasnya
- definisikan properti untuk menyimpan nilai
- definisikan methods untuk menambah fungsionalitas
- definisikan subscripts untuk menyediakan akses ke nilai menggunakan sintak subscript
- definisikan initializer untuk mengatur keaadaan awal
- dapat di extend untuk memperluas fungsionalitas diluar implementasi defaltnya
- sesuai dengan protocol untuk menyediakan fungsionalitas standar dari jenis tertentu


class mempunyai tambahan kemampuan yang tidak dimiliki oleh struct
- inheritance memungkinkan suatu kelas mewarisi karakter class lainnya
- type casting memungkinkan untuk memeriksa dan menafsirkan tipe sebuah instance class pada saat runtime
- deinitializers memungkinkan instance class untuk membebaskan sumber daya yang telah di assign ke instance tsb

contoh

```

struct Dimensi {
    var panjang = 0.0
    var lebar = 0.0
    var tinggi = 0.0
}

class Mobil {
    var dimensi = Dimensi()
    var kecepatanMaksimal = 0
    var nama:String?
}

let dimensi = Dimensi()
let suv = Mobil()

suv.nama = "Land Cruiser"
print("nama suv adalah \(suv.nama!)")

var pajero = suv
pajero.nama = "pajero"
pajero.kecepatanMaksimal = 99

print(suv.kecepatanMaksimal)
pajero.kecepatanMaksimal = 88
print(suv.kecepatanMaksimal)


```

### struct dan Enum adalah value types
### clas adalah tipe reference

karena class adalah reference tipe maka bisa jadi banyak instance konstanta dan variabel merujuk satu instance kelas yang sama

### properti
stored properti adalah properti konstanta atau variabel yg disimpan sebagai bagian suatu instance kelas / struct

#### computed properti

properti yang tidak menyimpan value tapi menyediakan fungssi getter dan opsional setter untuk meretriev dan mengatur nilai properti  lainnya secara tidak langsung

dengan contoh persegi yang mempunyai properti titikAwal kita dapat merubah nilai titik awal dengan computed properti titik tengah

```

struct Titik {
  var x = 0.0, y = 0.0
}

struct Ukuran {
  var lebar = 0.0, tinggi = 0.0
}

struct Persegi {
  var titikAwal = Titik()
  var ukuran = Ukuran()
  var tengah: Titik {
    get {
      return Titik(x: titikAwal.x + (ukuran.lebar / 2) , y: titikAwal.y + (ukuran.tinggi / 2))
    }
    set {
      titikAwal.x = newValue.x - ( ukuran.lebar / 2)
      titikAwal.y = newValue.y - ( ukuran.tinggi / 2)
    }
  }
}

var kotak = Persegi(titikAwal: Titik(x: 0.0, y: 0.0), ukuran: Ukuran(lebar: 5, tinggi: 5))

print(kotak.titikAwal)
kotak.tengah = Titik(x: 10, y: 10)

print(kotak.titikAwal)
```

## HARI ke-11

### Struct dan Class Lanjutan

### Read Only Computed Properties

untuk membuat read only computer properti , kita hanya mendefisikan get function nya saja

```

struct Tumpeng {
    var tinggi = 0.0, jariJari = 0.0
    var volume: Double {
        return (1/3) * Double.pi * jariJari * jariJari
    }
    var takaranAyam: Double {
        return volume * 0.1
    }
}

let tumpeng = Tumpeng(tinggi: 10, jariJari: 5)

print(tumpeng.takaranAyam)
```


### Memantau perubahan pada Properti
observer dapat didefinisikan dengan
- willset : default nama parameternya adalah newValue
- didSet : default nama parameternya adalah oldValue

contoh
```
class counterPenumpang {
    var totalPenumpang = 0 {
        willSet {
            print("akan mengatur jumlah penumpang sejumlah \(newValue) ")
        }
        didSet {
            if totalPenumpang > oldValue {
                print("penumpang naik sebanyak \(totalPenumpang - oldValue)")
            }
        }
    }
}

let penumpangAnkot = counterPenumpang()
penumpangAnkot.totalPenumpang = 5
penumpangAnkot.totalPenumpang = 7
```

### 0:00 Properti wrapper

properti wrapper menambahkan pemisahan layer pada kode yang mengelola bagaimana sebuah properti disimpan dan kode yang mendefinisikan properti

untuk mendefinisikan property wrapper kita buat struc, enum atau class yang mendefinisikan properti

```

@propertyWrapper
struct EnamAtauKurang {
    private var angka = 0
    var wrappedValue: Int {
        get{return angka}
        set{angka = min(newValue,6) }
    }
}

@propertyWrapper
struct TigaEnamAtauKurang {
    private var angka = 0
    var wrappedValue: Int {
        get{return angka}
        set{angka = min(newValue, 36)}
    }
}

class RumahSederhana {
    var panjang: Int = 0
    @EnamAtauKurang var lebar: Int
    @TigaEnamAtauKurang var luasMaksimal: Int
    var luas: Int {
        return panjang * lebar
    }
}

class Rss: RumahSederhana {
    override var luasMaksimal: Int {
        didSet {
            if luas >= luasMaksimal {
                print("luas maksimal adalah \(luasMaksimal) ")
                print("untuk panjang \(panjang), maka maksimum lebar adalah \(luasMaksimal / panjang) ")
                print("untuk lebar \(lebar), maka maksimum panjang adalaah \(luasMaksimal / lebar)")
            }
        }
    }
}

var kontrakan = Rss()
kontrakan.panjang = 12
kontrakan.lebar = 8
kontrakan.luasMaksimal = 46

print(kontrakan.luasMaksimal)

```

### setting nilai awal Properti wrapper

pada kode diatas nilaia awal properti wrapper sudah didefinisikan , kode yang menggunakan properti wrapper ini tidak dapat memilih nilai awal dari properti property Wrapper

untuk mendukung pengaturan nilai awal sebuah properti wrapper , properti wrapper membutuhkan penambahan initializer

### memproyeksikan nilai dari properti wrapper
properti wrapper dapat menambahkan tambahan fungsionalitas dengan mendefinisikan **projected value** nama dari projected value sama dengan wrapped value kecuali , namanya berawalan tanda dollar $ , karena kode kita tidak dapat menggunakan $ sebagai nama proporti

dari contoh diatas kita akan tambahkan fungsionalitas yang melacak apakah suatu nilai di sesuaikan oleh wrapper ketika suatu nilai disimpan

```

@propertyWrapper
struct AngkaKecilLagi {
    private var angka: Int
    private(set) var projectedValue: Bool

    var wrappedValue: Int {
        get { return angka}
        set {
            if newValue > 10 {
                projectedValue = true
                angka = 10
            } else {
                projectedValue = false
                angka = newValue
            }
        }
    }

    init() {
        self.angka = 0
        self.projectedValue = false
    }
}

struct StructLainnya {
    @AngkaKecilLagi var angka: Int
}

var structLainnya = StructLainnya()
structLainnya.angka = 15

print(structLainnya.$angka)
```

## HARI ke-12 Properti dan Method

## property

### instance property

instance property adalah property yang dimiliki oleh setiap instance yang kita buat, tiap instance mempunya nilai properti sendiri untuk setiap instance

### type property

kita juga mendefinisikan property yang dimiliki oleh tipe itu sendiri, hanya ada 1 copy dari tipe property, g peduli seberapa banyak instance dari tipe tersebut yang dibuat

```
struct SuatuStruct {
    static var storedTypeProperty = "suatu nilai"
    static var computedTypeProperty: Int {
        return 6
    }
    var instanceProperty = "string"
}

let ss = SuatuStruct(instanceProperty: "dapat diisi")
```

### instance methods


### instance method

instance method adalah methods yang dimiliki oleh instance dari suatu class, struct atau enum

kita membuat instance method di dalam kurung kurawal.
instance methods hanya dapat dipanggil dari satu instance

```
class Counter {
    var count = 0
    func increment() {
        count += 1
    }

    func increment(by amount: Int) {
        count += amount
    }

    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
print(counter.count)
counter.increment(by: 5)
print(counter.count)

let counter2 = Counter()
print(counter.count)
counter2.increment()

print(counter.reset())
print(counter2.count)

struct CounterStruct {
    var count = 0
    mutating func increment() {
        count += 1
    }

    mutating func increment(by amount: Int) {
        count += amount
    }

    mutating func reset() {
        count = 0
    }
}

var cs1 = CounterStruct()
var cs2 = CounterStruct()

//jika cs1 didefinisikan dengan let maka tidak bs increment
//Cannot use mutating member on immutable value: 'cs1' is a 'let' constant
cs1.increment()
print(cs1.count)
print(cs2.count)
```

// TO BE REMEMBERED class adalah tipe reference sedangkan Struct adalah tipe values

enumeration juga merupakan tipe values sehingga kita harus gunakan mutating method ketika ketika kita ingin mengubah value enum menggunakan method

```
// mutating methods for enumeration

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
```

### Type Method

```
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int){
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String

    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }

    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Alma")
player.complete(level: 1)
print("level tertinggi terbuka adalah \(LevelTracker.highestUnlockedLevel)")
player.complete(level: 9)
print("level tertinggi terbuka adalah \(LevelTracker.highestUnlockedLevel)")


player = Player(name: "zeta")
if player.tracker.advance(to: 6) {
    print("pemain skrg berada di level 6")
} else {
    print("level 6 belum kebuka")
}




```

## Hari ke-13 Protocol


Protocol mendefinisikan sebuah cetak biru / blueprint untuk methods, property, atau yang lain,

Protocol ini kemudian dapat di adopsi sebuah class, struc, maupun enum untuk mengimplementasi persyaratan

tipe apapun yang memenuhi persyaratan sebuah Protocol dapat dikatakan sesuai dengan Protocol

atau conform to that Protocol

```
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

var namaMenteri = NamaOrang(nama: "Mentari")
namaMenteri.marga = "Siregar"

print(namaMenteri.namaLengkap)

```


### protocol sebagai type


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

## extension


extension menambahkan fungsioanalitas pada existing Type , baik itu class, enum, struc atau protocol

## yang bisa dilakukakan oleh ektension

- menambahkan computed instance properti daan computed type properti
- mendefinisikan instance methods dan type methods
- mendefinisikan initializer baru
- dan membuat tipe existing menjadi sessuai dengan sebuah protocol

```

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

### initializer pada extension

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

let persegiCustom = Persegi(titikAwal: Titik(x: 1.0, y: 1.0) , ukuran: Ukuran(panjang: 2.0 , lebar: 3.0) )

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


#### mutating instance method

```
extension Int {
    mutating func kuadrat() {
        return self = self * self
    }
}

var angka = 3
print( angka.kuadrat() )
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

var prokesRumah = ProkesRumah(tempat: "rumah")
prokesRumah.lakukan()
```
