//
//  Navigation.swift
//  Scrumdinger
//
//  Created by g1alexander on 8/21/23.
//

//import Foundation
import SwiftUI

struct Navigation<Content: View>: View {
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack {
            if #available(iOS 16.0, *){
                NavigationStack {
                    content()
                }
            } else {
                NavigationView {
                    content()
                }
            }
        }
    }
}
