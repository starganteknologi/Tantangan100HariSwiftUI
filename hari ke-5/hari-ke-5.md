# Operator

“An operator is a special symbol or phrase that you use to check, change, or combine values”

Excerpt From
The Swift Programming Language (Swift 5.6)
Apple Inc.

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

let angka

if angka == 1 { 
	
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



