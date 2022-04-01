# Closure

Selamat Datang di hari ke-9 Tantangan100hari SwiftUI bersama Stargan

Link youtube : https://youtu.be/epm5RWhtMGo

Tantangan100hari SwiftUI adalah sebuah program untuk belajar SwiftUI dalam 100 hari

Setiap hari kita akan belajar paling lama 1 jam tentang satu topik dalam Swift dan SwiftUI

Untuk setiap topik yang kita pelajari kita akan publish di  Yotube Stargan

<https://www.youtube.com/channel/UCLk_BuhUhc70L0XAZ3C0McQ>

Video yang dipublikasikan akan dikelompokkan dalam playlist **Tantangan100Hari SwiftUI**

<https://www.youtube.com/playlist?list=PLafRxseOA_P7QoTjwlNApOHHZNtknXU81>

subscribe channel stargan agar anda dapat terus mendapatkan update tips-tips receh seputar dunia IT,
analisa proyek-proyek sistem informasi, coding mengkoding, mengelola database

kali ini kita belajar tentang Closure

## Closure

Closure adalah suatu blok fungsional mandiri yang dapat menangkap dan menyimpan variabel atau konstanta dari suatu konteks kode, dimana Closure tersebut didefinisikan

Global dan nested function sebenernya merupakan bentuk Closure spesial

Closure dapat berupa salah satu dari 3 bentuk

- fungsi global adalah closure yang mempunyai nama dan tidak menangkap nilai
- nested function adalah closure yang mempunyai nama dan dapat menangkap nilai dari fungsi didalamnya
- ekspresi closure adalah closure tanpa nama yang di tulis dalam sintak sederhana/ringan yang dapat menangkap nilai dari konteks sekitarnya

closure ini adalah salah satu konsep yang cukup membingunkan bagi pemula namun juga sangat powerfull yang akan kita temui di banyak tempat...
so...biasakan diri kita untuk menulisnya

jika kita pusing... santai aja emang rada-rada membingunkan

tapi jangan kuatir, semakin kita membiasakan diri dengan closure semakin lebih mudah kita bakal memahaminya

Chapters:
0:00 Pembukaan
3:33 bagaimana membuat dan menggunakan closure
16:44 bagaimana mengembalikan sebuah nilai dari sebuah closure tanpa parameter
26:56 contoh penggunaan closure sebagai parameter fungsi
31:58 pengurutan pada non comparable type
44:35 contoh kekuatan closure lainnya
-:- penutup




## bagaimana membuat dan menggunakan closure

kita akan mulai dengan contoh fungsi kita sebelumnya

```

func nanya(){
    print("bang/neng sini donk")
}

nanya()

var takon = nanya

takon()

func panggilAbang(jualan: String) {
  print("Baaang beli \(jualan)nya!!!!")
}

//panggilAbang(jualan: "mie ayam")

var panggilSiAbang = panggilAbang

panggilSiAbang("nasgor")


func panggilEneng(jualan: String) -> String {
  return "neeng beli \(jualan)nya!!!!"
}

panggilEneng(jualan: "bakso")

var panggilSiEneng = panggilEneng

panggilSiEneng("sate")

// membuat dan menggunakan closure
let panggilanSayang = {
    print("pagiii cintaaa")
}

panggilanSayang()

// jika ingin menambahkan parameter

let panggilanKampung = { (sebutan: String) in
    print("\(sebutan) gmn kabarnya ? ")
}

let panggilanLainnya = { (sebutan: String) -> String in
    return "\(sebutan) gmn kabarnya ? "
    //"\(sebutan) gmn kabarnya ? "
}

```

## mengapa parameter dalam swift berada dalam kurung kurawal

```
let donasi = (donatur: String)
```
swift bakal bingung krn seperti mendefinisikan tupel

## bagaimana mengembalikan sebuah nilai dari sebuah closure tanpa parameter

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


## penggunaan closure sebagai parameter fungsi

