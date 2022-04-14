
# Stack untuk mengatur Views

ketika sebuah struct mengembalikan nilai **some View** untuk body, SwiftUI mengharapkan untuk menerima suatu view yang dapat ditampilkan di layar

bisa merupakan text,  form, navigation view, atau apapun yang penting conform terhadap protocol View

untuk menata tampilan dalam bentuk berlapis, terdapat 3 buah yang dapat melakukannya

Hstack , Vstack, Zstack


sebuah contoh

```
var body: some View {
    Text("Hello, world!")
    Text("hello Stargan")
}
```

pada canvas akan ditampilkan 2 screen, karena SwiftUI menginterpretasikan sebagai dua text view yang berbeda


untuk membuat SwiftUI menampilkan menjadi satu view,

dapat digunakan

## Vstack

```
var body: some View {
  Vstack {
    Text("Hello, world!")
    Text("hello Stargan")
  }
}
```

kita dapat menambahkan parameter spacing pada Vstack

```
Vstack(spacing: 30) {
}
```

sama seperti View yang lain Vstack hanya memperbolehkan maksimal 10 nested view

jika kita kita ingin menambahkan maka dapat kita gunakan sebuah ForEach

atau jika manual maka kita gunakan Group

kita juga dapat mengatur posisi rata nya, menggunakan parameter **alignment**

```
Vstack(alignment: .leading) {
}
```

## Hstack

```
Hstack(alignment: .leading, spacing: 20) {
  Text("Hello, world!")
  Text("hello Stargan")
}
```

## Zstack

membuat view menjadi overlap

```
Zstack (alignment: .top) {
  Text("Hello, world!")
  Text("hello Stargan")
}
```
