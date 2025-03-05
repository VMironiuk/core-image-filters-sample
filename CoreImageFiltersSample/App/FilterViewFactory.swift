//
//  FilterViewFactory.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 04.03.2025.
//

import SwiftUI

@MainActor
enum FilterViewFactory {
  @ViewBuilder
  static func filterView(
    by filter: FilterCatalog.Category.Filter,
    image: CGImage?
  ) -> some View {
    switch filter {
    case .bokehBlur: BokehBlurFilterView(image: image)
    default: EmptyView()
    }
  }
}
