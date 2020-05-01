//
//  SwiftUIView.swift
//  ShareExtension
//
//  Created by Laurens on 01.05.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct CreatePlayzView: View {
    
    let extensionContext: NSExtensionContext?
    
    @State private var playzName: String = ""
    
    var body: some View {
        VStack {
            Text("Create Playz")
                .font(.title)
                .padding(.top, 70)
            TextField("Give your Playz a name", text: $playzName)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action:{
                self.createPlayz()
            }) {
                Text("Save Playz")
            }
            .padding(.top)
            Spacer()
        }
    }
    
    func createPlayz() {
        if !playzName.isEmpty {
            ExtensionHelpers.extensionHelpers.getFileFromExtensionAndSave(name: playzName, extensionContext)
        }
    }
}