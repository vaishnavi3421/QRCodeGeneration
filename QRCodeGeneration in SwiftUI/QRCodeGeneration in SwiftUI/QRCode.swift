//
//  QRCode.swift
//  QRCodeGeneration in SwiftUI
//
//  Created by Zentech-038 on 29/05/25.
//


import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCode: View {
    var url: String
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        Image(uiImage: generateQRCodeImage(url))
            .interpolation(.none) // Keeps it crisp
            .resizable()
            .frame(width: 200, height: 200)
    }

    func generateQRCodeImage(_ url: String) -> UIImage {
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let qrCodeImage = filter.outputImage {
            // Scale it up for clarity
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledImage = qrCodeImage.transformed(by: transform)
            
            if let cgImage = context.createCGImage(scaledImage, from: scaledImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
