//
//  ThemePickerView.swift
//  Scrumdinger
//
//  Created by g1alexander on 7/22/23.
//

import SwiftUI

struct ThemePickerView: View {
    @Binding var selection: Theme
    var body: some View {
        if #available(iOS 16.0, *){
            Picker("Theme", selection: $selection ){
                ForEach(Theme.allCases) { theme in
                    ThemeView(theme: theme)
                        .tag(theme)
                }
            }
            .pickerStyle(.navigationLink)
        } else {
            Picker("Theme", selection: $selection ){
                ForEach(Theme.allCases) { theme in
                    ThemeView(theme: theme)
                        .tag(theme)
                }
            }
            .pickerStyle(.wheel)
        }
        
    }
}

struct ThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePickerView(selection: .constant(.periwinkle))
    }
}
