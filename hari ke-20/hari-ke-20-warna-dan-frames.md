# Warna

untuk memberikan warna pada sebuah Stack kita dapat menggunakan modifier


```
ZStack {
    Text("paling belakang")
    Text("tengah")
    Text("Depan")
}
```

sebagai modifier ZStack maupun modifier Text
```
.background(.blue)
```

hanya text view yang ada backgroundnya

jika ingin semua ZStack ada warnanya maka gunakan
```
Color.yellow
```
di dalam ZStack, maka otomatis seluruh stack berwarna kuning

jika ingin warna hanya mengisi sebuah ukuran spesific
maka dapat digunakan modifier **frame()** pada warna

```
Color.yellow
  .frame(width: 250, height: 250)
```

```
Color.yellow
  .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
```

swift memiliki cukup banyak warna built-in

kita juga mempunya warna semantic , tidak menyatakan warna hue nya , tetapi menerangkan tujuannya

```
Color.primary
Color.secondary
```

kita juga dapat mendefinisikan warna kita sendiri menggunakan RGB
Color(red: 0.5, green: 0.8, blue: 0)

kita perhatikan terdapat space yang berwarna putih diatas dan dibawah

intentionally blank dan di sebut safe area

jika ingin menggunakan area tersebut

gunakan modifier

```
.ignoresSafeArea()    
```
