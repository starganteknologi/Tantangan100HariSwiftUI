# Hari-ke-17 implementasi aplikasi

// memendekkan terminal
export PS1='\W$ '

kita telah membahas bbrp teknik dalam SwiftUI yaitu form, modifiying dan binding state , looping dalam view

hari ini kita mengimplementasikan teknik tersebut di hari ini

pembelajaran kita hari ini

membaca input pengguna dari Textfield
membuat picker untuk jumlah peserta urunan
menambahkan segmented control untuk tips
menghitung total yg mesti dibayar tiap orang
menyembunyikan keyboard

## Step by step

### step 1

``` swift
@State var tagihan: Double = 0.0
@State var peserta: Int = 2
@State var persenTip = 20
```

``` shell
git commit -am "step 1"
git tag -a s1 -m"tambahkan tagihan pesertaa dan persenTip"
```

### step 2

tambahkan let persenTipTersedia
``` swift
let persenTipTersedia = [0,5,10,15,20,25]
```

commit

``` shell
git commit -am "step 2"
git tag -a s2 -m"tambahkan"
```

### step 3

tambahkan form dengan Textfield

``` shell
git commit -am "step 3: tambahkan form dengan text Textfield"
git tag -a s3 -m"tambahkan form dengan text Textfield"
```

akan terjadi error
``` error
Cannot convert value of type 'Binding<Double>' to expected argument type 'Binding<String>'
```

kita bs gunakan dengan converter dari string ke double

### step 4

tp SwiftUI punya solusi yang cerdas


``` shell
git commit -am "step 4: ubah jumlah tagihn menjaadi format currency"
git tag -a s4 -m"ubah jumlah tagihn menjaadi format currency"
```


### step 5

``` shell
git commit -am "step 5: lokalisasi jumlah tagihn"
git tag -a s5 -m"lokalisasi jumlah tagihn"
```

### step 6

pada Textfield kit perhatikan bahwa berubah dari text menjadi value

var tagihan merupakan two-way parameter binding

One of the great things about the @State property wrapper is that it automatically watches for changes, and when something happens it will automatically re-invoke the body property. That’s a fancy way of saying it will reload your UI to reflect the changed state, and it’s a fundamental feature of the way SwiftUI works.

kita akan coba dengan menambahkan satu teks dibawah
Textfield

``` swift
Text("Jumlah tagihan \(tagihan)")
```

commit

``` shell
git commit -am "step 6: tambahkan text untuk melihat bagaimana @State bekerja"
git tag -a s6 -m"tambahkan text untuk melihat bagaimana @State bekerja"
```

### step 7 : ubah jenis keyboar

klo kita perhatikan klo kita mengisi Textfield tagihan kita bs juga memasukkan huruf, padahal seharusnya ini adalah angka

Fortunately, Textfield punya modifier keyboardType() untuk mengubah jenis keyboard yang mau kita tampilkan.

antara desimal dan number

kita akan ubah Textfield kita menggunakan decimal

``` shell
git commit -am "step 7: ubah keyboard tipe"
git tag -a s7 -m"ubah keyboard tipe"
```

### step 8 : menambahkan picker jumlah peserta

namun ketika ditambahkan yang muncul jumlahnya adalah 4 orang padahal kita tadi setting default 2

sebenernya ketika ForEach(2..<20)
pertama kali di jalankan maka row ke 0 nya adalah 2

sehingga ketika kita buat peserta = 2 maka dia sebenernya ada di row ke 3 yang berarti 4 orang

inget bahwa sebuah array di swift secara defol bermula dari 0


ada lagi yang dapat kita perhatikan ketika kita jalankan app ini,

picker kita tidak berjalan dan berwarna abu2

ketika picker kita keluarkan dari form dia akan keluar picker atau wheel daan bs di klik

krn picker kita masukkan ke form swift otomatis mengubah cara menampilkan sebuah picker

SwiftUI menambahkan tanpa panah abu2 yang menunjukkan bahwa dia akan menuju ke sebuah view baru

utk itu kita memerlukan Navigation view agar app kita bs navigate ke View baru tersebut

```
NavigationView {
        Form {
            // everything inside your form
        }
    }
```

kita juga akan tambahkan checker untuk jumlah peserta

What you’re seeing here is the importance of what’s called declarative user interface design. This means we say what we want rather than say how it should be done. We said we wanted a picker with some values inside, but it was down to SwiftUI to decide whether a wheel picker or the sliding view approach is better. It’s choosing the sliding view approach because the picker is inside a form, but on other platforms and environments it could choose something else.

```
git commit -am "step 8: menambahkan picker jumlah peserta"
git tag -a s8 -m"menambahkan picker jumlah peserta"
```

### step 9: menambahkan navigation title

``` swift
.navigationTitle("Urunan")
            .navigationBarTitleDisplayMode(.inline)
```

``` shell
git commit -am "step 9: menambahkan navigation title"
git tag -a s9 -m"menambahkan navigation title"
 ```

 ### step 10 menambahkan picker untuk memilih persenTip

