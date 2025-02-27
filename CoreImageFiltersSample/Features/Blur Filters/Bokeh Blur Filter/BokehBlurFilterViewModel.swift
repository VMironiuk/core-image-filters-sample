//
//  BokehBlurFilterViewModel.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 21.01.2025.
//

import Combine
import CoreImage.CIFilterBuiltins

final class BokehBlurFilterViewModel: ObservableObject {
  private let inputImage: CIImage?
  
  private var subscription: AnyCancellable?

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
  @Published private(set) var outputImage: CGImage?
  
  init(inputImage: CGImage?) {
    if let inputImage {
      self.inputImage = CIImage(cgImage: inputImage)
    } else {
      self.inputImage = nil
    }
    
    subscription = $radius
      .merge(with: $ringSize)
      .merge(with: $ringAmount)
      .merge(with: $softness)
      .sink { [weak self] _ in self?.updateImage() }
  }
  
  private func updateImage() {
    let bokehBlurFilter = CIFilter.bokehBlur()
    bokehBlurFilter.inputImage = inputImage
    bokehBlurFilter.ringSize = ringSize
    bokehBlurFilter.ringAmount = ringAmount
    bokehBlurFilter.softness = softness
    bokehBlurFilter.radius = radius
    outputImage = CGImage.create(from: bokehBlurFilter.outputImage)
  }
}
