# HARI KE-2 Tantangan100hari SwiftUI


## DESCRIPTION

data tipe sederhana, bagian 2

Chapters:
0:0 Pembukaan
1:47 Chitchat receh
2:44 review hari pertama tentang variable, konstanta, string, angka
7:11 tipe data boolean
9:45 Ringkasan data tipe sederhana


## Chapter 1. PEMBUKAAN

Selamat datang di hari ke-2 #Tantangan100hari SwiftUI

Tantangan100hari SwiftUI bersama Stargan ini diadopsi dari hackingwithswift nya paul hudson 

what is SwifUI 

<https://developer.apple.com/xcode/swiftui/>

> **SwiftUI** helps you build great-looking apps across all Apple platforms with the power of Swift — and as little code as possible. With SwiftUI, you can bring even better experiences to all users, on any Apple device, using just one set of tools and APIs.


Kali ini kita akan belajar tentang tipe data Boolean, 
tapi ... saya penasaran awal istilah dan bertanya pada google "who is boolean" ternyata menurut 

https://www.britannica.com/biography/George-Boole

"English mathematician who helped establish modern symbolic logic and whose algebra of logic, now called Boolean algebra, is basic to the design of digital computer circuits."

hooo gituuuu 

## Chapter 2. REVIEW variable, konstanta, string, angka Integer dan Double

pada hari ke-1 kita sudah belajar tentang variable, konstanta, string, angka Integer dan Double, kita akan mereview kembali pembelajaran hari ke-1

buat new playground MyPlagroundReview2-1

```Swift
//mendefinisikan variable 

var intejerA = 1 
var dobelA = 2.1 

//mendefiniskan variable dengan type annotation

var intejerB:Int = 3
var dobelB:Double = 3.1

//variable angka yang berbeda tipe tidak bisa dilakukan operasi matematika

//code berikut ini akan menyebabkan error
let jumlahAB = intejerA + dobelA  

//operasi yang benar dan mendefinisikan konstanta
let jumlahIntejerAB = intejerA + intejerB
let jumlahDobelAB = dobelA + dobelB

//mendefiniskan variabel dan konstanta dengan type annotation tanpa nilai awal
var variabelTanpaNilaiAwal:Int 
var konstantaintegerTanpaNilaiAwal:Int 

//mendefinisikan strings 

var teks1 = "ini adalah strings pertama"

var teks2 = "ini adalah strings kedua"

let teksGabungan = teks1 + " sisipan 🤫 " +teks2

//teks dan Int tidak dapa di gabung dengan operator +
let gabunganTerlarang = teks1 +  jumlahIntejerAB + teks2

var teksPanjang = """
ini adalah strings panjang
multiline
"""

let teksInterpolasi = "menyisipkan variabel \(intejerA) ataupun konstan \(dobelB) di teks"

//menyisipkan fungsi / operasi aritmatik di dalam string interpolation

let aritmatikDalamTeks = " jumlah integer adalan \(intejerA + intejerB) "

let petikDuaDalamTeks = "ayo semua teriakkan \"semangat gan!!!\" "
```

## Chapter 3. Data tipe Boolean

mendefinisikan boolean

```Swift
let sudahMakan = true
let sudahSelesai = false

let sudahDijawab: Bool

let angka = 14421
let apakahPerkalianDari = angka.isMuplipe(of: 7)

//Boolean tidak mempunya operasi aritmatika namun mempunyai operator negasi dengan tanda seru ! 

var apakahBenar = false
apakahBenar = !apakahBenar
print(apakahBenar)
apakahBenar = !apakahBenar

//boolean mempunyai fungsi toggle() untuk membalik nilai 
sudahSelesai.toggle()
print(sudahSelesai)

```

## Chapter 4. Ringkasan Data Tipe Sederhana

- Swift menggunakan **let** untuk mendefinisikan konstanta, dan variabel menggunakan **var**
- untuk membuat variabel string kita menggunakan petik dua di awal dan akhir
- Bilangan bulat pada swwift adalah integers **Int**
- Bilangan desimal disebut dengan **Double** 


### Penjelasan Ringkasan 

- jika kita tidak berencana untuk merubah sebuah nilai gunakan **let** agar tidak terjadi kesalahan tidak sengaja terhadap perubahan nilai

- String Swift dapat menampung pendek maupun teks yang panjang, menampung semua karakter dari semua bahasa, dapat pula berisi emoji, mempunyai fungsi seperti uppercased() hasPrefix() count() dsb

- Swift mempunyai operator aritmatika seperti **+,-,\*** serta operator penambahan dengan dirinya sendiri menggunakan **+=** dan pengurangan **-=**

- String interpolation dapat menyisipkan konstanta maupun variable ke dalam string secara efisien



