//
//  BokehBlurFilterModel.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 21.01.2025.
//

import CoreImage.CIFilterBuiltins

final class BokehBlurFilterModel: ObservableObject {
  private let inputImage: CIImage

  let radiusBounds: ClosedRange<Float> = -500...500
  let radiusStep: Float = 0.1
  let ringSizeBounds: ClosedRange<Float> = -500...500
  let ringSizeStep: Float = 0.1
  let ringAmountBounds: ClosedRange<Float> = -500...500
  let ringAmountStep: Float = 0.1
  let softnessBounds: ClosedRange<Float> = -500...500
  let softnessStep: Float = 0.1
  
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
    return CGImage.create(from: bokehBlurFilter.outputImage)
  }
  
  init() {
    guard let url = Bundle.main.url(forResource: "default-input-image", withExtension: "jpg"),
          let image = CIImage(contentsOf: url) else {
      fatalError("Cannot load 'default-input-image'")
    }
    inputImage = image
  }
}
