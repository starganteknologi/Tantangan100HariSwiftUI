# Menambahkan Fungsi Skor pada Aplikasi Tebak Motif


## Step 25 buat variabel skor dan pertanyaanKe

```
@State private var skor = 0
@State private var pertanyaanKe = 0

```

## Step 26 update Fungsi acak gambar

```
pertanyaanKe += 1
```

## Step 27 jika jawab benar tambahkan skor jika salah tampilkan nama batik yang di tap

```
@State private var isiAlert = ""
//...

skor += 1

//...

Text("Skor: \(skor)")
//...
isiAlert = "Motif yang kamu tap adalah \(gambarBatik[angka])"
```

## Step 28 Ubah isi alert

jika benar

```
isiAlert = "Skor kamu adalah \(skor)";
```

jika salah

```
isiAlert = "Motif yang kamu tap adalah \(gambarBatik[angka])"
```

## Step 29 Reset permainan dan

resetPermainan

```
func resetPermainan() {
    pertanyaanKe = 0
    skor = 0
    acakGambar()
}
```

## Step 30 kondisi pada alert permainan sudah sampai sejumlah motif, reset

```
.alert(judulSkor, isPresented: $tampilkanSkor) {
    if ( pertanyaanKe >= gambarBatik.count ) {
        Button("Mulai lagi", action: resetPermainan )
    } else {
        Button("Lanjut", action: acakGambar)
    }
}
```
