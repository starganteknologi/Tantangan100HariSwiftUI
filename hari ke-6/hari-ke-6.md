# Looping

Selamat Datang di hari ke-6 Tantangan100hari SwiftUI bersama Stargan


Pembelajaran hari ini tentang Looping di Swift
kita akan mengupas tentang for-in loop, while, repeat-while

kemudian kita juga berbicara tentang bagaimana untuk skip iteration pada loop menggunakan continue dan break

contoh kode loop kali ini lebih menantang dengan menggabungkan skill yang kita pelajari selama 6 hari ini. kita akan implementasikan dalam menyelesaikan permainan ular tangga dan menghitung kelipatan persekutuan terkecil

tagar
#SwiftUI #ngodingbarengStargan #iOSdeveloper

link youtube : https://youtu.be/J_KYBKT97GY

Chapters:
0:10 looping for-in loop
15:55 rentang tertutup dengan interval
17:33 While loop (while dan repeat-while)
18:41 Ular tangga stargan
29:26 continue dan break dari loop
37:55 mencari kelipatan persekutuan kecil menggunakan looping
41:17 simpat ke git

## for-in loop

for-in loop untuk iterasi arrays, dictionaries, range, string dan sekuence lainnya

tagar
#SwiftUI #ngodingbarengStargan #iosDevelopment

```swift

//iterasi pada array

let ibukota = ["jakarta","bandung","yogyakarta","semarang","surabaya"]

for kota in ibukota {
	print("selamat datang di \(kota)")
}

//iterasi pada dictionary

let sisiSisi = ["segitiga": 3, "persegi": 4, "lingkaran": 1, "segilima": 5]

for (namaBangunDatar, jumlahSisi) in sisiSisi {
	print("\(namaBangunDatar) mempunyai \(jumlahSisi) sisi")
}

//iterasi pada rentang angka

for angka in 10...15 {
        print ("angka \(angka)")
}


for angka in 10..<15 {
        print ("angka \(angka)")
}

for kota in ibukota[3...] {
	print(kota)
}


for kota in ibukota[...3] {
	print(kota)
}

for kota in ibukota[..<3] {
	print(kota)
}

// jika kita tidak memerlukan nilai dari sekuence, kita bisa
// abaikan nilainya dengan menggunakan undersscore _
var iterasiKe = 0
for _ in ibukota {
    iterasiKe += 1
    print("putaran ke \(iterasiKe)")
}

let angkaPokok = 2
let pangkat = 5
var jawaban = 1

for _ in 1...pangkat {
	jawaban *= angkaPokok
}
print("\(angkaPokok) pangkat \(pangkat) adalah \(jawaban)")


// looping dengan nilai interval


var kodeGenap:[Int] = []
let intervalPengkodean = 4
let maksimumKode = 100
for kode in stride(from:0, to:maksimumKode, by: intervalPengkodean ){
    kodeGenap.append(kode)
}
print(kodeGenap)

var kodeHuruf:[String] = []
for kode in stride(from:0, to:maksimumKode, by: intervalPengkodean ){
    var kodeBaru = String(kode)
    kodeBaru.insert(contentsOf: "00000", at: kodeBaru.startIndex)

    let len = kodeBaru.count
    let selisih = len - 5
    for _ in 0..<selisih {
        kodeBaru.remove(at: kodeBaru.startIndex)
    }

//    let range = kodeBaru.startIndex..<kodeBaru.index(kodeBaru.startIndex, offsetBy: 2)
//    kodeBaru.removeSubrange(range)

    kodeHuruf.append(kodeBaru)
}
print(kodeHuruf)


// rentang tertutup dengan interval

let interval5 = 5
let includeMaksimumKode = 35
for kode in stride(from: 10, through: includeMaksimumKode, by: interval5) {
    print(kode)
}
```

## While loops

- while mengevaluasi kondisi di awal loop
- repeat-while mengevaluasi kondisi di akhir loop

bentuk umum while

while kondisi {
	//pernyataaan
}

### contoh penggunaaan while pada permainan ular tangga 16 kotak

```Swift
let kotakFinis = 16
var papan = [Int] (repeating:0 , count: kotakFinis + 1)
papan[04] = +04; papan[07] = +07; papan[11] = +04
papan[09] = -06; papan[13] = -12

var pijakan = 0
var angkaDadu = 0
while pijakan < kotakFinis {
    // lempar dadu
    angkaDadu = Int.random(in: 1...6)
    print("dadu \(angkaDadu)")
    // pindah sejumlah angka dadu
    pijakan += angkaDadu
    if pijakan < papan.count {
        //jika masih di papan naik atau turun sesuai ular atau tanggak
        pijakan += papan[pijakan]
    }
    if pijakan > kotakFinis {
        pijakan = kotakFinis - (pijakan - kotakFinis)
    }
    print(pijakan)
}
print("FINISH")
````

### contoh penggunaan repeat-while pada permainan ulang tangga 16 kotak

```Swift
<!-- let kotakFinis = 16
var papan = [Int] (repeating:0 , count: kotakFinis + 1)
papan[04] = +04; papan[07] = +07; papan[11] = +04
papan[09] = -06; papan[13] = -12

var pijakan = 0
var angkaDadu = 0 -->

repeat {
    // lempar dadu
    angkaDadu = Int.random(in: 1...6)
    print("dadu \(angkaDadu)")
    // pindah sejumlah angka dadu
    pijakan += angkaDadu
    if pijakan < papan.count {
        //jika masih di papan naik atau turun sesuai ular atau tanggak
        pijakan += papan[pijakan]
    }
    if pijakan > kotakFinis {
        pijakan = kotakFinis - (pijakan - kotakFinis)
    }
    print(pijakan)
} while pijakan < kotakFinis
print("FINISH")
```



## Bagaimana cara untuk melewati/skip loop menggunakan break dan continue


### continue digunakan untuk melewati kode dalam satu iterasi

```Swift
let arrayOnderdil = ["QZ030469","ME013307","ME035829","ME515796","ME971553","ME017246","ML150003","MZ320389","MK585622A"]

//var onderdilKodeSet:Set<String>
var onderdilKodeSet = Set<String>()

for onderdil in arrayOnderdil {
    let indexOnderdil = onderdil.index(onderdil.startIndex, offsetBy: 2)
    let kodeDepan = onderdil[..<indexOnderdil]
    // rubah hasil menjadi string.
    let kodeBaru = String(kodeDepan)
    if onderdilKodeSet.contains(kodeBaru) != true {
        print("tambahkahn \(kodeBaru) to onderdilKodeSet")
        onderdilKodeSet.insert(kodeBaru)
        continue
    }
    print("kode \(kodeBaru) sudah pernah ada")
}

print(onderdilKodeSet)


let filenames = ["gambar.jpg", "catatan.txt", "lover.jpg", "banner.xcf"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

```

### break digunakan untuk keluar dari iterasi dan melewati semua iterasi tersisa

mencari kelipatan persekutaan terkecil KPK

```Swift
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


## Pernyataan Transfer Kontrol (control transfer statements)

break dan continue merupakan bagian dari control transfer statement

kontrol transfer merubah urutan  eksekusi kode dengan memindahkan kontrol dari satu bagian kode ke bagian lainnya. terdiri atas
- continue
- break
- fallthrough
- return
- throw

kita akan membahas transfer control statement pada kesempatan berikutnya
