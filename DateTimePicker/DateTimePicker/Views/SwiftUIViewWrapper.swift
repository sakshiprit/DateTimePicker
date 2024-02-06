//
//  SwiftUIViewWrapper.swift
//  DateTimePicker
//
//  Created by Sakshi Patil on 05/02/2024.
//

import Foundation
import SwiftUI

// Allows the SwiftUI view to be presented by Objective-C UIViewController.
// UIHostingController enables to host the DateTimePickerView (SwiftUI view).
class SwiftUIViewWrapper : NSObject {
    @objc static func createSwiftUIView() -> UIViewController {
        return UIHostingController(rootView: DateTimePickerView())
    }
}
