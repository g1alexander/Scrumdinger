//
//  ScrumProgressViewStyle.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/30/23.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    var theme: Theme
    
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .frame(height: 12.0)
            .accentColor(theme.mainColor)
            .padding(.horizontal)
    }
}
