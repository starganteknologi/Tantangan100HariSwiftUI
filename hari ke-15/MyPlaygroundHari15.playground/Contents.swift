protocol Prokes {
  var tempat: String { get }
  func lakukan()
}

extension Prokes {
  func lakukan() {
    print("pake masker selama di \(tempat)")
  }
}


struct ProkesKelas: Prokes {
    var tempat: String
}


struct ProkesRumah: Prokes {
    var tempat: String
    func lakukan() {
        print("ganti baju segera setelah dari luar masuk ke \(tempat)")
    }
}

let prokesKelas = ProkesKelas(tempat: "kelas")
prokesKelas.lakukan()
 
var prokesRumah = ProkesRumah(tempat: "rumah")
prokesRumah.lakukan()
