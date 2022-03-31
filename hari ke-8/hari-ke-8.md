# Fungsi: bagian 2

Selamat Datang di hari ke-8 Tantangan100hari SwiftUI bersama Stargan

Link youtube : https://youtu.be/epm5RWhtMGo

Tantangan100hari SwiftUI adalah sebuah program untuk belajar SwiftUI dalam 100 hari

Setiap hari kita akan belajar paling lama 1 jam tentang satu topik dalam Swift dan SwiftUI

Untuk setiap topik yang kita pelajari kita akan publish di  Yotube Stargan 

<https://www.youtube.com/channel/UCLk_BuhUhc70L0XAZ3C0McQ>

Video yang dipublikasikan akan dikelompokkan dalam playlist **Tantangan100Hari SwiftUI**

<https://www.youtube.com/playlist?list=PLafRxseOA_P7QoTjwlNApOHHZNtknXU81>

subscribe channel stargan agar anda dapat terus mendapatkan update tips-tips receh seputar dunia IT,
analisa proyek-proyek sistem informasi, coding mengkoding, mengelola database


Chapters
0:00 Pembukaan
2:29 In-Out parameter
8:16 Tipe fungsi
11:53 menggunakan tipe fungsi sebagai parameter fungsi lain
15:11 tipe fungsi sebagai tipe kembalian
23:54 nested fungsion / fungsi dalam fungsi


## In-Out parameter

parameter pada sebuah fungsi secara default adalah konstanta. jika kita merubah nilai parameter fungsi pada badan fungsi maka akan error. ini untuk menghindari kesalahan kita mengubah nilai parameter fungsi.

jika kita ingin merubah nilai parameter fungsi, dan menyimpan hasilnya setelah fungsi itu dipanggil maka kita gunanak inout parameter

cara mendefinisikan in out parameter adalah dengan menambah kan kata inout pada parameter

dan ketika kita memanggil fungsi tersebut parameter inout kita tempatkan ampersand &

contoh:

kita akan menggunakan contoh kita sebelumnya yaitu fungsi menabung

```

var tabungan:Double = 0
var tabunganUSD:Double = 0

func menabung(sejumlah uang: Double, valuta: String = "IDR") {
    switch valuta {
    case "USD":
        tabunganUSD += uang
    default:
        tabungan += uang
    }
}

menabung(sejumlah: 100_000)

menabung(sejumlah: 50, valuta: "USD")

print(tabungan)
```

kemudia kita akan mengubah parameter fungsi tersebut menjadi inout parameter

```
var tabungan:Double = 0
var tabunganUSD:Double = 0

func menabung(sejumlah uang: Double, di akun: inout Double ) {
    akun += uang
}

menabung(sejumlah: 100_000, di: &tabungan)

print(tabungan)
```

## Tipe fungsi

setiap fungsi mempunyai tipe spesifik, terdiri atas tipe parameter dan tipe kembalian

sebagai Contoh

```
func hitungPenambahan(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func hitungPerkalian(_ a: Int, _ b: Int) -> Int {
    return a * b
}
```

tipe kedua fungsi tersebut adalah (Int, Int) -> Int

yang dapat dibaca sebagai
"sebuah fungsi yang mempunyai dua parameter, yang keduanya adalah Int, dan mengembalikan sebuah nilai int"

contoh berikutnya adalah

```
func ngegosip(){
  print("pssst.... ada gosip menarik nih")
}
```

tipe fungsi ini adalah () -> void

yang dapat dibaca sebagai
"sebuah fungsi tanpa parameter, dan kembalian kosong"

tipe fungsi anda adalah seperti tipe lain yang ada di Swift

kita bisa mendefinisikan sebuah konstanta atau variable sebagai tipe fungsi tertentu dan mengassign fungsi yang cocok untuk variable tersebut

contoh

```
var fungsiMatematika: (Int, Int) -> Int = hitungPenambahan
print(fungsiMatematika(2,3))

```

ini kita baca sebagai
"definisikan variable fungsiMatematika yang mempunyai tipe fungsi yang mengambil dua parameter int, dan mengembalikan nilai int, set/atur variable baru ini untuk mengacu pada fungsi  hitungPenambahan "

hitungPenambahan mempunyai tipe yang sama dengan fungsiMatematika, sehingga assignment ini diperbolehkan oleh swift type-checker

fungsi yang berbeda dengan tipe yang sama dapat diassign ke variable yang sama

```
fungsiMatematika = hitungPerkalian
```

seperti tipe yang lain , anda juga dapat menyerahkan kepada swift untuk menyimpulkan tipe apa ketika kita mengassign tipe fungsi ke variable ataupun konstanta

```
let fungsiMatematikaLainnya = hitungPenambahan
```

## menggunakan tipe fungsi sebagai parameter fungsi lain

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

## nested fungsion / fungsi dalam fungsi

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
