//
//  FilterCatalog.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 15.01.2025.
//

struct FilterCatalog {
}

extension FilterCatalog {
  struct Category: Identifiable {
    let id: Int
    let name: String
    let filters: [Filter]
  }
}

extension FilterCatalog.Category {
  struct Filter: Identifiable {
    let id: Int
    let name: String
  }
}

extension FilterCatalog {
  var categories: [Category] {
    [
      Category(
        id: 0,
        name: "Blur Filters",
        filters: [
          .init(id: 0, name: "Bokeh Blur"),
          .init(id: 1, name: "Box Blur"),
          .init(id: 2, name: "Disc Blur"),
          .init(id: 3, name: "Gaussian Blur"),
          .init(id: 4, name: "Masked Variable Blur"),
          .init(id: 5, name: "Median"),
          .init(id: 6, name: "Morphology Gradient"),
          .init(id: 7, name: "Morphology Maximum"),
          .init(id: 8, name: "Morphology Minimum"),
          .init(id: 9, name: "Morphology Rectangle Maximum"),
          .init(id: 10, name: "Morphology Rectangle Minimum"),
          .init(id: 11, name: "Motion Blur"),
          .init(id: 12, name: "Noise Reduction"),
          .init(id: 13, name: "Zoom Blur")
        ]
      ),
      Category(
        id: 1,
        name: "Color Adjustment Filters",
        filters: [
          .init(id: 0, name: "Color Absolute Difference"),
          .init(id: 1, name: "Color Clamp"),
          .init(id: 2, name: "Color Controls"),
          .init(id: 3, name: "Color Matrix"),
          .init(id: 4, name: "Color Polynomial"),
          .init(id: 5, name: "Color Threshold"),
          .init(id: 6, name: "Color Threshold Otsu"),
          .init(id: 7, name: "Depth To Disparity"),
          .init(id: 8, name: "Disparity To Depth"),
          .init(id: 9, name: "Exposure Adjust"),
          .init(id: 10, name: "Gamma Adjust"),
          .init(id: 11, name: "Hue Adjust"),
          .init(id: 12, name: "Linear To SRGB Tone Curve"),
          .init(id: 13, name: "SRGB Tone Curve To Linear"),
          .init(id: 14, name: "Temperature And Tint"),
          .init(id: 15, name: "Tone Curve"),
          .init(id: 16, name: "Vibrance"),
          .init(id: 17, name: "White Point Adjust")
        ]
      )
    ]
  }
}
