//
//  ContentView.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 19/9/21.
//

import SwiftUI

class FinishTime: ObservableObject {
    @Published var hour: Int = 0
    @Published var minute: Int = 0
    @Published var seconds: Int = 0
}

struct MainView: View {
    @StateObject var finishTime: FinishTime = FinishTime()
    let viewModel: MainViewModel = MainViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                HStack {
                    DigitPicker(title: "Hours",
                                digits: (0...23),
                                timeSelected: $finishTime.hour)
                    Text(":")
                    DigitPicker(title: "Minutes",
                                digits: (1...59),
                                timeSelected: $finishTime.minute)
                    Text(":")
                    DigitPicker(title: "Seconds",
                                digits: (0...59),
                                timeSelected: $finishTime.seconds)
                }.frame(height: 100, alignment: .center)
                NavigationLink("Start") {
                    TimerView(timeFinishInSeconds: viewModel.getSeconds(from: finishTime))
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
