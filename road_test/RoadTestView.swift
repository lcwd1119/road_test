//
//  RoadTestView.swift
//  road_test
//
//  Created by 廖晨維 on 2021/12/4.
//

import SwiftUI

struct Question_mark{
    let q:Image
    let t:String
    let ans:Int
}
struct Question_law{
    let q:String
    let ans:Int
}

struct RoadTestView: View {
    @State private var Showresult = false
    @State private var Showalert = false
    @Binding var Showtest:Bool
    @Binding var name:String
    @Binding var birthday:Date
    @Binding var nation:String
    @Binding var height:Double
    @Binding var weight:Int
    @Binding var gender:Bool
    
    let answer = ["1","2","3"]
    var question_mark = [
        Question_mark(q: Image("question_mark1"),t:"圖中白色虛線為：\n\n(1)轉彎線。\n(2)網狀線。\n(3)槽化線。", ans: 1),
        Question_mark(q: Image("question_mark2"),t:"圖中最外側的路面邊線與車道線中間的白色實線為何種標線?\n\n(1)快慢車道分隔線。\n(2)行車分向線。\n(3)雙方禁止超車線。", ans: 1),
        Question_mark(q: Image("question_mark3"),t:"本標誌為\n\n(1)警告標誌。\n(2)車輛故障標誌。\n(3)施工標誌。", ans: 2),
        Question_mark(q: Image("question_mark4"),t:"圖中路口交叉型標線是?\n\n(1)對角線行人穿越道線。\n(2)網狀線。\n(3)自行車穿越道線。", ans: 1),
        Question_mark(q: Image("question_mark5"),t:"本標誌為\n\n(1)最低速限。\n(2)最高速限。\n(3)車輛總重限制。", ans: 2),
        Question_mark(q: Image("question_mark6"),t:"本標誌為\n\n(1)禁止超車。\n(2)禁止會車。\n(3)禁止汽車進入 。", ans: 1),
        Question_mark(q: Image("question_mark7"),t:"本標誌為\n\n(1)省道路線編號。\n(2)縣道路線編號。\n(3)國道路線編號。", ans: 2),
        Question_mark(q: Image("question_mark8"),t:"本標誌為\n\n(1)省道路線編號。\n(2)縣道路線編號。\n(3)國道路線編號。", ans: 1),
        Question_mark(q: Image("question_mark9"),t:"本標誌為\n\n(1)省道路線編號。\n(2)縣道路線編號。\n(3)國道路線編號。", ans: 3),
        Question_mark(q: Image("question_mark10"),t:"本標誌為\n\n(1)開亮頭燈。\n(2)注意號誌。\n(3)按鳴喇叭。", ans: 1),
        Question_mark(q: Image("question_mark11"),t:"本標誌為\n(1)出口。\n(2)車道。\n(3)地名。\n之指示標誌。", ans: 2)
    ].shuffled()
    var question_law = [
        Question_law(q: "下列何種違規行為得對汽車所有人逕行舉發處罰：\n\n(1)無照駕駛。\n(2)酒醉駕車。\n(3)違規停車而駕駛人不在場。", ans: 3),
        Question_law(q: "車輛行經輕軌號誌化路口，如何安全通過路口?\n\n(1)注意有無輕軌通過，自行判斷通過路口\n(2)號誌燈指示為直行箭頭綠燈時，可自行左、右轉\n(3)遵守路口標誌標號及號誌指示行止。", ans: 3),
        Question_law(q: "道路交通事故無人傷亡且車輛尚能行駛案件，當事人使用照相工具紀錄車輛位置與現場痕跡之方式時，下列何者為非\n\n(1)拍攝及移車全程注意安全並放置警告標誌。\n(2)以標線為基準，於前、後方將事故車輛與周邊設施攝入。\n(3)阻止對方當事人使用錄影工具紀錄車輛位置與現場痕跡。", ans: 3),
        Question_law(q: "計程車駕駛人對乘客繫安全帶之規定，已盡告知義務乘客仍不繫安全帶應處罰:\n\n(1)駕駛人。\n(2)乘客。\n(3)都不處罰。", ans: 2),
        Question_law(q: "汽車各個輪胎胎壓不同時，易造成:\n\n(1)引擎爆震。\n(2)行駛偏向。\n(3)不影響。", ans: 2),
        Question_law(q: "駕車酒精濃度超過規定標準，除當場移置保管該汽機車及吊扣其駕駛 執照 1 至 2 年，並處罰鍰新臺幣:\n\n(1)機車 15,000 ~90,000 元、\n汽車 30,000~120,000 元。\n(2)機車 10,000~90,000 元、\n汽車 30,000 02 元~90,000 元。\n(3)機車 6,000 ~ 12,000 元、\n汽車 30,000 元 ~90,000 元。", ans: 1),
        Question_law(q: "在高速公路最高速限每小時 90 公里以上之路段，行駛速率低於每小時:\n\n(1)80 公里。\n(2)70 公里。\n(3)60 公里。\n之較慢速小型車，應行駛於外側車道。", ans: 1),
        Question_law(q: "在高速公路之交通事故由何機關處理:\n\n(1)內政部警政署國道公路 警察局。\n(2)所轄縣、市政府警察機關。\n(3)內政部警政署交通組。", ans: 1),
        Question_law(q: "大型車輛在高速或快速公路行駛，應在:\n\n(1)內側車道行駛。\n(2)外 04 側車道行駛。\n(3)可以任意在內外側車道行駛。", ans: 2),
        Question_law(q: "違規停車經舉發後仍未改正，每逾:\n\n(1)1 小時。\n(2)2 小時。\n(3)半小時。\n 得連續舉發。", ans: 2)
    ].shuffled()
    
