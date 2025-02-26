//
//  BokehBlurFilterView.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 22.01.2025.
//

import SwiftUI

struct BokehBlurFilterView: View {
  @StateObject var model: BokehBlurFilterModel
  
  var body: some View {
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
    .frame(minWidth: 200, maxWidth: 275)
    .padding(8)
  }
}

#Preview {
  BokehBlurFilterView(
    model: BokehBlurFilterModel(
      imageStore: ImageStore()
    )
  )
}
