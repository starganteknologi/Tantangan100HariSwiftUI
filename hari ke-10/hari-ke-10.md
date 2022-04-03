# Struct

Selamat Datang di hari ke-10 Tantangan100hari SwiftUI bersama Stargan

Link youtube : https://youtu.be/k89wddMABuw

Tantangan100hari SwiftUI adalah sebuah program untuk belajar SwiftUI dalam 100 hari

Setiap hari kita akan belajar paling lama 1 jam tentang satu topik dalam Swift dan SwiftUI

yang dipublikasikan di playlist **Tantangan100Hari SwiftUI**

<https://www.youtube.com/playlist?list=PLafRxseOA_P7QoTjwlNApOHHZNtknXU81>

di channel stargan

<https://www.youtube.com/channel/UCLk_BuhUhc70L0XAZ3C0McQ>

subscribe channel stargan agar anda dapat terus mendapatkan update tips-tips receh seputar dunia IT,
analisa proyek-proyek sistem informasi, coding mengkoding, mengelola database

kali ini kita belajar tentang Struct dan Class

Chapters:
0:00 Pembukaan
1:47 definisi
4:23 akses dan assign properti
9:38 struct adalah tipe value
10:40 class adalah tipe reference
14:10 identity operator
16:07 properties
20:21 lazy stored properties
25:00 computed properties
35:33 shorthand computed properties


## perbandingan Struct dan Class

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


## sintak

```
struct pegawai {
  // definisnya disini
}

class pegawaiKontrak {
  //definisi class
}
```

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

```

## instance struct dan class

```
let dimensi = Dimensi()
let angkot = Mobil()
```

## akses properti

```
print("panjang satu dimensi adalah \(dimensi.panjang)")
print("lebar angkot adalah \(angkot.dimensi.lebar)")
```

## assign properti
```
angkot.nama = "A55"
print("nama angkot adalah \(angkot.nama!)")
```

## struct dan Enum adalah value types

```
let dimensiKecil = Dimensi(panjang: 2.5, lebar: 1.7, tinggi: 1.5 )
let dimensiMobil = dimensiKecil

dimensiKecil.panjang = 2.7
print("dimensi kecil berubah jadi \(dimensiKecil.panjang) ")
print("dimensi nobil tetep \(dimensiMobil.panjang) ")

```

## clas adalah tipe reference

```
let transjakarta = Mobil()
transjakarta.dimensi = dimensiKecil
transjakarta.nama = "blokm-senayan"
transjakarta.kecepatanMaksimal = 80


let tjLain = transjakarta
let tjKota = tjLain
tjLain.nama = "rambutan-rebo"

print(transjakarta.nama!)
```


## identity operator
karena class adalah reference tipe maka bisa jadi banyak instance konstanta dan variabel merujuk satu instance kelas yang sama
sehingga swift menyediakan operator === dan !=== untuk melakukan pengecekan

```
if tjKota === transjakarta {
  print("samaa aja tj tj juga")
} else {
    print("bedaa ")
}
```

## properties

stored properti adalah properti konstanta atau variabel yg disimpan sebagai bagian suatu instance kelas / struct

```
struct AngkutanUmum {
  var penumpang: [String]
  let sopir: String
}

var S22 = AngkutanUmum(penumpang: ["aca","budi","cuan","didi"], sopir: "eka")

//S22.sopir = "ganti" tidak bs di rubah

let taksi = AngkutanUmum(penumpang: ["fifa"], sopir: "gigi")

//taksi.penumpang.remove(at: 0) // tidak bs karena taksi di definisikan sbg konstantaa
```

## lazy stored properties

adalah suatu properti yang nilai initialnya tidak dihitung sampe saat pertama kali digunakan



```
class DataImporter {
  /*
  omit
  */
  var filename = "data.txt"
  /*
  omit
  */
}

class DataManager {
  lazy var importer = DataImporter()
  var data: [String] = []
}

let manager = DataManager()
manager.data.append("data baru")
maanager.data.append("tambah lagi")
// DataImporter instance dari properti importer blm di bikin

print(manager.importer.filename)
```

## computed properties

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
      let tengahX = titikAwal.x + (ukuran.lebar / 2)
      let tengahY = titikAwal.y + (ukuran.tinggi / 2)
      return Titik(x: tengahX, y: tengahY)
    }
    set(tengahBaru) {
      titikAwal.x = tengahBaru.x - ( ukuran.lebar / 2)
      titikAwal.y = tengahBaru.y - ( ukuran.tinggi / 2)
    }
  }
}

var kotak = Persegi(titikAwal: Titik(x: 0.0, y: 0.0), ukuran: Ukuran(lebar: 5, tinggi: 5))

let initialKotakTengah = kotak.tengah
print(initialKotakTengah)
kotak.tengah = Titik(x: 10, y: 10)

print(kotak.titikAwal)
```

## shorthand setter

jika setter tidak mendefinisikan nama untuk nilai baru maka defaultnya akan bernama **newValue**

```
struct PersegiBaru {
  var titikAwal = Titik()
  var ukuran = Ukuran()
  var tengah: Titik {
    get {
      let tengahX = titikAwal.x + (ukuran.lebar / 2)
      let tengahY = titikAwal.y + (ukuran.tinggi / 2)
      return Titik(x: tengahX, y: tengahY)
    }
    set {
      titikAwal.x = newValue.x - ( ukuran.lebar / 2)
      titikAwal.y = newValue.y - ( ukuran.tinggi / 2)
    }
  }
}


struct PersegiMini {
  var titikAwal = Titik()
  var ukuran = Ukuran()
  var tengah: Titik {
    get {
        Titik(x: titikAwal.x + (ukuran.lebar / 2) , y: titikAwal.y + (ukuran.tinggi / 2))
    }
    set {
      titikAwal.x = newValue.x - ( ukuran.lebar / 2)
      titikAwal.y = newValue.y - ( ukuran.tinggi / 2)
    }
  }
}
```
