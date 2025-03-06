//
//  ImageStore.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 26.02.2025.
//

import CoreGraphics
import CoreImage
import Foundation

final class ImageStore: ObservableObject {
  private let originalImage: CGImage?
  @Published var image: CGImage?
  
  init() {
    guard let url = Bundle.main.url(forResource: "default-input-image", withExtension: "jpg"),
          let image = CIImage(contentsOf: url) else {
      fatalError("Cannot load 'default-input-image'")
    }
    let cgImage = CGImage.create(from: image)
    self.image = cgImage
    self.originalImage = cgImage
  }
  
  func reset() {
    image = originalImage
  }
}
