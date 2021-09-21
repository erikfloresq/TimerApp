//
//  HeaderView.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 21/9/21.
//

import SwiftUI

struct HeaderView: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.system(size: 11).bold())
            .padding(3)
            .background(Color.green)
            .cornerRadius(5)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Minutes")
    }
}
