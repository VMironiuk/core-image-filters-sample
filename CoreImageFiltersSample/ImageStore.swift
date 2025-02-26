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
  @Published var image: CGImage?
  
  init() {
    guard let url = Bundle.main.url(forResource: "default-input-image", withExtension: "jpg"),
          let image = CIImage(contentsOf: url) else {
      fatalError("Cannot load 'default-input-image'")
    }
    self.image = CGImage.create(from: image)
  }
}
