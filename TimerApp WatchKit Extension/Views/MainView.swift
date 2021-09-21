//
//  ContentView.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 19/9/21.
//

import SwiftUI

struct MainView: View {
    @State var hoursSelected: Int = 0
    @State var minutesSelected: Int = 0
    @State var secondsSelected: Int = 0

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                HStack {
                    DigitPicker(title: "Hours",
                               digits: (0...23),
                               timeSelected: $hoursSelected)
                    Text(":")
                    DigitPicker(title: "Minutes",
                               digits: (1...59),
                               timeSelected: $minutesSelected)
                    Text(":")
                    DigitPicker(title: "Seconds",
                               digits: (0...59),
                               timeSelected: $secondsSelected)
                }.frame(height: 100, alignment: .center)
                NavigationLink("Start") {
//                    TimerView(hour: "\(hoursSelected)",
//                              minutes: "\(minutesSelected)",
//                              seconds: "\(secondsSelected)")
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
