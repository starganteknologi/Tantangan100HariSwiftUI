import UIKit

var greeting = "Hello Stargan"

struct Tumpeng {
    var tinggi = 0.0, jariJari = 0.0
    var volume: Double {
        return (1/3) * Double.pi * jariJari * jariJari
    }
    var takaranAyam: Double {
        return volume * 0.1
    }
}

let tumpeng = Tumpeng(tinggi: 10, jariJari: 5)

print(tumpeng.takaranAyam)

// PROPERTI OBSERVER

class counterPenumpang {
    var totalPenumpang = 0 {
        willSet {
            print("akan mengatur jumlah penumpang sejumlah \(newValue) ")
        }
        didSet {
            if totalPenumpang > oldValue {
                print("penumpang naik sebanyak \(totalPenumpang - oldValue)")
            }
        }
    }
}

let penumpangAnkot = counterPenumpang()
penumpangAnkot.totalPenumpang = 5
penumpangAnkot.totalPenumpang = 7


// properti wrapper

@propertyWrapper
struct EnamAtauKurang {
    private var angka = 0
    var wrappedValue: Int {
        get{return angka}
        set{angka = min(newValue,6) }
    }
}

struct persegiMungil {
    private var _panjang = EnamAtauKurang()
    private var _lebar = EnamAtauKurang()
    
    var panjang: Int {
        get{return _panjang.wrappedValue}
        set{_panjang.wrappedValue = newValue}
    }
    
    var lebar: Int {
        get{return _lebar.wrappedValue}
        set{_lebar.wrappedValue = newValue}
    }
}

var kotak = persegiMungil()
print("lebar kotak = \(kotak.lebar)")
kotak.lebar = 4
print("lebar kotak = \(kotak.lebar)")
kotak.lebar = 10
print("lebar kotak = \(kotak.lebar)")

struct PersegiKecil {
    @EnamAtauKurang var panjang: Int
    @EnamAtauKurang var lebar: Int
}

var persegi = PersegiKecil()
print("lebar persegi \(persegi.lebar)")

persegi.lebar = 5
print("lebar persegi \(persegi.lebar) ")

persegi.lebar = 12
print("lebar persegi \(persegi.lebar) ")

@propertyWrapper
struct TigaEnamAtauKurang {
    private var angka = 0
    var wrappedValue: Int {
        get{return angka}
        set{angka = min(newValue, 36)}
    }
}

class RumahSederhana {
    var panjang: Int = 0
    @EnamAtauKurang var lebar: Int
    @TigaEnamAtauKurang var luasMaksimal: Int
    var luas: Int {
        return panjang * lebar
    }
}

class Rss: RumahSederhana {
    override var luasMaksimal: Int {
        didSet {
            if luas >= luasMaksimal {
                print("luas maksimal adalah \(luasMaksimal) ")
                print("untuk panjang \(panjang), maka maksimum lebar adalah \(luasMaksimal / panjang) ")
                print("untuk lebar \(lebar), maka maksimum panjang adalaah \(luasMaksimal / lebar)")
            }
        }
    }
}

var kontrakan = Rss()
kontrakan.panjang = 12
kontrakan.lebar = 8
kontrakan.luasMaksimal = 46

print(kontrakan.luasMaksimal)

@propertyWrapper
struct AngkaKecil {
    private var maksimum: Int
    private var angka: Int
    
    var wrappedValue: Int {
        get { return angka}
        set { angka = min(newValue, maksimum)}
    }
    
    init() {
        maksimum = 15
        angka = 0
    }
    
    init(wrappedValue: Int) {
        maksimum = 15
        angka = min(wrappedValue, maksimum)
    }
    
    init(wrappedValue: Int, maksimum: Int) {
        self.maksimum = maksimum
        angka = min(wrappedValue, maksimum)
    }
}

struct PersegiNol {
    @AngkaKecil var panjang: Int
    @AngkaKecil var lebar: Int
}

var persegiNol = PersegiNol()
print("panjang persegiNol adalah \(persegiNol.panjang)")

struct PersegiSatu {
    @AngkaKecil var panjang: Int = 1
    @AngkaKecil var lebar: Int = 1
}

var persegiSatu = PersegiSatu()
print("panjang persegiSatu adalah \(persegiSatu.panjang)")

persegiSatu.panjang = 25
print("panjang persegiSatu adalah \(persegiSatu.panjang)")

struct PersegiCustom {
    @AngkaKecil(wrappedValue: 3, maksimum: 10) var panjang: Int
    @AngkaKecil(wrappedValue: 3, maksimum: 5) var lebar: Int
}

var persegiBebas = PersegiCustom()
print(" custom \(persegiBebas.panjang) , \(persegiBebas.lebar)")

persegiBebas.lebar = 25
print(" custom \(persegiBebas.panjang) , \(persegiBebas.lebar)")

struct PersegiCampur {
    @AngkaKecil var panjang: Int = 1
    @AngkaKecil(maksimum: 9) var lebar: Int = 2
}

var persegiCampur = PersegiCampur()
print(" persegiCampur \(persegiCampur.panjang) , \(persegiCampur.lebar)")

persegiCampur.lebar = 11
persegiCampur.panjang = 23

print(" persegiCampur \(persegiCampur.panjang) , \(persegiCampur.lebar)")

@propertyWrapper
struct AngkaKecilLagi {
    private var angka: Int
    private(set) var projectedValue: Bool
    
    var wrappedValue: Int {
        get { return angka}
        set {
            if newValue > 10 {
                projectedValue = true
                angka = 10
            } else {
                projectedValue = false
                angka = newValue
            }
        }
    }
    
    init() {
        self.angka = 0
        self.projectedValue = false
    }
}

struct StructLainnya {
    @AngkaKecilLagi var angka: Int
}

var structLainnya = StructLainnya()
structLainnya.angka = 15

print(structLainnya.$angka)

enum Ukuran {
    case kecil, besar
}

struct PersegiTerukur {
    @AngkaKecilLagi var panjang: Int
    @AngkaKecilLagi var lebar: Int
    
    mutating func ubah(ke ukuran: Ukuran) -> Bool {
        switch ukuran {
        case .besar :
            panjang = 100
            lebar = 100
        case .kecil :
            panjang = 4
            lebar = 4
        }
        return $panjang || $lebar
    }
}

var persegiTerukur = PersegiTerukur()
persegiTerukur.panjang = 12
print("panjang \(persegiTerukur.panjang) lebar \(persegiTerukur.lebar)  ")
print(persegiTerukur.ubah(ke: .kecil))

print(persegiTerukur.ubah(ke: .besar))
print("panjang \(persegiTerukur.panjang) lebar \(persegiTerukur.lebar)  ")
