//
//  ContentView.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 12.01.2025.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var imageStore = ImageStore()
  @State private var filterCategoryID: Int?
  @State private var filterID: String?
  
  let filterCatalog: FilterCatalog
  
  var body: some View {
    NavigationSplitView(
      sidebar: sidebar,
      content: content,
      detail: detail
    )
    .environmentObject(imageStore)
  }
}

private extension ContentView {
  private func sidebar() -> some View {
    List(filterCatalog.categories, selection: $filterCategoryID) { category in
      Text(category.name)
    }
  }
  
  @ViewBuilder
  private func content() -> some View {
    if let filters = filterCatalog.filters(by: filterCategoryID) {
      List(filters, selection: $filterID) { filter in
        Text(filter.name)
      }
    } else {
      Text("Select filters category")
    }
  }
  
  @ViewBuilder
  private func detail() -> some View {
    if let filter = filterCatalog.filter(
      byCategoryID: filterCategoryID,
      filterID: filterID
    ) {
        HSplitView {
          ImageView()
          FilterViewFactory.filterView(by: filter, image: imageStore.image)
        }
    } else {
      Text("Select filter")
    }
  }
}

#Preview {
  ContentView(filterCatalog: FilterCatalog())
}
