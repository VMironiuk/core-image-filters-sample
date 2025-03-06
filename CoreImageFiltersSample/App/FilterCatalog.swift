//
//  FilterCatalog.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 15.01.2025.
//

public struct FilterCatalog {
  public init() {}
  
  public func filters(by categoryID: Int?) -> [Category.Filter]? {
    guard let categoryID,
          categoryID >= 0,
          categoryID < categories.count else { return nil }
    return categories[categoryID].filters
  }
  
  public func filter(byCategoryID categoryID: Int?, filterID: String?) -> Category.Filter? {
    guard let filters = filters(by: categoryID),
          let filterID else { return nil }
    return filters.first { $0.rawValue == filterID }
  }
}

extension FilterCatalog {
  public struct Category: Identifiable {
    public let id: Int
    public let name: String
    public let filters: [Filter]
  }
}

extension FilterCatalog.Category {
  public enum Filter: String, Identifiable {
    public var id: String { rawValue }
    public var name: String { rawValue }
    
    case bokehBlur = "Bokeh Blur"
    case boxBlur = "Box Blur"
    case discBlur = "Disc Blur"
    case gaussianBlur = "Gaussian Blur"
    case maskedVariableBlur = "Masked Variable Blur"
    case median = "Median"
    case morphologyGradient = "Morphology Gradient"
    case morphologyMaximum = "Morphology Maximum"
    case morphologyMinimum = "Morphology Minimum"
    case morphologyRectangleMaximum = "Morphology Rectangle Maximum"
    case morphologyRectangleMinimum = "Morphology Rectangle Minimum"
    case motionBlur = "Motion Blur"
    case noiseReduction = "Noise Reduction"
    case zoomBlur = "Zoom Blur"
    case colorAbsoluteDifference = "Color Absolute Difference"
    case colorClamp = "Color Clamp"
    case colorControls = "Color Controls"
    case colorMatrix = "Color Matrix"
    case colorPolynomial = "Color Polynomial"
    case colorThreshold = "Color Threshold"
    case colorThresholdOtsu = "Color Threshold Otsu"
    case depthToDisparity = "Depth To Disparity"
    case disparityToDepth = "Disparity To Depth"
    case exposureAdjust = "Exposure Adjust"
    case gammaAdjust = "Gamma Adjust"
    case hueAdjust = "Hue Adjust"
    case linearToSRGBToneCurve = "Linear To SRGB Tone Curve"
    case srgbToneCurveToLinear = "SRGB Tone Curve To Linear"
    case temperatureAndTint = "Temperature And Tint"
    case toneCurve = "Tone Curve"
    case vibrance = "Vibrance"
    case whitePointAdjust = "White Point Adjust"
  }
}

extension FilterCatalog {
  public var categories: [Category] {
    [
      Category(
        id: 0,
        name: "Blur Filters",
        filters: [
          .bokehBlur,
          .boxBlur,
          .discBlur,
          .gaussianBlur,
          .maskedVariableBlur,
          .median,
          .morphologyGradient,
          .morphologyMaximum,
          .morphologyMinimum,
          .morphologyRectangleMaximum,
          .morphologyRectangleMinimum,
          .motionBlur,
          .noiseReduction,
          .zoomBlur
        ]
      ),
      Category(
        id: 1,
        name: "Color Adjustment Filters",
        filters: [
          .colorAbsoluteDifference,
          .colorClamp,
          .colorControls,
          .colorMatrix,
          .colorPolynomial,
          .colorThreshold,
          .colorThresholdOtsu,
          .depthToDisparity,
          .disparityToDepth,
          .exposureAdjust,
          .gammaAdjust,
          .hueAdjust,
          .linearToSRGBToneCurve,
          .srgbToneCurveToLinear,
          .temperatureAndTint,
          .toneCurve,
          .vibrance,
          .whitePointAdjust
        ]
      )
    ]
  }
}
