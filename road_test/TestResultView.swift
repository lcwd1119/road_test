//
//  TestResultView.swift
//  road_test
//
//  Created by 廖晨維 on 2021/12/4.
//

import SwiftUI

struct TestResultView: View {
    @Binding var incorrect_mark:[Question_mark]
    @Binding var incorrect_law:[Question_law]
    @Binding var Showresult:Bool
    @Binding var name:String
    @Binding var birthday:Date
    @Binding var nation:String
    @Binding var height:Double
    @Binding var weight:Int
    @Binding var gender:Bool
    var body: some View {
        VStack{
            Text("考生姓名:\(name)")
            Text("性別:\(gender ? "男" : "女")")
            Text("國籍:\(nation)")
            Text("身高:\(height,specifier: "%.1F")   體重:\(weight)")
            Text("生日:\(birthday,style: .date)")
            Text("分數:\((10-incorrect_law.count-incorrect_mark.count)*10)")
            Form {
                ForEach(incorrect_mark.indices){
                    i in
                    markquestionView(question: incorrect_mark[i])
                }
                ForEach(incorrect_law.indices){
                    i in
                    lawquestionView(question: incorrect_law[i])
                }
            }
            Button {
                Showresult=false
            } label: {
                Text("關閉").font(.headline)
            }.buttonStyle(.bordered)
        }
    }
}


struct TestResultView_Previews: PreviewProvider {
    @State static var demomark = [Question_mark(q: Image("question_mark1"),t:"圖中白色虛線為：\n\n(1)轉彎線。\n(2)網狀線。\n(3)槽化線。", ans: 1)]
    @State static var demolaw = [Question_law(q: "下列何種違規行為得對汽車所有人逕行舉發處罰：\n\n(1)無照駕駛。\n(2)酒醉駕車。\n(3)違規停車而駕駛人不在場。", ans: 3)]
    @State static var demo = false
    @State static var demoname = ""
    @State static var demoday = Date()
    @State static var demonation = "本國"
    @State static var demoheight = 100.0
    @State static var demoweight = 30
    @State static var demogender = true
    static var previews: some View {
        TestResultView(incorrect_mark: $demomark, incorrect_law: $demolaw,Showresult: .constant(true), name: $demoname, birthday: $demoday, nation: $demonation, height: $demoheight, weight: $demoweight, gender: $demogender)
    }
}
