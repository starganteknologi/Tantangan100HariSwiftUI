# Operator dan Pernyataan Kondisi


Operator adalah sebuah simbol khusus yang dapat digunakan untuk memeriksa, mengubah atau menggabungkan nilai


Chapters:
0:00 Pembukaan
0:19 Operator
3:43 Operasi Aritmatika
4:18 Operator Compound
5:32 Operator Perbandingan
6:34 Pernyataan Kondisi
14:41 Switch
16:36 range operator
21:05 iterasi dictionary
23:06 review hari ini

keterangan lebih lengkap dapat dilihat di 

https://github.com/starganteknologi/Tantangan100HariSwiftUI/blob/main/hari%20ke-5/hari-ke-5.md

tagar: 

#swiftui #ngodingbarengstargan #iosdeveloper


## Terminologi

Operators terdiri atas unary, binary, or ternary:

- Unary operators yaitu operasi atas satu target 
cth (-a). 
Unary prefix operaator yang muncul sebelum target 
unary postfix operators muncul setelah target (such as b!).”

- Binary operators yaitu operasi atas dua target + - * / %

- Ternary operators beroperasi pada 3 target. 
cth ternary conditional operator (a ? b : c).”

## unary minus operator

let empat = 4
let minusEmpat = -empat
let plusEmpat = -minusEmpat

## Operator Penugasan (Assignment Operator)

operator **=** menginisialisasi/memperbarui nilai bagian kiri dengan bagian kanan

```Swift

let z = 10
var r = 12

let (x, y) = (1, 2)

```

```

// operasi aritmatika

//penambahan

1 + 2 

//operator + juga mendukung penggabungan string

//pengurangan

3 - 4

//perkalian 

5 * 6

pembagian

7 / 8
```

## Modulus operator 

Modulus operator **%** adalah operator untuk menghitung sisa hasil pembagian 

5 % 3

## Operator compound/penggabungan

var x = 12 
//x  = x + 6
x += 6

x *= 6
x /= 2 



## Operator perbandingan

swift mendukung operator perbandingan sebagai berikut 

let a = 7
let b = 9

sama dengan a == b

tidak sama dengan a != b

lebih besaar a > b 

lebih kecil b < a

lebih besaar sama dengan a >= b

lebih kecil sama dengan aa <= b

setiap komparasi akan mengembalikan nilai Boolean


Operator perbandingan seringkali digunakan dalam pernyataan kondisi

## Pernyataan kondisi

### pernyataan kondisi dengan satu kondisi

```Swift
let dki = "jakarta"
let ikn = "nusantara"

if ikn == "nusantara" {
	print(" yeah ayo kita pindah ke \(ikn)")
} else { 
	print("bukan ibu kota baru")
}
```

### pernyataan kondisi dengan lebih dari satu kondisi menggunakan Operator Logika 

logika BUKAN !a
logika DAN a && b
logika ATAU a || b

```Swift
let tahun = 2024

if ikn == "nusantara" && tahun >= 2024 {
	print(" upacara bendera di kota baru")
} else { 
	print("upcaranya masih di jakarta")
}

```

## perbandingan pada tupel

let jc = ("jackie","chan")
jc > ("cu yun","fa")

(1,"kuda") < (2,"jaran")

(1,"kuda") < (1,"jaran")


## batasan pada komparasi < > <= >=

("rumah", true) < ("apartemen", false)  // Error karena operator < tidak bisa membandingkan nilai Boolean”

## Ternary operators 

``` Swift
a ? b : c
```

dibaca jika a bernilai benar maka b jika tidak maka c 
ini adalah kependekan dari penulisan 

if a {
	b
} else {
	c
}

```Swift
let luasTanah = 100
let pakePekarangan = true

let luasBangunan = luasTanah - ( pakePekarangan ? 30 : 10 )
```

## Nil-coalesing operator

m ?? n

m adalah tipe Opsional , Unwrap m jika berisi nilai, dan kembalikan default n jika m adalah nil

//let m:Int?
//jika menggunakan let maka harus diinisialisassi sebelum digunakan
var m:Int?

let n = 0

m ?? n

let mval = m != nil ? m! : n

## Switch 

switch berguna untuk pernyataann kondisi dengan 1 kondisi atau lebih, lebih mudah terbaca daripada "IF" jika kondisinya banyak


```Swift
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

## Range Operator / Operator Rentang

a nilai awal
b nilai akhir

rentang tertutup
```
// a...b 

for angka in 1..<15 {
        print ("angka \(angka)")
}
```

rentang setengah terbuka
```
// a..<b 


for angka in 1..<15 {
        print ("angka \(angka)")
}

let ibukota = ["jakarta","bandung","yogyakarta","semarang","surabaya"]
let count = ibukota.count
for i in 0..<count {
    print("ibukota \(i + 1) is called \(ibukota[i])")
}

```

rentang sebelah 

```
// a...  
// ...b  


for kota in ibukota[3...] {
	print(kota)
}


for kota in ibukota[...3] {
	print(kota)
}

```

rentang setengah terbuka sebelah 

```
for kota in kotaa[..<3] {
	print(kota)
}
```

## iterasi pada dictionary

```

let bilanganMenarik = [
    "Prima": [2, 3, 5, 7, 11, 13, 17],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Kuadrat": [1, 4, 9, 16, 25],
]
var terbesar = 0
for (key, bilangan) in bilanganMenarik {
    print(key)
    for angka in bilangan {
        if angka > terbesar {
            terbesar = angka
        }
    }
}
print(terbesar)
```



