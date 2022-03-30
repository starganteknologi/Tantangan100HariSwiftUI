import Foundation

print("Selamat Datang di hari ke-7 Tantangan100hari SwiftUI bersama Stargan")

// ## cara mendefinisikaan fungsi dan pemanggilannya

func luasLingkaran(r: Double) -> Double {
    return Double.pi * r * r
}

print(luasLingkaran(r: 5))

func panggilAbang(jualan: String) -> String {
    let teriak = "Baang beli \(jualan)nya!!!"
    return teriak
}

print(panggilAbang(jualan: "bakso"))


func kelilingPersegi(panjang : Double, lebar: Double, isPersegiPanjang: Bool) -> Void {
    let persegi = isPersegiPanjang ? "persegi panjang" : "persegi"
    print("keliling bangun datar \(persegi) adalah \(2 * panjang * lebar)")
}

let keteranganPersegi = kelilingPersegi(panjang: 2, lebar: 4, isPersegiPanjang: false)


func nongkrong(makan makanan: String) -> String {
    return "ujan-ujang nongkrong makan \(makanan)"
}

print(nongkrong(makan: "soto"))

func panggilAbang2(jualan makanan:String) -> String {
    let teriak = "Baang beli \(makanan)nya!!!"
    return teriak
}

panggilAbang2(jualan: "mie tektek")

func menyanyi(lagu: String) -> Void {
    print("lal la la")
    print("potongan lagu \(lagu)")
}

print(menyanyi(lagu: "gundul gundul pacul"))

func putarLagu(judul lagu: String) {
    print("puter lagu \(lagu) donk")
}

putarLagu(judul: "menggapai maatahari")

func minMedMax(array: [Int]) -> (min: Int, med: Double, max: Int){
    var sementaraMin = array[0]
    var sementaraMax = array[0]
    var median: Double = Double( (array[0] + array[0] ) / 2 )
    
    for nilai in array[1..<array.count] {
        if nilai < sementaraMin {
            sementaraMin = nilai
        } else if nilai > sementaraMax {
            sementaraMax = nilai
        }
    }
    
    median = Double ( (sementaraMin + sementaraMax) / 2 )
    return (sementaraMin, median, sementaraMax)
}

let mmm = minMedMax(array: [1,4,5,6,7,7,10])
print(mmm.min)

let (min, med, max) = minMedMax(array: [1,4,5,6,7,7,10])
print("nilai minimal pada array tsb adalah \(min) ")



func minMedMaxOptional(array: [Int]) -> (min: Int, med: Double, max: Int)? {
    if array.isEmpty {return nil}
    var sementaraMin = array[0]
    var sementaraMax = array[0]
    var median: Double = Double( (array[0] + array[0] ) / 2 )
    
    for nilai in array[1..<array.count] {
        if nilai < sementaraMin {
            sementaraMin = nilai
        } else if nilai > sementaraMax {
            sementaraMax = nilai
        }
    }
    
    median = Double ( (sementaraMin + sementaraMax) / 2 )
    return (sementaraMin, median, sementaraMax)
}

let mmx = minMedMaxOptional(array: [])

// print(mmx?.max)

print("nilai max adalah \(mmx?.max ?? 0 )")

// ## Fungsi dengan nilai parameter default

var tabunganIDR: Double = 0
var tabunganUSD: Double = 0

func menabung(sejumlah uang: Double, valuta: String = "IDR") {
    switch valuta {
    case "USD":
        tabunganUSD += uang
    case "MYR":
        print("g ada bos mata uang itu di tabungan")
    default:
        tabunganIDR += uang
    }
}

menabung(sejumlah: 1_000_000 )
print(tabunganIDR)

menabung(sejumlah: 50, valuta: "MYR")

menabung(sejumlah: 50, valuta: "USD")
print(tabunganUSD)

func hitungRerata(_ bilangan: Double...) -> Double {
    var total: Double = 0
    for angka in bilangan {
        total += angka
    }
    return total / Double(bilangan.count)
}

print(hitungRerata(1,2,4,5,6,6,79))

func minMaxVariadic (_ bilangan: Int...) -> (min: Int, max: Int) {
    var nilaiMin = 0
    var nilaiMax = 0
    for angka in bilangan {
        if angka < nilaiMin {
            nilaiMin = angka
        } else if angka > nilaiMax {
            nilaiMax = angka
        }
    }
    return (nilaiMin, nilaiMax)
}

print(minMaxVariadic(5,7,8,3,57,8))
