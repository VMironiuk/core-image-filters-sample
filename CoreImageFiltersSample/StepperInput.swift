//
//  StepperInput.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 03.02.2025.
//

import SwiftUI

struct StepperInput: View {
  @Binding var value: Float
  private let title: String
  private let bounds: ClosedRange<Float>
  private let step: Float.Stride
  
  init(
    _ title: String,
    value: Binding<Float>,
    in bounds: ClosedRange<Float>,
    step: Float.Stride
  ) {
    self.title = title
    self._value = value
    self.bounds = bounds
    self.step = step
  }
  
  var body: some View {
    HStack {
      Text(title)
      Spacer()
      Stepper(
        value: $value,
        in: bounds,
        step: step,
        label: {
          TextField(value: $value, format: .number, label: {})
            .onChange(of: value) { oldValue, newValue in
              if newValue < bounds.lowerBound || newValue > bounds.upperBound {
                value = oldValue
              }
            }
        }
      )
      .frame(minWidth: 75, maxWidth: 150)
    }
  }
}

#Preview {
  StepperInput(
    "Min",
    value: .constant(1),
    in: 0...10,
    step: 1
  )
  .frame(width: 200, height: 100)
}
