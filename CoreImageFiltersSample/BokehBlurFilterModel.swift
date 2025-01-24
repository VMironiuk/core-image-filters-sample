//
//  BokehBlurFilterModel.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 21.01.2025.
//

import CoreImage.CIFilterBuiltins

final class BokehBlurFilterModel: ObservableObject {
  private(set) var radius: Float = 0.0
  private(set) var ringSize: Float = 0.0
  private(set) var ringAmount: Float = 0.0
  private(set) var softness: Float = 0.0
  private let inputImage: CIImage
  
  var outputImage: CGImage? {
    let bokehBlurFilter = CIFilter.bokehBlur()
    bokehBlurFilter.inputImage = inputImage
    bokehBlurFilter.ringSize = ringSize
    bokehBlurFilter.ringAmount = ringAmount
    bokehBlurFilter.softness = softness
    bokehBlurFilter.radius = radius
    return createCGImage(from: bokehBlurFilter.outputImage)
  }
  
  init() {
    guard let url = Bundle.main.url(forResource: "default-input-image", withExtension: "jpg"),
          let image = CIImage(contentsOf: url) else {
      fatalError("Cannot load 'default-input-image'")
    }
    inputImage = image
  }
}

private func createCGImage(from ciImage: CIImage?) -> CGImage? {
  if let cgImage = ciImage?.cgImage { return cgImage }
  guard let ciImage else { return nil }
  return CIContext().createCGImage(ciImage, from: ciImage.extent)
}
