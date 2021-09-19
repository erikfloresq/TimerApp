//
//  TimerView.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 19/9/21.
//

import SwiftUI

struct TimerView: View {
    let hour: String
    let minutes: String
    let seconds: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(hour)
                Text(":")
                Text(minutes)
                Text(":")
                Text(seconds)
            }.font(.system(size: 40))
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Cancel")
            }
            .background(.red)
            .cornerRadius(10)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(hour: "00", minutes: "01", seconds: "02")
    }
}
