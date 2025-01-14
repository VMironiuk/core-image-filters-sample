//
//  ContentView.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 12.01.2025.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationSplitView {
      Text("Catalog of filters")
    } content: {
      Text("Sub catalog of filters")
    } detail: {
      Text("Selected filter")
    }
  }
}

#Preview {
  ContentView()
}