kita akan gunakan format persen pada selection Text nya

 ``` swift
 Picker("Tip percentage", selection: $persenTip) {
    ForEach(persenTipTersedia, id: \.self) {
        Text($0, format: .percent)
    }
}

``` shell
git commit -am "step 10: menambahkan picker untuk memilih persenTip"
git tag -a s10 -m"menambahkan picker untuk memilih persenTip"
 ```

### step 11 uback picker style
kita akan mengubah picker style

``` swift
 .pickerStyle(.segmented)
```

``` shell
git commit -am "step 11: uback picker style
kita akan mengubah picker style"
git tag -a s11 -m"uback picker style
kita akan mengubah picker style"
```

tapi trus kok mana labelnya g keliatan ?

### step 12 tambahkan text dan ubah jadi section

kita bisa tambahkan text di atas picker tp masih aneh
```
Text("persen tip")
```

agar lebih terlihat jelas akan kita buat jadi section
```
Section {
  // body
}
```

kemudian section ini juga punya header

Section {
  // body
} header: {

}

ini adalah multiple trailing closures to specify both the section body (the first closure) and the second header (the second closure).

```
git commit -am "step 12: tambahkan text dan ubah jadi section"
git tag -a s12 -m"tambahkan text dan ubah jadi section"
```

### step 13 hitung bayar per orang

form kita sudah siap saatnya kita menghitung jumlah yang harus dibayar tiap orang

tapi sebelumnya kita masih punya masalah yang belum selesai yaitu ketika kita pilih orang antara tampilan datanyaa g sama

ada bbrp cara untuk menyelesaikan ini, kita akan pakai cara computed property

tambahkan computed property di dalam body

```
var totalPerOrang: Double {
    // hitung bayar berapa perorang
    return 0
}
```

kemudian di dalam computed property tersebut isikan sebagai berikut

```
let jumlahPeserta = Double ( peserta + 2 )
let persenTipDipilih = Double (persenTip)
let tipValue = tagihan / 100 * persenTipDipilih
let grandTotal = tagihan + tipValue
let bayarPerOrang = grandTotal / jumlahPeserta
return bayarPerOrang
```

kemudian buat satu section untuk menampilkan jumlah yang haru dibayar per peserta

``` swift
Section {
    Text(totalPerOrang, format: .currency(code: Locale.current.currencyCode ?? "IDR"))
} header: {
    Text("Jumlah Urunan Perorang")
}
```

commit


```
git commit -am "step 13: hitung bayar per orang"
git tag -a s13 -m"hitung bayar per orang"
```

### step ke 14

tips check simulator pastikan bahwa pada i/o -> keyboard -> hilangkan centang semuanya

pada keyboard decimal tidak mempunyai return key sehingg kita tidak dapat kembali ke form dan dismiss keyboard nya

untuk itu kita perlu trick untuk mengatasi hal ini

1. kita akan berikan ke SwiftUI suatu mekanisme gmn caranya mengetahui bahwa isian jumlah sedang dipilih atau focus dan dapat menerima input

2. kita perlu suatu tombol untuk keluar dari focus input

untuk trick pertama kita mempunyai
property wrapper kita selanjutnya yaitu @FocusState

tambahkan pada content view

``` swift
@FocusState private var tagihanTersorot: Bool
```

kemudian kita attach property tagihanTersorot ke Textfield kita

``` swift
.focused($tagihanTersorot)
```
ok masalah pertama selesai, meskipun tidak keliatan di screen tp SwiftUI aware klo ada state itu

untuk masalah ke-2 kita akan buat
sebuah toolbar ke keyboard ketika keyboard nya visible, akan kita tempatkan tombol done


kita akan gunakan modifier pada form kita

tempatkan setelah navigation bar title
```
.toolbar {
    ToolbarItemGroup(placement: .keyboard) {           
        Button("Done") {
            tagihanTersorot = false
        }
    }
}
```

commit

``` shell
git commit -am "step 14: tambahkan toolbar dan button done"
git tag -a s14 -m"tambahkan toolbar dan button done"
```

penjelasan

1. The toolbar() modifier lets us specify toolbar items for a view. These toolbar items might appear in various places on the screen – in the navigation bar at the top, in a special toolbar area at the bottom, and so on.
1. ToolbarItemGroup lets us place one or more buttons in a specific location, and this is where we get to specify we want a keyboard toolbar – a toolbar that is attached to the keyboard, so it will automatically appear and disappear with the keyboard.
3. The Button view we’re using here displays some tappable text, which in our case is “Done”. We also need to provide it with some code to run when the button is pressed, which in our case sets amountIsFocused to false so that the keyboard is dismissed.

### step 15 Spacer() sebelum button dan cleansing

kita akan tambahkan Spacer() sebelum button

ketika dijalankan tombol akan berpindah ke kanan.

placer adalah sebuah flexible space yang akan mengisi ruang kosong, dan akan mendorong view lain ke kiri ke kanan atas bawah secara otomatis tergantung penempatan viewnya  

``` shell
git commit -am "step 15: tambahkan spacer() hapus yang tidak perlu"
git tag -a s15 -m"tambahkan spacer() hapus yang tidak perlu"
```
