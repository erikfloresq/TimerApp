//
//  DigitPicker.swift
//  TimerApp WatchKit Extension
//
//  Created by Erik Flores on 21/9/21.
//

import SwiftUI

struct DigitPicker: View {
    var title: String
    var digits: ClosedRange<Int>
    @Binding var timeSelected: Int

    var body: some View {
        Picker(selection: $timeSelected) {
            PickerBody(data: digits)
        } label: {
            HeaderView(title: title)
        }.pickerStyle(.wheel)
    }
}

struct DigitPicker_Previews: PreviewProvider {
    static var previews: some View {
        DigitPicker(title: "Minutes", digits:(0...59), timeSelected: .constant(0))
    }
}
