//
//  BokehBlurFilterView.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 22.01.2025.
//

import SwiftUI

struct BokehBlurFilterView: View {
  @State private var radius: Float = 20
  private let model = BokehBlurFilterModel()
  var body: some View {
    HStack {
      Spacer()
      viewport
      Spacer()
      sidebar
    }
  }
  
  @ViewBuilder
  private var viewport: some View {
    if let cgImage = model.outputImage {
      Image(cgImage, scale: 1.0, label: Text(""))
        .resizable()
        .frame(width: 300, height: 300)
    } else {
      Text("Cannot load or process image")
    }
  }
  
  private var sidebar: some View {
    VStack {
      Slider(
        value: $radius,
        in: 0...50,
        step: 1,
        label: { Text("Radius") },
        minimumValueLabel: { Text("0") },
        maximumValueLabel: { Text("50") },
        onEditingChanged: { _ in print(#function) })
    }
    .frame(width: 200)
    .padding()
  }
}

#Preview {
  BokehBlurFilterView()
}
