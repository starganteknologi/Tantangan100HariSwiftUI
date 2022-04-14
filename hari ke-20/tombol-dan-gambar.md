# tombol dan gambar


```
Button("click me") {
    print("tombol di pencet")
}

 Button("click me", action: fungsi )

 func fungsi() {
   print("tombol di pencet")
 }

```

## customize the way buttons look.

###  we can attach a role to the button
```
 Button("Hapus", role: .destructive, action: hapus)

 func hapus() {
   print("jalankan penghapusan")
 }
```

## we can use one of the built-in styles for buttons

: .bordered and .borderedProminent

```
VStack {
    Button("Button 1") { }
        .buttonStyle(.bordered)
    Button("Button 2", role: .destructive) { }
        .buttonStyle(.bordered)
    Button("Button 3") { }
        .buttonStyle(.borderedProminent)
    Button("Button 4", role: .destructive) { }
        .buttonStyle(.borderedProminent)
}
```

If you want to customize the colors used for a bordered button, use the tint() modifier like this:

prominent  = menonjol

```
Button("Button 3") { }
    .buttonStyle(.borderedProminent)
    .tint(.mint)
```

If you want something completely custom, you can pass a custom label using a second trailing closure:

```
Button {
    print("Button was tapped")
} label: {
    Text("Tap me!")
        .padding()
        .foregroundColor(.white)
        .background(.red)
}
```

## Image

Image("pencil") will load an image called “Pencil” that you have added to your project.
Image(decorative: "pencil") will load the same image, but won’t read it out for users who have enabled the screen reader. This is useful for images that don’t convey additional important information.
Image(systemName: "pencil") will load the pencil icon that is built into iOS. This uses Apple’s SF Symbols icon collection, and you can search for icons you like – download Apple’s free SF Symbols app from the web to see the full set.

```
Button {
    print("Edit button was tapped")
} label: {
    Image(systemName: "pencil")
}

Button {
    print("Edit button was tapped")
} label: {
    Label("Edit", systemImage: "pencil")
}

```
