# Fungsi : Bagian pertama

Selamat Datang di hari ke-7 Tantangan100hari SwiftUI bersama Stargan

Link youtube : <https://youtu.be/0fAYPZpOnmk>

Tantangan100hari SwiftUI adalah sebuah program untuk belajar SwiftUI dalam 100 hari

Setiap hari kita akan belajar paling lama 1 jam tentang satu topik dalam Swift dan SwiftUI

Untuk setiap topic yang kita pelajari kita publish apa yang telah kita pelajari dalam hal ini Stargan akan mempublikasi melalui kanal Yotube Stargan Edutainment di channel

<https://www.youtube.com/channel/UCLk_BuhUhc70L0XAZ3C0McQ>

Video yang dipublikasikan akan dikelompokkan dalam playlist **Tantangan100Hari SwiftUI**

<https://www.youtube.com/playlist?list=PLafRxseOA_P7QoTjwlNApOHHZNtknXU81>

subscribe channel stargan agar anda dapat terus mendapatkan update tips-tips receh seputar dunia IT,
analisa proyek-proyek sistem informasi, coding mengkoding, mengelola database

Chapters
0:00 Pembukaan
1:23 mendefinisikan fungsi
5:40 Fungsi multiple parameter
9:15 berapa batasan jumlah parameter pada fungsi ?
10:00 Label parameter
13:38 Kapan memakai label parameter
27:11 commit git
28:34 multiple return value optional
37:44 parameter variadic


## Definisi

Fungsi adalah sebuah blok kode program yang menjalankan fungsi tertentu. blok kode tersebut dapat dinamai dan dapat dipanggil dengan nama tersebut di bagian kode yang lain.

sintak Swift cukup fleksible dengan bentuk sederhana tanpa parameter hingga bentuk yang kompleks multiparameter.

setiap fungsi Swift mempunyai tipe, terdiri atas tipe parameter dan tipe kembalian fungsi.

Tagar #SwiftUI #Swift #iosdeveloper #ngodingbarengstargan

## cara mendefinisikaan fungsi dan pemanggilannya

## fungsi dengan multi parameter

contoh : membuat fungsi untuk menghitung luas lingkaran

```
import Foundation

func panggilAbang(jualan: String) -> String {
  let teriak = "Baaang beli \(jualan)nya!!!!"
    return teriak
}

print(panggilAbang(jualan: "bakso"))

func luasLingkaran(r: Double) -> Double {
    return Double.pi * r * r
}

print(luasLingkaran(r: 12))
```

## fungsi dengan multi parameter

sebuah fungsi dapat memiliki lebih dari 1 parameter

```
func kelilingPersegi(panjang p: Double, lebar l: Double, isPersegiPanjang: Bool ) -> Void {
    let persegi = isPersegiPanjang ? "persegi panjang" : "persegi"
    print("keliling bangun datar \(persegi) adalah \(2 * p * l)")
}

kelilingPersegi(panjang: 2, lebar: 4, isPersegiPanjang: false)
```

### berapa batasan jumlah multiparameter yang bagus?

ini seperti menjawab seberapa lama sebuah pidato yang bagus? tidak ada jawaban yang pasti.
jumlahnya menyesuaikan dengan tujuan sebuah fungsi

usahakan tidak terlalu banyak agar tidak susah dibaca dikemudian hari. Jika memang membutuhkan parameter yang terlalu banyak, mungkin sudah waktunya perlu dipikirkan untuk membagi fungsi menjadi lebih kecil yang menjalankan kode spesifik dan parameter lebih sedikit.


## pemakaian label pada parameter

pemakaian label pada parameter untuk memudahkan mengingat dan berasa lebih natural dalam pemanggilan fungsinya

```
func nongkrong(makan makanan: String) -> String {
  return "ujan-ujan nongkrong makan \(makanan)"
}

func panggilAbang2(jualan barang: String) -> String {
  let teriak = "Baaang beli \(barang)nya!!!!"
    return teriak
}
```
### kapan memakai parameter label dan kapan untuk tidak memakai

```
func menyanyi(_ lagu: String) -> Void {
    print("la la la")
    print("potongan lagu \(lagu)")
}

menyanyi("lala dance")

func putarLagu(judul lagu: String) {
    print("la la la")
    print("potongan lagu \(lagu)")
}

putarLagu(judul: "ye ye ye")

```

## Fungsi dengan nilai kembalian multiple / multiple return values

kita dapat menggunakan tupel untuk multiple return values

contoh berikut adalah mencari nilai minimal maksimal dan median dari sebuah array

```
func minMedMax(array: [Int]) -> (min: Int, med: Double, max: Int){
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

let (min, med, max ) = minMedMax(array: [2,3,1,3,4])
print("nilai minimal adalah \(min)")
```

karena anggota tupel dari return fungsi mempunya nama -> (min: Int, med: Double, max: Int), maka kita juga bs mengaksesnya dengan sintak titik .

```
let mmm = minMedMax(array: [2,3,1,3,4])
print("nilai maksimal adalah \(mmm.max)")
```

### simpan kerjaan sementara
update git

```
git add .
git commit -am"hari ke 7, fungsi dengan nilai kembalian multiple"
git push origin main
```

### nilai kembalian tupel optional

bayangkan jika array yang di masukkan pada parameter fungsi minMedMax(array :[])
maka akan error

sehingga dibutuhkan mekanisme untuk mengembalikan nilai nil jika parameter array adalah sebuah Array kosong

```
func minMedMax(array: [Int]) -> (min: Int, med: Double, max: Int) ? {
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

let (min,med,max) = minMedMax(array: []) ?? (0,0,0)
print("nilai minimal adalah \(min)")


let mmm = minMedMax(array: [])
print("nilai maksimal adalah \(mmm?.max ?? 0 )")

```

## Fungsi dengan nilai parameter default

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

print(tabunganUSD)
```

## variadic parameter

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


tagar: #SwiftUI #ngodingbarengstargan #iosdeveloper
