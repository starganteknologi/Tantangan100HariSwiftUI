//
//  ContentView.swift
//  konversi
//
//  Created by fathur rohman on 12/04/22.
//

import SwiftUI
import Collections

struct KonveriPanjang {
    var ukuran: OrderedDictionary = ["mm" : 0.001 ,"cm": 0.01 ,"m" : 1 ,"km": 1000 ,"ft": 3.2]
    func ubah(dari: String, ke: String, input: Double) -> Double {
        let output = ( ukuran[dari]! * input ) / ukuran[ke]!
        return output
     }
}

struct ContentView: View {
    @State var dari: String = "m"
    @State var ke: String = "m"
    @State var input: Double = 0.0
    var konversi = KonveriPanjang()
    var output: Double {
        return konversi.ubah(dari: dari, ke: ke, input: input)
    }
    var body: some View {
        Form {
            Section {
                TextField("input", value: $input, format: .number)
                    .keyboardType(.decimalPad)
                Picker("pilihan input", selection: $dari){
                    ForEach(konversi.ukuran.keys, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section {
                Picker("pilihan output", selection: $ke){
                    ForEach(konversi.ukuran.keys, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                Text(output.formatted())
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
