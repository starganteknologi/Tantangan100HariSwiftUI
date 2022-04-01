import UIKit

var greeting = "Hello, playground"



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



let kDoank = siswa.filter{ $0.hasPrefix("k")}
print(kDoank)

let kapitalSiswa = siswa.map{ $0.uppercased() }
print(kapitalSiswa)
