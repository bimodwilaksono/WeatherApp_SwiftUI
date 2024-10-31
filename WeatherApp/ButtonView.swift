//
//  ButtonView.swift
//  WeatherApp
//
//  Created by Bimo Laksono on 12/10/24.
//

import SwiftUI

struct ButtonView : View {
    var text: String
    var body: some View {
            Text(text)
                .frame(width: 280, height: 50)
                .font(.system(size: 18, weight: .bold))
                .background(.white)
                .cornerRadius(10)
    }
}
