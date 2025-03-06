//
//  CGImage+Helpers.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 20.02.2025.
//

import CoreImage

extension CGImage {
  static func create(from ciImage: CIImage?) -> CGImage? {
    if let cgImage = ciImage?.cgImage { return cgImage }
    guard let ciImage else { return nil }
    return CIContext().createCGImage(ciImage, from: ciImage.extent)
  }
}
