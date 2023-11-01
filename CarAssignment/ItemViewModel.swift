//
//  ItemViewModel.swift
//  CarAssignment
//
//  Created by Shujat Ali on 31/10/2023.
//

import Foundation
import ApiManager
import SwiftUI


struct ItemViewModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let stock: Int
    let imageUrl: String
    let moreDetail: String
    
    init() {
        //for test data
        title = "Mazda MX-5"
        imageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/2015_Mazda_MX-5_ND_2.0_SKYACTIV-G_160_i-ELOOP_Rubinrot-Metallic_Vorderansicht.jpg/400px-2015_Mazda_MX-5_ND_2.0_SKYACTIV-G_160_i-ELOOP_Rubinrot-Metallic_Vorderansicht.jpg"
        description = "Stock: 4"
        moreDetail = "Production Year: 2009"
        stock = 4
    }
    
    init(_ item: ListItem) {
        title = item.title
        imageUrl = item.image
        description = "Stock: \(item.stock)"
        var desc = ""
        if let productionYear = item.productionYear {
            desc += "Production Year: " + productionYear + "\n"
        }
        
        if let details = item.desc {
            desc += "Type of Car: \(details)"
        }
        
        moreDetail = desc
        stock = item.stock
    }
}


final class ListViewModel: ObservableObject {
    
    @Published var carItems: [ItemViewModel] = []
    
    public static var shared = ListViewModel()
    
    private init() { 
        print("init called")
    }
    
    func fetchCars() async throws {
        
        let api = ApiClientAdapter()
        let items = try await api.listItems
        print(items.count)
        Task { @MainActor [items] in
            print(items.count)
            ListViewModel.shared.carItems.append(contentsOf:   Self.sorted(items.map {
                ItemViewModel($0)
            }))
            print(ListViewModel.shared.carItems.count)
        }
    }
    
    private static func sorted<C>(
        _ cars: C
    ) -> [ItemViewModel] where C: Sequence, C.Element == ItemViewModel {
        cars.sorted { $0.title < $1.title }
    }
}



