import Foundation

print("HARI ke-6 #Tantangaan100hari SwiftUI")

//## for-in loop

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
// abaikan nilainya dengan menggunakan underscore _

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
for kode in stride(from: 0, to: maksimumKode, by: intervalPengkodean){
    kodeGenap.append(kode)
}
print(kodeGenap)

var kodeHuruf:[String] = []
for kode in stride(from: 0, to: maksimumKode, by: intervalPengkodean){
    var kodeBaru = String(kode)
    kodeBaru.insert(contentsOf: "00000", at: kodeBaru.startIndex)
    
// let len = kodeBaru.count
// let selisih = len - 5
    
//    for _ in 0..<selisih {
//        kodeBaru.remove(at: kodeBaru.startIndex)
//    }
    let range = kodeBaru.startIndex..<kodeBaru.index(kodeBaru.startIndex, offsetBy: 2)
    kodeBaru.removeSubrange(range)
    
    kodeHuruf.append(kodeBaru)
}

print(kodeHuruf)

// rentang tertutup dengan interval

let interval5 = 5
let includeMaksimumKode = 35
for kode in stride(from: 10, through: includeMaksimumKode, by: interval5) {
    print(kode)
}

// ## While loops
// - while mengevaluasi kondisi di awal loop
// - repeat-while mengevaluasi kondisi di akhir loop

// bentuk umum while

//while kondisi {
//    //pernyataaan
//}

// contoh penggunaaan while pada permainan ular tangga 16 kotak
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
            //jika masih di papan naik atau turun sesuai ular atau tangga
            pijakan += papan[pijakan]
    }
    if pijakan > kotakFinis {
        pijakan = kotakFinis - ( pijakan - kotakFinis )
    }
    print(pijakan)
}
print("YEAY MENANG")


repeat {
    // lempar dadu
    angkaDadu = Int.random(in: 1...6)
    print("dadu \(angkaDadu)")
    // pindah sejumlah angka dadu
    pijakan += angkaDadu
    if pijakan < papan.count {
            //jika masih di papan naik atau turun sesuai ular atau tangga
            pijakan += papan[pijakan]
    }
    if pijakan > kotakFinis {
        pijakan = kotakFinis - ( pijakan - kotakFinis )
    }
    print(pijakan)
} while pijakan < kotakFinis
print("YEAY MENANG JUGHa")
            
let arrayOnderdil = ["QZ030469","ME013307","ME035829","ME515796","ME971553","ME017246","ML150003","MZ320389","MK585622A"]

var onderdilKodeSet = Set<String>()

for onderdil in arrayOnderdil {
    let indexOnderdil = onderdil.index(onderdil.startIndex, offsetBy: 2)
    let kodeDepan = onderdil[..<indexOnderdil]
    // rubah hasil menjadi string.
    let kodeBaru = String(kodeDepan)
    if onderdilKodeSet.contains(kodeBaru) != true {
        print("tambahkan \(kodeBaru) to onderdilKodeSet")
        onderdilKodeSet.insert(kodeBaru)
        continue
    }
    print("kode \(kodeBaru) sudah pernah ada")
}

let filenames = ["gambar.jpg", "catatan.txt", "lover.jpg", "banner.xcf"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(filename)")
}

let bilangan1 = 57
let bilangan2 = 18

var kpk:Int?

for i in 1...1_000_000 {
    print(i)
    if(i.isMultiple(of: bilangan1) && i.isMultiple(of: bilangan2)) {
        kpk = i
        break
    }
}
print("kpk dari \(bilangan1) dan \(bilangan2) adalah \(kpk!)")