```
let siswa: Set = ["hofi", "juraa", "kepsek","zetaa","beta"]

let descendingSiswa = siswa.sorted(by: >)

let ascendingSiswa1 = siswa.sorted(by: < )

let ascendingSiswa2 = siswa.sorted()


func urutKepsekDuluan(_ nama1: String, _ nama2: String) -> Bool {
    if nama1 == "kepsek" {
        return true
    }
    else if nama2 == "kepsek" {
        return false
    }
    return nama1 < nama2
}

let urutanBarisanSekolah = siswa.sorted(by: urutKepsekDuluan)


// closure

let closureUrutan = { (nama1: String, nama2: String) -> Bool in
    if nama1 == "kepsek" {
        return true
    }
    else if nama2 == "kepsek" {
        return false
    }
    return nama1 < nama2
}

let urutanLainnya = siswa.sorted(by: closureUrutan)

let uratanBarisanPakeClosure = siswa.sorted(by: { (nama1: String, nama2: String) -> Bool in
    if nama1 == "kepsek" {
        return true
    } else if nama2 == "kepsek" {
        return false
    }
    return nama1 < nama2
})
```


## fungsi sorting pada sebuah tipe yang non comparable

```
enum HTTPResponse {
    case ok
    case error(Int)
}

let responses : [HTTPResponse] = [.error(500), .ok , .ok , .error(400), .error(503)  ]

func pakeFungsiUrut(_ a: HTTPResponse, _ b: HTTPResponse) -> Bool {
    switch (a, b) {
    case let (.error(aCode), .error(bCode)):
        return aCode < bCode
    case (.ok, .ok): return false
    case (.error, .ok) : return true
    case (.ok, .error): return false
    }
}

let urutanResponse = responses.sorted(by: pakeFungsiUrut)


let sortedResponse = responses.sorted {
    switch ($0, $1) {
    case let (.error(aCode), .error(bCode)):
        return aCode < bCode
    case (.ok, .ok): return false
    case (.error, .ok) : return true
    case (.ok, .error): return false
    }
}

print(sortedResponse)
```

## Memendekkan sintak closure


// memendekkan definisi sintak closure

tipe fungsi dari sorted adalah pasti (String, String) -> Boolean kenapa mesti dikasih tipe pada parameternya ??
tidak perlu juga klo mau

```
// let urutanClosureLagi = siswa.sorted(by: { (nama1: String, nama2: String) -> Bool in
// let urutanClosureLagi = siswa.sorted(by: { (nama1, nama2) -> Bool in
// let urutanClosureLagi = siswa.sorted(by: { (nama1, nama2) in
// trailing closure sintak
let urutanClosureLagi = siswa.sorted { nama1, nama2 in
    if nama1 == "kepsek" {
        return true
    } else if nama2 == "kepsek" {
        return false
    }
    return nama1 < nama2
}

// sswift dapat otomatis memberi nama parameter $0 $1 dst
let urutanClosureShorthand = siswa.sorted {
    if $0 == "kepsek" {
        return true
    } else if $1 == "kepsek" {
        return false
    }
    return $0 < $1
}

let urutanDibalik = siswa.sorted {
    return $0 > $1
}
```

## contoh kekuatan closure lainnya

```
let kDoank = siswa.filter{ $0.hasPrefix("k")}
print(kDoank)

let kapitalSiswa = siswa.map{ $0.uppercased() }
print(kapitalSiswa
```

kita akan banyak sekali menggunakan closure dalam SwiftUI, jadi pastikan kita sudah memahami tentang closure

sebagai penutup dapat kita simpulkan
- fungsi dapat di coppy, bedanya ketika dicopy maka nama parameternya menjadi hilang
- kita dapat membuat closure dengan mengassign ke variable atau konstanta
- fungsi yang menerima parameter atau mengembalikan nilai harus di deklarasikan di dalam kurung kurawal
- fungsi dapat menerima tipe fungsi tertentu, kita dapat menggunakan closure untuk mengisi parameter tersebut
- Swift dapat secara cerdas parameter tipe fungsi yang di deklarasikan menggunakan fungsi maupun closure
- kita dapat menggunakan nama singkatan $0 $1 dst , namun gunakan singkatan tersebut dengan seksama sesuai kondisi, usahakan penggunaannya tersebut tidak membingungkan ketika kita kembali melihat kode kita beberapa waktu kemudian
- closure merupakan salah satu yang tersulit dan membingungkan untuk dipelajari, butuh waktu dan praktek untuk memahaminya

jika anda merasa bahwa pembelajaran ini bermanfaat, silakan subscribe agar tidak ketinggalan, krn kita akan mengupdate konten kita secara berkala setiap hari selama 100 hari

salam sehat, dan tetap semangan GAN
