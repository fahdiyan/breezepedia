//
//  TipKitUserGuide.swift
//  breezepedia
//
//  Created by Muhammad Irhamdi Fahdiyan Noor on 16/05/25.
//


import TipKit

struct SearchTip: Tip {
    var title: Text {
        Text("Search Data Tenant")
    }

    var message: Text? {
        Text("You can type tenant’s name here to find their location on the map")
    }

    var image: Image? {
        Image(systemName: "magnifyingglass")
    }
}

struct FilterTip: Tip {
    var title: Text {
        Text("Filter Data")
    }

    var message: Text? {
        Text("You can filter tenant on the map based on your preferences here")
    }

    var image: Image? {
        Image(systemName: "line.3.horizontal.decrease.circle")
    }
}

struct PinTip: Tip {
    var title: Text {
        Text("Tenant Location's Point")
    }

    var message: Text? {
        Text("This is the tenant’s location point! Just tap it to see the tenant’s information")
    }

    var image: Image? {
        Image(systemName: "mappin.and.ellipse")
    }
}

struct ExitTip: Tip {
    var title: Text {
        Text("Back to main menu")
    }

    var message: Text? {
        Text("Tap this to back to general map layout (main page BreezePedia)")
    }

    var image: Image? {
        Image(systemName: "mappin.and.ellipse")
    }
}

struct TimeTip: Tip {
    var title: Text {
        Text("Estimation Time Arrived")
    }

    var message: Text? {
        Text("This is estimation time to reach tenant’s location from main lobby")
    }

    var image: Image? {
        Image(systemName: "mappin.and.ellipse")
    }
}

struct DistanceTip: Tip {
    var title: Text {
        Text("Estimation Distance to tenant")
    }

    var message: Text? {
        Text("This is the distance from main lobby to tenant’s location")
    }

    var image: Image? {
        Image(systemName: "mappin.and.ellipse")
    }
}

class TipSequenceManager: ObservableObject {
    @Published var currentStep = 0

    let steps: [any Tip] = [SearchTip(), FilterTip(), ExitTip(), TimeTip(), DistanceTip()]

    var currentTip: (any Tip)? {
        guard currentStep < steps.count else { return nil }
        return steps[currentStep]
    }

    func next() {
        if currentStep < steps.count - 1 {
            currentStep += 1
        }
    }

    func reset() {
        currentStep = 0
        try? Tips.resetDatastore()
    }
}

struct ContentView2: View {
    @StateObject var tipManager = TipSequenceManager()

    var body: some View {
        VStack(spacing: 40) {
            Group {
                Image(systemName: "magnifyingglass")
                    .popoverTip(SearchTip(), arrowEdge: .bottom)
                    .opacity(tipManager.currentStep == 0 ? 1 : 0)

                Image(systemName: "line.3.horizontal.decrease.circle")
                    .popoverTip(FilterTip(), arrowEdge: .bottom)
                    .opacity(tipManager.currentStep == 1 ? 1 : 0)

                Image(systemName: "mappin.and.ellipse")
                    .popoverTip(PinTip(), arrowEdge: .bottom)
                    .opacity(tipManager.currentStep == 2 ? 1 : 0)
            }

            HStack {
                Button("Next") {
                    tipManager.next()
                }
                .disabled(tipManager.currentStep >= 2)

                Button("Reset") {
                    tipManager.reset()
                }
            }
        }
        .padding()
    }
}



#Preview {
    ContentView2()
}



//
//import TipKit
//
//struct SearchTip: Tip {
//    var title: Text { Text("Cari Sesuatu") }
//    var message: Text? { Text("Gunakan pencarian untuk menemukan lokasi atau tempat.") }
//}
//
//struct FilterTip: Tip {
//    var title: Text { Text("Gunakan Filter") }
//    var message: Text? { Text("Saring hasil pencarian agar lebih relevan.") }
//}
//
//struct PinTip: Tip {
//    var title: Text { Text("Lihat Pin") }
//    var message: Text? { Text("Klik pin untuk melihat detail tempat.") }
//}
//
//class TipSequenceManager: ObservableObject {
//    @Published var currentIndex: Int = 0
//    
//    let tips: [any Tip] = [
//        SearchTip(),
//        FilterTip(),
//        PinTip()
//    ]
//    
//    var currentTip: (any Tip)? {
//        guard currentIndex < tips.count else { return nil }
//        return tips[currentIndex]
//    }
//    
//    func nextTip() {
//        if currentIndex < tips.count - 1 {
//            currentIndex += 1
//        } else {
//            currentIndex = tips.count // end of tips
//        }
//    }
//
//    func reset() {
//        currentIndex = 0
//    }
//}
//
//import SwiftUI
//import TipKit
//
//struct GuidedTipView: View {
//    @ObservedObject var manager: TipSequenceManager
//
//    var body: some View {
//        VStack {
//            if let tip = manager.currentTip {
//                TipView(tip)
//                
//                Button("Next") {
//                    manager.nextTip()
//                }
//                .padding(.top, 8)
//            }
//        }
//    }
//}
//
//struct GuidedTipOverlay: View {
//    @ObservedObject var manager: TipSequenceManager
//
//    var body: some View {
//        if let tip = manager.currentTip {
//            VStack {
//                TipView(tip)
//                    .padding()
//                    .background(.thinMaterial)
//                    .cornerRadius(12)
//
//                Button("Next") {
//                    manager.nextTip()
//                }
//                .padding(.top, 4)
//            }
//            .padding()
//            .background(Color.black.opacity(0.3).ignoresSafeArea())
//        }
//    }
//}
//
//
//struct ContentView2: View {
//    @StateObject var tipManager = TipSequenceManager()
//    
//    var body: some View {
//        VStack(spacing: 40) {
//            HStack {
//                Image(systemName: "magnifyingglass")
//                Text("Search")
//            }
//            .popoverTip(SearchTip()) // akan muncul di step pertama
//
//            HStack {
//                Image(systemName: "line.3.horizontal.decrease.circle")
//                Text("Filter")
//            }
//            .popoverTip(FilterTip()) // step kedua
//
//            HStack {
//                Image(systemName: "mappin.circle")
//                Text("Pin")
//            }
//            .popoverTip(PinTip()) // step ketiga
//
//            GuidedTipView(manager: tipManager)
//
//            Button("Mulai Ulang Panduan") {
//                tipManager.reset()
//            }
//        }
//        .task {
//            try? Tips.configure()
//        }
//    }
//}
