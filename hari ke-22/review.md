# Review

## Stack

terdapat 3 Stack ZStack, HStack, VStack

Kita dapat mempunyai suatu Stack didalam Stack lainnya

## ZStack

gunakan ZStack untuk menumpuk View dari belakang ke depan

Seperti View Lainnya, hanya bisa mempunyai Sub View 10 Maksimal

## Semantic Color

Semantic color dinamai sesuai peruntukannya bukan dari Hue nya

sebagai contoh
Color.primary bisa jadi dark atau light tergantung dari tema devicenya

## Gradient

Gradient dapat dibuat menggunakan array warna maupun array dari color stop

terdapat tiga gradient

- Linear
- Angular
- Radial

Conic gradient adalah nama lain dari angular gradient

## Color

Di SwiftUI color juga merupakan View

## frame()

modifier .frame() dapat kita gunakan untuk menentukan lebar dan tinggi suatu View

kita dapat membuat shape menggunakan Rectangle, Capsule, RoundedRectangle

## shadow

kita dapat membuat sebuah shadow pada View dengan warna sesuai pilihan kita dam radius

## Safe area

Safe are adalah space yang dialokasikan untuk home indicator dan status bar

## Button

Button dapat merupakan suatu text, dapat mempunya Image dan juga dapat mempunya view lainnya di dalamnya

Button harus berisi suatu closure yang akan dijalankan ketika button tsb di tap

## Int.random(in:)

Int.random mengembalikan satu integer dari rentang yang kita definisikan

## Acak Array

kita dapat menggunakan modifier .shuffled() untuk mengacak urutan array
