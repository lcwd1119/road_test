//
//  Personal_infView.swift
//  road_test
//
//  Created by 廖晨維 on 2021/12/3.
//

import SwiftUI

struct Personal_infView: View {
    @State private var Showtest = false
    @State private var name = ""
    @State private var ps = ""
    @State private var birthday = Date()
    @State private var nation = "本國"
    @State private var height = 100.0
    @State private var weight = 30
    @State private var gender = true
    @State var ShowSP:Bool = false
    
    @FocusState private var nameIsFocused: Bool
    var body: some View {
        
        VStack {
            Image("car1")
            Text("請輸入個人資料")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
            Form{
                Group{
                    Section{
                        TextField("考生姓名", text: $name,prompt: Text("請輸入")).focused($nameIsFocused)
                    }
                    Section{
                        Toggle("性別：\(gender ? "男" : "女")", isOn: $gender)
                            .onChange(of: gender) { newValue in
                                if(newValue){
                                    name+="先生"
                                }
                                else{
                                    name+="小姐"
                                }
                            }
                    }
                    Section{
                        Text("身高:\(height,specifier: "%.1F")")
                        Slider(value: $height,in: 100...250)
                    }
                    Section{
                        Stepper(value: $weight, in: 30...150,step: 1) {
                            Text("體重:\(weight)")
                        }
                    }
                    Section{
                        Picker("國籍", selection: $nation) {
                            Text("本國").tag("本國")
                            Text("非本國").tag("非本國")
                        }.pickerStyle(.segmented)
                    }
                    Section{
                        DatePicker("出生年月日", selection: $birthday,displayedComponents: .date)
                    }
                    Section{
                        Text("備註")
                        TextEditor(text: $ps)
                            .frame(height: 100)
                    }
                    Section{
                        DisclosureGroup("更多選項"){
                            Button {
                                ShowSP = true
                            } label: {
                                Text("我不想考試啊")
                            }.sheet(isPresented: $ShowSP) {
                                SPView(showSP: $ShowSP)
                            }
                        }
                    }
                    Button {
                        Showtest = true
                        nameIsFocused = false
                    } label: {
                        Text("開始考試")
                    }.fullScreenCover(isPresented: $Showtest) {
                        RoadTestView(Showtest: $Showtest, name: $name, birthday: $birthday, nation: $nation, height: $height, weight: $weight, gender: $gender)
                    }
                }
            }
            
        }
    }
}
struct Personal_infView_Previews: PreviewProvider {
    static var previews: some View {
        Personal_infView()
    }
}
