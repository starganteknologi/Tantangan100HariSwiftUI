# hari ke-16 : Membuat aplikasi urunan

proyek ini adalah proyek pertama kita, bertujuan untuk pengenalan dasar-dasar SwiftUI sekaligus bisa jadi cikal bakal aplikasi yang bener bener ada di dunia nyata

kita akan membuat aplikasi urunan, aplikasi ini mungkin akan anda pakai ketika sedang bepergian ke luar negeri, kemudian anda ke restoran dengan bbbrp teman.

kita urunan BDD TPTP, di bbrp negara adalah hal yang umum untuk memberikan tips, dan anda bebas memberikan jumlah tipsya

karena sedang di luar negeri, aplikasi kita akan bs memilih bbrp mata uang dunia,

aplikasi ini juga akan menghitung dan mengkonversi nilai uang yang dipilih dengan Rupiah

## apa yang akan kita pelajari

- dasar Desain UI
- membuat form
- menambahkan navigation bar
- memodifikasi state
- binding state ke UI
- membuat view in loop

most likely tomorrow

- membaca input text dari form
- membuat picker di form
- menambahkan segmented control pada tip
- menghitung total yang harus di bayar tiap orang
- menyembunyikan keyboard

day3 celeng


## start buat

file->new->project

produk name urunan
organisation identifier com.namawebsiteanda.

## struktur aplikasi

- urunanApp berisi kode untuk meluncurkan aplikasi anda, jika kita ingin membuat sesuai yang akan terus live sepanjang aplikasi berjalan, tempatkan kodenya disini
- ContentViews.swift adalah template awal kode UI kita, kita akan bekerja disini
- Assets.xcassets adalah katalog asset, kita menyimpan semua file gambar kita yang akan gunakan diini, bisa menambahkan warnaa, icon , sticker dan lain-lain
- Preview Content adalah group di dalamnya ada Preview Assets.xcassets ini juga berisi gambar-gambar yang bisa diisi utk template preview sehingga pada preview anda bs melihat kira2 bagaimana aplikasi kita nanti UI nya


## kita akan melihat lebih detil ContentViews.swift


### import SwiftUI

artinya kita akan menggunakan fungsionalitas dari framework SwiftUI

apple menyediakan banyak sekali framework yang bs kita gunakan seperti machine learning, map, image processing dan lainnya

### struct ContentView: View

membuat sebuah struct bernama ContentView yang comform dengan View protocol,
View adalah bagian dari SwiftUI, dan merupakan protocol dasar yang harus diadopsi oleh apapun yang akan kita buat pada screen
text, tombol, gambar, dan view lainnya

### var body: some View

adalah sebuah computed property dengan nama body dengan opaque type yaitu **some View**
ini artinya properti ini akan mengembalikan sesuatu yang conform/sesuai dengan View protocol yang merupakan layout kita

**View** protocol hanya mempunyai satu persyaratan yaitu harus mempunyai computed properti yang mengembalikan **some View**

kita dapat menambahkan properti lain dan jugaa method pada properti ini

### Text("Hello, world!")
membuat sebuah teks view menggunakan string hello world

Text views adalah sebuah teks sederhana yang dapat digambar ke screen dan akan wrap multiple line

### padding
adalah sebuah method yang dipanggil pada Text
Swift menyebutnya modifier , yang merupakan method umum namun mempunyai perbedaan kecil yaitu selalu mengembalikan sebuah view baru yang berisi data asli dan tambahan modifikasi yang kita minta.

dalam hal ini **body** akan mengembalikan text view dengan padding/lapisan

### ContentView_Previews    

struct yang conform terhadap PreviewProvider, ini merupakan view bantu untuk membuat preview selama kita membuat aplikasi
dan tidak akan di masukkan ke dalam bagian dari aplikasi kita ketika aplikasi ini kita publish

Preview ini menggunakan fitur XCode canvas yang dapat kita munculkan di sebelah kanan kode kita
preview akan menggunakan contoh salah satu apple device, kita dapat mengaturnyaa di atas dibagian simulator


Sangat sering Anda akan menemukan seperti "Automatic preview updating paused" karena terdapat kesalahan di kode kita, gunakan shortcut : Option+Cmd+P untuk meresume preview

### membuat form

- tambahkan Form
- tambahkan text di dalam form hanya sampe 10 klo manual tidak bisa view dalam view lebih dari 10
- kita bisa tambahkan group untuk mengakali hal ini
- kita gunakan section jika ingin grouping lebih benar terpisah

## menambahkan navigation bar
.navigationTitle("SwiftUI")
.navigationBarTitleDisplayMode(.inline)

## meodifikasi state program

When creating struct methods that want to change properties, we need to add the mutating keyword: mutating func doSomeWork(), for example.

However, Swift doesn’t let us make mutating computed properties, which means we can’t write mutating var body: some View – it just isn’t allowed.

we can use a property wrapper from SwiftUI called @State, like this:

@State allows us to work around the limitation of structs: we know we can’t change their properties because structs are fixed, but @State allows that value to be stored separately by SwiftUI in a place that can be modified.

 @State is specifically designed for simple properties that are stored in one view. As a result, Apple recommends we add private access control to those properties, like this: @State private var tapCount = 0.
