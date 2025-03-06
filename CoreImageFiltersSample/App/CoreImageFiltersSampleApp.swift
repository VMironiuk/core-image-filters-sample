//
//  CoreImageFiltersSampleApp.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 12.01.2025.
//

import SwiftUI

@main
struct CoreImageFiltersSampleApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(filterCatalog: FilterCatalog())
    }
  }
}
