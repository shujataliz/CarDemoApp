//
//  CarDetailScreen.swift
//  CarAssignment
//
//  Created by Shujat Ali on 31/10/2023.
//

import SwiftUI

// Create the second screen
struct CarDetailScreen: View {
    var car: Int = -1

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: ListViewModel.shared.carItems[car].imageUrl))
            Text("Selected Car Model: **\(ListViewModel.shared.carItems[car].title)**")
            Text("Amount in Stock: **\(ListViewModel.shared.carItems[car].stock)**")
            Text(ListViewModel.shared.carItems[car].moreDetail)
            
            Spacer()
        }
        .navigationBarTitle(ListViewModel.shared.carItems[car].title)
    }
}

#Preview {
    NavigationStack {
        CarDetailScreen(car: 0)
    }
    
}
