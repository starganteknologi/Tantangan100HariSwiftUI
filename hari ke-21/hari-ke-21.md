# Membuat aplikasi tebak batik


Chapters
00:00 Pembukaan
00:15 Copy gambar ke Assets
04:46 Membuat background color pada ZStack
07:09 Membuat fungsi
10:32 Membuat Alert
13:07 Styling Aplikasi

## step 1

copy gambar batik ke Assets

## step 2

untuk menampilkan gambar kita menggunakan namanya

``` swift
Image("kawung-jateng")
```

perhatikan disini bahwa tidak ektensi file

## Step 3

kita akan membuat variabel gambar batik

```
var gambarBatik = ["geblekrenteng-kulonprogo" , "gentongan-madura" , "kawung-jateng" , "keraton-yogyakarta" , "megamendung-cirebot" , "parang-jawa" , "sedapur-magetan" , "simbut-banten" , "sogan-solo" , "tujuhrupa-pekalongan"]
```

## step 4 buat variabel jawabanBenar

```
var jawabanBenar = Int.random(in: 0...2)
```

## step 5 buat Vstack untuk pernyataan gambar

```
VStack {
        Text("Tap batik motif")
        Text(gambarBatik[jawabanBenar])
    }
```

## step 6 tambahkan gambar batik dibawah pernyataan

``` swift
ForEach(0..<3) { number in
    Button {
       // flag was tapped
    } label: {
        Image(gambarBatik[number])
            .renderingMode(.original)
    }
}
```

renderingMode(.original) modifier memberitahukan SwiftUI untuk  merender gambar aslinya dan tidak mewarnainya sebagai tombol


> disini kita akan lihat bahwa di preview canvas kita akan membuat 4 preview, tidak sesuai dengan harapan kita

## Step 7 membungkus view VStack dan ForEach nya dalam sebuah VStack

sehingga menjadi

```
VStack {
    VStack {
      //...
    }
    ForEach(0..<3) { number in
        //...
    }
}
```

## Step 8 Resize gambar batik agar fit ke screen, kemudian tambahkan spacing ke VStack

tambahkan modifier pada Image

```
.resizable()
.aspectRatio(contentMode: .fit)
```

tambahkan spacing


```
var body: some View {
    VStack(spacing: 30) {
      //..
    }
}
```

## Step 9 buat warna background gelap

gunakan ZStack
untuk membungkus semua view, kemudian tambahkan modifier ```.ignoresSafeArea()```

```
var body: some View {
    ZStack {
        Color.black
            .ignoresSafeArea()
        VStack(spacing: 30) {
          ///
        }
    }
}
```

## Step 10, warnai text dengan warna terang

tambahkan modifier ```.foregroundColor(.white)``` pada text
```
Text("Tap batik motif")
  .foregroundColor(.white)
Text(gambarBatik[jawabanBenar])
  .foregroundColor(.white)
```

## Step 11 Merandom urutan gambar batik

tambahkan modifier ```.shuffled()``` pada array

```
var gambarBatik = ["geblekrenteng-kulonprogo" , "gentongan-madura" , "kawung-jateng" , "keraton-yogyakarta" , "megamendung-cirebon" , "parang-jawa" , "sedapur-magetan" , "simbut-banten" , "sogan-solo" , "tujuhrupa-pekalongan"].shuffled()
```

## Step 11 memberikan aksi ketika gambar batik di Tap

### Sub Step 11.1 tampilkan score ketika batik selesai nge tap

```
@State private var tampilkanSkor = false
@State private var judulSkor = ""
```

### Sub Step 11.2 buat sebuah fungsi untuk mengecek apakah yang di tab adalah benar

```
func batikTapped(_ angka: Int) {
    if angka == jawabanBenar {
        judulSkor = "Benar"
    } else {
        judulSkor = "Salah"
    }

    tampilkanSkor = true
}
```

## Step 12 buat fungsi ketika alert dismis

```
func acakGambar() {
  gambarBatik.shuffled()
  jawabanBenar = Int.random(in: 0...2)
}
```

> error
Cannot assign to property: 'self' is immutable

## Step 12.fix ubah gambarBatik dan jawabanBenar menjadi ```@State```

```
@State private var gambarBatik = [].shuffled()
@State private var jawabanBenar = Int.random(in: 0...2)
```

## Step 13 Show alert, tambahkan modifier ```.alert()``` pada ZStack

Step 13 Show alert, tambahkan modifier .alert() pada ZStack

```
.alert(judulSkor, isPresented: $tampilkanSkor) {
    Button("Lanjut", action: acakGambar)
} message: {
    Text("Skor kamu adalah ???")
}
```

## step 14 tempatkan fungsi ```batikTapped``` pada tombol batik

step 14 tempatkan fungsi batikTapped pada tombol batik

```
Button {
    batikTapped(number)
}
```

## step 14.fix fungsi acakGambar

gambarBatik pada screen tidak mengacak

kita ubah fungsi acakGambar

```
gambarBatik = gambarBatik.shuffled()
```

---
### Styling
---

## Step 15 Rubah background menjadi gradient

```
LinearGradient(gradient: Gradient(colors: [ .green, .black ]), startPoint: .top, endPoint: .bottom)
```

## Step 16 adjust font

tab motif batik
```
.font(.subheadline.weight(.heavy))
```

Text nama batik
```
.font(.largeTitle.weight(.semibold))
```

## Step 17 buat shadow dan rectangle pada gambar agar keliatan seperti menonjol

ubah warna gradien background
```
LinearGradient(gradient: Gradient(colors: [ .red, .green ]), startPoint: .top, endPoint: .bottom)
```

tambahkan modifier ```.clipShape``` dan ```.shadow```
```
.clipShape(RoundedRectangle(cornerRadius: 5))
.shadow(color:.black, radius: 10,x: 10, y: 20)
```

---
### Upgrade design
---

## Step 18 Experiment dengan background

Step 18.1 Experiment 1 dengan background

```
RadialGradient(stops: [
    .init(color: .blue, location: 0.3),
    .init(color: .red, location: 0.3),
], center: .top, startRadius: 200, endRadius: 700)
```

Step 18.2 Experiment 2 dengan background
```
RadialGradient(stops: [
    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
], center: .top, startRadius: 200, endRadius: 400)
```

## Step 19 membuat semua area game tampil menonjol

 we’re going to make that whole area into a visual element in our UI, making it a colored rounded rectangle so that part of the game stands out on the screen.

That lets it resize to take up all the horizontal space it needs, adds a little vertical padding, applies a background material so that it stands out from the red-blue gradient the background, and finally clips the whole thing into the shape of a rounded rectangle.

```
VStack(spacing: 15) {
}
```

tambahkan modifiers dia akhir VStack yang sama:


```
.frame(maxWidth: .infinity)
.padding(.vertical, 20)
.background(.regularMaterial)
.clipShape(RoundedRectangle(cornerRadius: 20))
```

## Step 20 tambahkan judul permainan

bungkus lagi ```VStack(spacing)``` dalam ```VStack```

## Step 21 tambahkan score label

```
Text("Skor: ?")
    .foregroundColor(.white)
    .font(.title.bold())
```

## Step 22 label jadi hitam dan secondary

hapus foregroundColor

## Step 23 tambahkan ```spacer()```

## Step 24 tambahkan ```padding()``` pada VStack terluar
