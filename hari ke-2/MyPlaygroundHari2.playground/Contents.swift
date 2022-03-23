//mendefinisikan variable

var intejerA = 1
var dobelA = 2.1

// mendefiniskna variable dengan type annotation
var intejerB:Int = 3
var dobelB:Double = 5.1

//operasi aritmatika pada angka
let jumlahInteger = intejerA + intejerB
let jumlahDouble = dobelA + dobelB

//tidak dapat dilakukan
//let jumlah = intejerA + dobelA

//untuk mendefiniskan konstanta dengan type annotation

let jumlah:Double

jumlah = dobelA + dobelB

//mendefenisikan string

var stringSaya = "ini adalah string pertama"

var teksKedua = "ini adalah string kedua"

var teksGabungan = stringSaya + teksKedua

//operasi terlarang
//let gabunganAngkaDanString = teksGabungan + jumlahDouble

let teksInterpolasi = "menyisipkan variabel \(intejerA) ataupun konstan \(dobelB) di teks"

let petikDuaDalamTeks = "ayo semua teriakkan \"semangat gan!!!\" "

var teksPanjang = """
ini adalah strings panjang
multiline
"""

// BOOLEAN

let sudahMakan = true
let sudahSelesai = false

let apakahPakeAnnotation:Bool
apakahPakeAnnotation = true

let angka = 15341
let apakahPerkalianDari = angka.isMultiple(of: 7)

// boolean tidak punya operasi aritmatika + - /*
// boolean mempunyai operasi negasi

var makanGula = false
makanGula = !makanGula
print(makanGula)

//boolean mempunya fungsi toggle()

makanGula.toggle()
print(makanGula)
