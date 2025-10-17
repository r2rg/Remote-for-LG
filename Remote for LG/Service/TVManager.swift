import Foundation
import SwiftUI

@Observable
final class TVManager {
    var tvList: [TV] = TVStorage.load()
    var selectedTV: TV? = TV(name: "", location: "", ip: "")
    
    func selectTV(_ tv: TV) {
        selectedTV = tv
    }
    
    func addTV(_ tv: TV) {
        tvList.append(tv)
        TVStorage.save(tvs: tvList)
    }
    
    func removeTV(at offsets: IndexSet) {
        tvList.remove(atOffsets: offsets)
        TVStorage.save(tvs: tvList)
    }
}
