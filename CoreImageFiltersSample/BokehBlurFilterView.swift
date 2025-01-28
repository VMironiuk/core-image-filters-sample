//
//  BokehBlurFilterView.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 22.01.2025.
//

import SwiftUI

struct BokehBlurFilterView: View {
  @StateObject private var model = BokehBlurFilterModel()
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
        value: $model.radius,
        in: model.minRadius...model.maxRadius,
        step: model.radiusStep,
        label: { Text("Radius") },
        minimumValueLabel: { Text("\(Int(model.minRadius))") },
        maximumValueLabel: { Text("\(Int(model.maxRadius))") })
      Slider(
        value: $model.ringSize,
        in: model.minRingSize...model.maxRingSize,
        step: model.ringSizeStep,
        label: { Text("Ring Size") },
        minimumValueLabel: { Text("\(Int(model.minRingSize))") },
        maximumValueLabel: { Text("\(Int(model.maxRingSize))") })
      Slider(
        value: $model.ringAmount,
        in: model.minRingAmount...model.maxRingAmount,
        step: model.ringAmountStep,
        label: { Text("Ring Amount") },
        minimumValueLabel: { Text("\(Int(model.minRingAmount))") },
        maximumValueLabel: { Text("\(Int(model.maxRingAmount))") })
      Slider(
        value: $model.softness,
        in: model.minSoftness...model.maxSoftness,
        step: model.softnessStep,
        label: { Text("Softness") },
        minimumValueLabel: { Text("\(Int(model.minSoftness))") },
        maximumValueLabel: { Text("\(Int(model.maxSoftness))") })
    }
    .frame(width: 200)
    .padding()
  }
}

#Preview {
  BokehBlurFilterView()
}