    @State var tmp1 = [Question_mark]()
    @State var tmp2 = [Question_law]()
    
    @State var mark1SelectedIndex=0
    @State var mark2SelectedIndex=0
    @State var mark3SelectedIndex=0
    @State var mark4SelectedIndex=0
    @State var mark5SelectedIndex=0
    
    @State var law1SelectedIndex=0
    @State var law2SelectedIndex=0
    @State var law3SelectedIndex=0
    @State var law4SelectedIndex=0
    @State var law5SelectedIndex=0
    var body: some View {
        Form{
            Group{
                Section{
                    Text("1.")
                    question_mark[0].q
                        .resizable()
                        .frame(width: 300, height: 300)
                    Text(question_mark[0].t)
                    Picker("選項",selection: $mark1SelectedIndex) {
                        ForEach(answer.indices){
                            i in
                            Text(answer[i])
                        }
                    }.pickerStyle(.segmented)
                }
                Section{
                    Text("2.")
                    question_mark[1].q
                        .resizable()
                        .frame(width: 300, height: 300)
                    Text(question_mark[1].t)
                    Picker("選項",selection: $mark2SelectedIndex) {
                        ForEach(answer.indices){
                            i in
                            Text(answer[i])
                        }
                    }.pickerStyle(.segmented)
                }
                Section{
                    Text("3.")
                    question_mark[2].q
                        .resizable()
                        .frame(width: 300, height: 300)
                    Text(question_mark[2].t)
                    Picker("選項",selection: $mark3SelectedIndex) {
                        ForEach(answer.indices){
                            i in
                            Text(answer[i])
                        }
                    }.pickerStyle(.segmented)
                }
                Section{
                    Text("4.")
                    question_mark[3].q
                        .resizable()
                        .frame(width: 300, height: 300)
                    Text(question_mark[3].t)
                    Picker("選項",selection: $mark4SelectedIndex) {
                        ForEach(answer.indices){
                            i in
                            Text(answer[i])
                        }
                    }.pickerStyle(.segmented)
                }
                Section{
                    Text("5.")
                    question_mark[4].q
                        .resizable()
                        .frame(width: 300, height: 300)
                    Text(question_mark[4].t)
                    Picker("選項",selection: $mark5SelectedIndex) {
                        ForEach(answer.indices){
                            i in
                            Text(answer[i])
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section{
                    Text("6.")
                    Text(question_law[0].q)
                    Picker("選項",selection: $law1SelectedIndex) {
                        ForEach(answer.indices){
                            i in
                            Text(answer[i])
                        }
                    }.pickerStyle(.segmented)
                }
                Section{
                    Text("7.")
                    Text(question_law[1].q)
                    Picker("選項",selection: $law2SelectedIndex) {
                        ForEach(answer.indices){
                            i in
                            Text(answer[i])
                        }
                    }.pickerStyle(.segmented)
                }
                Section{
                    Text("8.")
                    Text(question_law[2].q)
                    Picker("選項",selection: $law3SelectedIndex) {
                        ForEach(answer.indices){
                            i in
                            Text(answer[i])
                        }
                    }.pickerStyle(.segmented)
                }
                Section{
                    Text("9.")
                    Text(question_law[3].q)
                    Picker("選項",selection: $law4SelectedIndex) {
                        ForEach(answer.indices){
                            i in
                            Text(answer[i])
                        }
                    }.pickerStyle(.segmented)
                }
                Section{
                    Text("10.")
                    Text(question_law[4].q)
                    Picker("選項",selection: $law5SelectedIndex) {
                        ForEach(answer.indices){
                            i in
                            Text(answer[i])
                        }
                    }.pickerStyle(.segmented)
                }
            }
            Section{
                Button {
                    Showtest = false
                } label: {
                    Text("取消")
                }
                
                Button("確認結果"){
                    Showalert = true
                }.alert("確定交卷",isPresented: $Showalert) {
                    Button("No"){}
                    Button("Yes"){
                        tmp1 = []
                        tmp2 = []
                        Showresult = true
                        if(mark1SelectedIndex+1 != question_mark[0].ans){
                            tmp1.append(question_mark[0])
                        }
                        if(mark2SelectedIndex+1 != question_mark[1].ans){
                            tmp1.append(question_mark[1])
                        }
                        if(mark3SelectedIndex+1 != question_mark[2].ans){
                            tmp1.append(question_mark[2])
                        }
                        if(mark4SelectedIndex+1 != question_mark[3].ans){
                            tmp1.append(question_mark[3])
                        }
                        if(mark5SelectedIndex+1 != question_mark[4].ans){
                            tmp1.append(question_mark[4])
                        }
                        if(law1SelectedIndex+1 != question_law[0].ans){
                            tmp2.append(question_law[0])
                        }
                        if(law2SelectedIndex+1 != question_law[1].ans){
                            tmp2.append(question_law[1])
                        }
                        if(law3SelectedIndex+1 != question_law[2].ans){
                            tmp2.append(question_law[2])
                        }
                        if(law4SelectedIndex+1 != question_law[3].ans){
                            tmp2.append(question_law[3])
                        }
                        if(law5SelectedIndex+1 != question_law[4].ans){
                            tmp2.append(question_law[4])
                        }
                    }
                }
                .fullScreenCover(isPresented: $Showresult) {
                    TestResultView(incorrect_mark:$tmp1,incorrect_law:$tmp2,Showresult: $Showresult, name: $name, birthday: $birthday, nation: $nation, height: $height, weight: $weight, gender: $gender)
                }
            }
        }
    }
}



struct RoadTestView_Previews: PreviewProvider {
    @State static var demo = false
    @State static var demoname = ""
    @State static var demoday = Date()
    @State static var demonation = "本國"
    @State static var demoheight = 100.0
    @State static var demoweight = 30
    @State static var demogender = true
    static var previews: some View {
        RoadTestView(Showtest: $demo, name: $demoname, birthday: $demoday, nation: $demonation, height: $demoheight, weight: $demoweight, gender: $demogender)
    }
}
