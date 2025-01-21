//
//  FilterCatalogTests.swift
//  CoreImageFiltersSampleTests
//
//  Created by Vova Myroniuk on 20.01.2025.
//

import CoreImageFiltersSample
import Testing

struct FilterCatalogTests {
  @Test func filtersByCategoryID() async throws {
    let sut = FilterCatalog()
    #expect(sut.filters(by: nil) == nil)
    #expect(sut.filters(by: -1) == nil)
    #expect(sut.filters(by: sut.categories.count) == nil)
    #expect(sut.filters(by: 0) != nil)
    #expect(sut.filters(by: sut.categories.count - 1) != nil)
  }
  
  @Test func filterByCategoryIDAndFilterID() async throws {
    let invalidFilterID = -1
    let sut = FilterCatalog()
    
    #expect(sut.filter(byCategoryID: nil, filterID: nil) == nil)
    
    #expect(sut.filter(byCategoryID: nil, filterID: -1) == nil)
    #expect(sut.filter(byCategoryID: nil, filterID: invalidFilterID) == nil)
    #expect(sut.filter(byCategoryID: nil, filterID: 0) == nil)
    #expect(sut.filter(byCategoryID: nil, filterID: invalidFilterID) == nil)
    
    #expect(sut.filter(byCategoryID: -1, filterID: -1) == nil)
    #expect(sut.filter(byCategoryID: -1, filterID: invalidFilterID) == nil)
    #expect(sut.filter(byCategoryID: -1, filterID: 0) == nil)
    #expect(sut.filter(byCategoryID: -1, filterID: invalidFilterID) == nil)
    
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: -1) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: invalidFilterID) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: 0) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: invalidFilterID) == nil)
        
    #expect(sut.filter(byCategoryID: -1, filterID: nil) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: nil) == nil)
    #expect(sut.filter(byCategoryID: 0, filterID: nil) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: nil) == nil)
    
    #expect(sut.filter(byCategoryID: -1, filterID: -1) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: -1) == nil)
    #expect(sut.filter(byCategoryID: 0, filterID: -1) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: -1) == nil)
        
    #expect(sut.filter(byCategoryID: -1, filterID: 0) == nil)
    #expect(sut.filter(byCategoryID: sut.categories.count, filterID: 0) == nil)
    #expect(sut.filter(byCategoryID: 0, filterID: 0) != nil)
    #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: 0) != nil)
    
    do {
      let filtersCount = sut.filters(by: 0)!.count
      #expect(sut.filter(byCategoryID: 0, filterID: -1) == nil)
      #expect(sut.filter(byCategoryID: 0, filterID: filtersCount) == nil)
      #expect(sut.filter(byCategoryID: 0, filterID: 0) != nil)
      #expect(sut.filter(byCategoryID: 0, filterID: filtersCount - 1) != nil)
    }
    
    do {
      let filtersCount = sut.filters(by: sut.categories.count - 1)!.count
      #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: -1) == nil)
      #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: filtersCount) == nil)
      #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: 0) != nil)
      #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: filtersCount - 1) != nil)
    }
    
    do {
      let filtersCount = sut.filters(by: sut.categories.count - 1)!.count
      #expect(sut.filter(byCategoryID: -1, filterID: sut.categories.count) == nil)
      #expect(sut.filter(byCategoryID: sut.categories.count, filterID: sut.categories.count) == nil)
      #expect(sut.filter(byCategoryID: 0, filterID: filtersCount) == nil)
      #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: filtersCount) == nil)
    }

    do {
      let filtersCount1 = sut.filters(by: 0)!.count
      let filtersCount2 = sut.filters(by: sut.categories.count - 1)!.count
      #expect(sut.filter(byCategoryID: -1, filterID: invalidFilterID) == nil)
      #expect(sut.filter(byCategoryID: sut.categories.count , filterID: invalidFilterID) == nil)
      #expect(sut.filter(byCategoryID: 0, filterID: filtersCount1 - 1) != nil)
      #expect(sut.filter(byCategoryID: sut.categories.count - 1, filterID: filtersCount2 - 1) != nil)
    }
  }
}
