//
//  ContentView.swift
//  CarAssignment
//
//  Created by Shujat Ali on 31/10/2023.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var listViewModel = ListViewModel.shared 
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(listViewModel.carItems.indices, id: \.self) { index in
                    NavigationLink(
                        destination: CarDetailScreen(car: index),
                        label: {
                            VStack(alignment: .leading) {
                                Text(listViewModel.carItems[index].title)
                                Text(listViewModel.carItems[index].description)
                                    .foregroundColor(.secondary)
                            }
                        }
                    )
                }
            }
        }
        .task {
            do {
                try await listViewModel.fetchCars()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
