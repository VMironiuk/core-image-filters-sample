//
//  FilterCatalogTests.swift
//  CoreImageFiltersSampleTests
//
//  Created by Vova Myroniuk on 20.01.2025.
//

import CoreImageFiltersSample
import Testing

@Suite
struct FilterCatalogTests {
  @Test
  func filtersByCategoryID() async throws {
    let sut = FilterCatalog()
    #expect(sut.filters(by: nil) == nil)
    #expect(sut.filters(by: -1) == nil)
    #expect(sut.filters(by: sut.categories.count) == nil)
    #expect(sut.filters(by: 0) != nil)
    #expect(sut.filters(by: sut.categories.count - 1) != nil)
  }
  
  @Test
  func filterByCategoryIDAndFilterID() async throws {
    let invalidFilterID = "invalid filter id"
    let anyValidFilterID = FilterCatalog.Category.Filter.bokehBlur.rawValue
    let sut = FilterCatalog()
    
    #expect(sut.filter(byCategoryID: nil, filterID: nil) == nil)
    
    #expect(sut.filter(byCategoryID: nil, filterID: nil) == nil)
    #expect(sut.filter(byCategoryID: nil, filterID: invalidFilterID) == nil)
    #expect(sut.filter(byCategoryID: nil, filterID: anyValidFilterID) == nil)
    #expect(sut.filter(byCategoryID: nil, filterID: invalidFilterID) == nil)
    
    #expect(sut.filter(byCategoryID: -1, filterID: "") == nil)
    #expect(sut.filter(byCategoryID: -1, filterID: invalidFilterID) == nil)
    #expect(sut.filter(byCategoryID: -1, filterID: anyValidFilterID) == nil)
    #expect(sut.filter(byCategoryID: -1, filterID: invalidFilterID) == nil)
    
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: "") == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: invalidFilterID) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: anyValidFilterID) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: invalidFilterID) == nil)
        
    #expect(sut.filter(byCategoryID: -1, filterID: nil) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: nil) == nil)
    #expect(sut.filter(byCategoryID: 0, filterID: nil) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: nil) == nil)
    
    #expect(sut.filter(byCategoryID: -1, filterID: "") == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: "") == nil)
    #expect(sut.filter(byCategoryID: 0, filterID: "") == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: "") == nil)
        
    #expect(sut.filter(byCategoryID: -1, filterID: anyValidFilterID) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: anyValidFilterID) == nil)
    #expect(sut.filter(byCategoryID: 0, filterID: anyValidFilterID) != nil)
  }
  
  @Test
  func blurCategory() async throws {
    let sut = FilterCatalog()
    let blurCategoryID = 0
    let blurFilters = [
      FilterCatalog.Category.Filter.bokehBlur,
      FilterCatalog.Category.Filter.boxBlur,
      FilterCatalog.Category.Filter.discBlur,
      FilterCatalog.Category.Filter.gaussianBlur,
      FilterCatalog.Category.Filter.maskedVariableBlur,
      FilterCatalog.Category.Filter.median,
      FilterCatalog.Category.Filter.morphologyGradient,
      FilterCatalog.Category.Filter.morphologyMaximum,
      FilterCatalog.Category.Filter.morphologyMinimum,
      FilterCatalog.Category.Filter.morphologyRectangleMaximum,
      FilterCatalog.Category.Filter.morphologyRectangleMinimum,
      FilterCatalog.Category.Filter.motionBlur,
      FilterCatalog.Category.Filter.noiseReduction,
      FilterCatalog.Category.Filter.zoomBlur
    ]
    
    #expect(sut.filters(by: blurCategoryID) == blurFilters)
  }
  
  @Test
  func colorAdjustmentCategory() async throws {
    let sut = FilterCatalog()
    let colorAdjustmentCategoryID = 1
    let colorAdjustmentFilters = [
      FilterCatalog.Category.Filter.colorAbsoluteDifference,
      FilterCatalog.Category.Filter.colorClamp,
      FilterCatalog.Category.Filter.colorControls,
      FilterCatalog.Category.Filter.colorMatrix,
      FilterCatalog.Category.Filter.colorPolynomial,
      FilterCatalog.Category.Filter.colorThreshold,
      FilterCatalog.Category.Filter.colorThresholdOtsu,
      FilterCatalog.Category.Filter.depthToDisparity,
      FilterCatalog.Category.Filter.disparityToDepth,
      FilterCatalog.Category.Filter.exposureAdjust,
      FilterCatalog.Category.Filter.gammaAdjust,
      FilterCatalog.Category.Filter.hueAdjust,
      FilterCatalog.Category.Filter.linearToSRGBToneCurve,
      FilterCatalog.Category.Filter.srgbToneCurveToLinear,
      FilterCatalog.Category.Filter.temperatureAndTint,
      FilterCatalog.Category.Filter.toneCurve,
      FilterCatalog.Category.Filter.vibrance,
      FilterCatalog.Category.Filter.whitePointAdjust
    ]
    
    #expect(sut.filters(by: colorAdjustmentCategoryID) == colorAdjustmentFilters)
  }
}
