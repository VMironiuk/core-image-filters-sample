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
      StepperInput(
        "Radius",
        value: $model.radius,
        in: model.radiusBounds,
        step: model.radiusStep
      )
      StepperInput(
        "Ring Size",
        value: $model.ringSize,
        in: model.ringSizeBounds,
        step: model.ringSizeStep
      )
      StepperInput(
        "Ring Amount",
        value: $model.ringAmount,
        in: model.ringAmountBounds,
        step: model.ringAmountStep
      )
      StepperInput(
        "Softness",
        value: $model.softness,
        in: model.softnessBounds,
        step: model.softnessStep
      )
      Spacer()
    }
    .frame(width: 200)
    .padding(8)
  }
}

#Preview {
  BokehBlurFilterView()
}
