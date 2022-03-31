import Foundation

// In out parameter


var tabungan:Double = 0
var tabunganUSD:Double = 0

func menabung(sejumlah uang: Double, di akun: inout Double) {
   return akun += uang
}

menabung(sejumlah: 1_050_000, di: &tabungan)

print(tabungan)

// Tipe fungsi

func hitungPenambahan(_ a: Int, _ b: Int ) -> Int {
    return a + b
}

func hitungPerkalian(_ a: Int, _ b: Int ) -> Int {
    return a * b
}

func ngegosip(){
    print("pssst.... ada gosip menarik nih")
}

var fungsiMatematika: (Int, Int) -> Int = hitungPenambahan

print(fungsiMatematika(2,3))

fungsiMatematika = hitungPerkalian

print(fungsiMatematika(2,3))

let fungsiMatematikaLainnya = hitungPenambahan

print(fungsiMatematikaLainnya(2,3))

//menggunakan tipe fungsi sebagai parameter fungsi lain

func cetakHasilHitung(_ fungsiMatematika: (Int, Int) -> Int, _ m: Int, _ n: Int ) {
    print(fungsiMatematika(m,n))
}

cetakHasilHitung(hitungPerkalian, 4, 3)

// tipe fungsi sebagai tipe kembalian

func mundur(_ input: Int) -> Int {
    return input - 1
}

func maju(_ input: Int) -> Int {
    return input + 1
}

func pilihFungsiMelangkah(isMundur: Bool) -> (Int) -> Int {
    return isMundur ? mundur : maju
}

var posisi = 5

let mendekatiNol = pilihFungsiMelangkah(isMundur: posisi > 0 )

print(posisi)

while posisi > 0 {
    print(posisi)
    posisi = mendekatiNol(posisi)
}

let menujuJuara = pilihFungsiMelangkah(isMundur: posisi >= 10 )

while posisi <= 10 {
    print(posisi)
    posisi = menujuJuara(posisi)
}

// ## nested fungsion / fungsi dalam fungsi

func pilihFungsiMelangkahbaru(isMundur: Bool) -> (Int) -> Int {
    func maju(_ input: Int) -> Int {
        return input + 1
    }
    func mundur(_ input: Int) -> Int {
        return input - 1
    }
    return isMundur ? mundur : maju
}

let mendekatiNolLagi = pilihFungsiMelangkahbaru(isMundur: posisi > 0 )

print("============================")

while posisi > 0 {
    print(posisi)
    posisi = mendekatiNolLagi(posisi)
}




