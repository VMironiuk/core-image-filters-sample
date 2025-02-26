//
//  ImageView.swift
//  CoreImageFiltersSample
//
//  Created by Vova Myroniuk on 26.02.2025.
//

import SwiftUI

struct ImageView: View {
  @ObservedObject var imageStore: ImageStore
  
  var body: some View {
    if let image = imageStore.image {
      Image(image, scale: 1.0, label: Text(""))
        .resizable()
        .scaledToFit()
        .padding()
    } else {
      VStack {
        Spacer()
        HStack {
          Spacer()
          Image(systemName: "photo.badge.exclamationmark")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
          Spacer()
        }
        Spacer()
      }
    }
  }
}

#Preview {
  ImageView(imageStore: ImageStore())
}
