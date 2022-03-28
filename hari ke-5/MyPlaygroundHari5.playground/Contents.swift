// OPERATOR

//unary
//-a

//b!

//binary operator
// + - * / %

//ternary operator
// a ? b : c

// unary minus operator
let empat = 4
let minusEmpat = -empat
let plusEmpat = -minusEmpat

// Operator Penugasan (assignment operator)

let z = 10
let r = 12

let (x,y) = (1,2)

//oeprasi aritmatika

1 + 1

2 - 3

3 * 2

4 / 2

// modulus operator

5 % 3


// Operator compound

var e = 12

e = e + 2

e += 2

e *= 5

e /= 4

// operator perbandingan

let d = 7
let f = 9

d == f

d != f

d < f

d > f

// PERNYAATAAN KONDISI

let dki = "jakarta"
let ikn = "nusantara"

if ikn == "nusantara" {
    print(" yeah ayo kita pindah ke \(ikn)")
} else {
    print("bukan ibu kota baru")
}

// penyatann kondisi dengan lebih dari 1 kondisi
// logika BUKAN !a
// logika DAN a && b
// logika ATAU a || b

let tahun = 2024

if ikn == "nusantara" && tahun >= 2024 {
    print(" upacara bendera di kota baru")
} else {
    print("upcaranya masih di jakarta")
}

let jc = ("jackie","chan")
jc > ("cu yun","fa")

(1,"kuda") < (2,"jaran")

(1,"kuda") < (1,"jaran")

// batasan komparasi // boolean tidak bisa dibandingkan
//("rumah", true) < ("apartemen", false)

// Ternary Operator
//a ? b : c
//
//if a {
//    b
//} else {
//    c
//}

let luasTanah = 100
let pakePekarangan = false

let luasBangunan = luasTanah - ( pakePekarangan ? 30 : 10 )

print(luasBangunan)

// Nil-coaleing operator

//m ?? n

//m adalah tipe Opsional , Unwrap m jika berisi nilai, dan kembalikan default n jika m adalah nil

var m:Int?
let n = 0
m = 2
m ?? n

let mval = m != nil ? m! : n
print(mval)


// SWITCH


let makanan = "sop buntut"

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

//range operator

//range tertutup
//a nilai awal
//b nilai akhir
// a...b


for angka in 1...15 {
        print ("angka \(angka)")
}


//range setengah terbuka
// a..<b
for angka in 1..<15 {
        print ("angka \(angka)")
}


let ibukota = ["jakarta","bandung","yogyakarta","semarang","surabaya"]
let count = ibukota.count
for i in 0..<count {
    print("ibukota \(i + 1) is called \(ibukota[i])")
}

// rentang sebelah

// a...
// ...b

for kota in ibukota[3...] {
    print(kota)
}

for kota in ibukota[...3] {
    print(kota)
}

//rentang setengah terbuka sebelah

for kota in ibukota[..<3] {
    print(kota)
}



let bilanganMenarik = [
    "Prima": [2, 3, 5, 7, 11, 13, 17, 19],
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

