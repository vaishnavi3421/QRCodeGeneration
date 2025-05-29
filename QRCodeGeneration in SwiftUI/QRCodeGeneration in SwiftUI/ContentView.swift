//
//  ContentView.swift
//  QRCodeGeneration in SwiftUI
//
//  Created by Zentech-038 on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           
            Text("Hello, world!")
            QRCode(url:  "www.google.com")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
