//
//  BokehBlurFilterModel.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 21.01.2025.
//

import Combine
import CoreImage.CIFilterBuiltins

final class BokehBlurFilterModel: ObservableObject {
  private var subscriptions = Set<AnyCancellable>()
  
  let minRadius: Float = 0
  let maxRadius: Float = 200
  let radiusStep: Float = 1
  let minRingSize: Float = 0
  let maxRingSize: Float = 1
  let ringSizeStep: Float = 0.1
  let minRingAmount: Float = 0
  let maxRingAmount: Float = 100
  let ringAmountStep: Float = 1
  let minSoftness: Float = 0
  let maxSoftness: Float = 100
  let softnessStep: Float = 1
  
  private let inputImage: CIImage
  @Published var radius: Float = 0.0
  @Published var ringSize: Float = 0.0
  @Published var ringAmount: Float = 0.0
  @Published var softness: Float = 0.0
  
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
