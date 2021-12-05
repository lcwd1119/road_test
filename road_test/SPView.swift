//
//  SPView.swift
//  road_test
//
//  Created by 廖晨維 on 2021/12/5.
//

import SwiftUI
import MapKit
struct SPView: View {
    @State private var bgColor = Color.white
    @Binding var showSP:Bool
    
    @State private var showingOptions = false
    @State private var selection = "None"
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.1474493, longitude: 121.7772186), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        VStack {
            Form {
                Section{
                    ColorPicker("設定背景顏色", selection: $bgColor)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(bgColor)
                Section{
                    Text(selection)
                    
                    Button("有沒有駕照") {
                        showingOptions = true
                    }
                    .confirmationDialog("Choose one", isPresented: $showingOptions, titleVisibility: .visible) {
                        Button("有") {
                            selection = "有"
                        }
                        
                        Button("沒有") {
                            selection = "沒有"
                        }
                    }
                }
                Section{
                    Text("點進來看看")
                        .contextMenu {
                            Text("2ㄏ2ㄏ")
                            Button {} label: {
                                Text("我什麼都沒有")
                            }
                        }
                }
                Section{
                    Text("地圖")
                    Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .frame(width: 400, height: 300)                }
            }
            Button {
                showSP=false
            } label: {
                Text("關閉").font(.headline)
            }.buttonStyle(.bordered)
        }
    }
    
    struct SPView_Previews: PreviewProvider {
        @State static var demo = true
        static var previews: some View {
            SPView(showSP: $demo)
        }
    }
}
