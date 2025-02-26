//
//  BokehBlurFilterModel.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 21.01.2025.
//

import Combine
import CoreImage.CIFilterBuiltins

@MainActor
final class BokehBlurFilterModel: ObservableObject {
  private let imageStore: ImageStore
  private var inputImage: CIImage?
  
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
  
  init(imageStore: ImageStore) {
    self.imageStore = imageStore
    if let image = imageStore.image {
      inputImage = CIImage(cgImage: image)
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
    
    Task {
      await MainActor.run {
        imageStore.image = CGImage.create(from: bokehBlurFilter.outputImage)
      }
    }
  }
}
