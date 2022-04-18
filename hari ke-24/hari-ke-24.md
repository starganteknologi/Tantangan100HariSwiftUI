# Refactoring tebak motif batik

## Step 31 buat struct Gambarbatik

```
struct Gambarbatik: View {
    var body: some View {
        Image(systemName: "pencil")
    }
}
```

## Step 32 update struct Gambarbatik
```
struct Gambarbatik: View {
    var nama: String

    var body: some View {
        Image(nama)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(color:.black, radius: 10,x: 10, y: 20)
    }
}
```

## step 33 gantikan Image pada label button menggunakan Gambarbatik

```
Gambarbatik(nama:gambarBatik[number])
```

## Step 34 buat ViewModifier FramePermainan
```
struct FramePermainan: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
```

## Step 35 buat extension View method framePermainan
```
extension View {
    func framePermainan() -> some View{
        modifier(FramePermainan())
    }
}
```

## Step 36 gantikan modifier pada VStack ke-2 dengan custom modifier framePermainan
```
.framePermainan()
```
