//
//  StepperInput.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 03.02.2025.
//

import SwiftUI

struct StepperInput<V>: View where V: Strideable {
  @Binding private var value: V
  private let title: String
  private let bounds: ClosedRange<V>
  private let step: V.Stride
  
  private let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
  }()
  
  init(
    _ title: String,
    value: Binding<V>,
    in bounds: ClosedRange<V>,
    step: V.Stride
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
          TextField(value: $value, formatter: numberFormatter, label: {})
        }
      )
      .frame(minWidth: 75, maxWidth: 150)
      .onChange(of: value) { oldValue, newValue in
        if newValue < bounds.lowerBound || newValue > bounds.upperBound {
          value = oldValue
        }
      }
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
