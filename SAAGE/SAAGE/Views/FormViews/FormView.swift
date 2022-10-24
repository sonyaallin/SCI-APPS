//
//  FormView.swift
//  SAAGE
//
//  Created by X on 2/6/22.
//

import SwiftUI

enum FormViews: CaseIterable {
    //case basicInfo, spinalCordInjury, autonomicDysreflexia, bladder, bowel, skin, transfers, respiration
        case basicInfo, newBowel, newBladder
}

struct RequiredText: View {
    var text: Text
    
    var body: some View {
        HStack(spacing: 2) {
            text
            Text("*").foregroundColor(Color.red)
        }
    }
}

struct MultipleChoiceQuestion: View {
    var text: Text
    var options: [String]
    @Binding var selectedOption: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            text
                .fixedSize(horizontal: false, vertical: true)
            ForEach(options, id: \.self) { option in
                Label(option, systemImage: option == selectedOption ? "circle.inset.filled" : "circle")
                    .onTapGesture {
                        if selectedOption == option {
                            selectedOption = nil
                        } else {
                            selectedOption = option
                        }
                    }
            }
        }
    }
}

struct TextQuestion: View {
    var text: Text
    @Binding var textField: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            text
                .fixedSize(horizontal: false, vertical: true)
            TextField("", text: $textField)
                .padding(5)
                .border(Color.gray)
        }.padding(.top, 5)
    }
}

struct CascadingMultipleChoice: View {
    @Binding var originalOption: String?
    var conditionalAnswer: String
    var CascadingQuestion: MultipleChoiceQuestion
    
    var body: some View {
        if originalOption == conditionalAnswer {
            CascadingQuestion
        }
    }
}

struct CascadingText: View {
    @Binding var originalOption: String?
    var conditionalAnswer: String
    var CascadingQuestion: TextQuestion
    
    var body: some View {
        if originalOption == conditionalAnswer {
            CascadingQuestion
        }
    }
}

struct CheckboxQuestion: View {
    var text: Text
    var options: [String]
    @Binding var selectedOptions: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            text
                .fixedSize(horizontal: false, vertical: true)
            ForEach(options, id: \.self) { option in
                Label(option, systemImage: selectedOptions.contains(option) ? "checkmark.square" : "square")
                    .onTapGesture {
                        if let index = selectedOptions.firstIndex(of: option) {
                            selectedOptions.remove(at: index)
                        } else {
                            selectedOptions.append(option)
                        }
                    }
            }
        }
    }
}

struct FormView: View {
    @Binding var view: CarePlanViews
    @State private var formView: FormViews = .basicInfo
    @State private var currentPageIndex: Int = 0
    var forms: [FormViews] = FormViews.allCases
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text("Spinal Cord Injury:")
                    .font(.title)
                    .foregroundColor(Color("AppColor"))
                
                Text("My Self-Care Information")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AppColor"))
            }
            
            HStack(spacing: 2) {
                Spacer()
                Text("Page:")
                ForEach(forms.indices) { i in
                    Button(action: {
                        print("Clicked page: \(i + 1)")
                        currentPageIndex = i
                        formView = forms[i]
                    }) {
                        i == currentPageIndex ?
                            Text(String(i + 1)).underline()
                        :
                            Text(String(i + 1))
                    }
                    .padding(3)
                    .border(Color.blue)
                    .foregroundColor(i == currentPageIndex ? Color.blue : Color.white)
                    .background(i == currentPageIndex ? Color.white : Color.blue)
                }
            }
            
            containedView()
            
            HStack(spacing: 10) {
                Spacer()
                
                if currentPageIndex != 0 {
                    Button(action: prevPage) {
                        Text("Previous Page")
                            .frame(width: 130)
                            .padding(4)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                    }
                }
                
                if currentPageIndex != forms.count - 1 {
                    Button(action: nextPage) {
                        Text("Next Page")
                            .frame(width: 130)
                            .padding(4)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                    }
                }
                
                Spacer()
            }
        }
    }
    
    func prevPage() {
        print("Clicked previous page")
        currentPageIndex -= 1
        formView = forms[currentPageIndex]
    }
    
    func nextPage() {
        print("Clicked next page")
        currentPageIndex += 1
        formView = forms[currentPageIndex]
    }
}

extension FormView {
    func containedView() -> AnyView {
        switch formView {
        case .basicInfo: return AnyView(BasicInfoFormView())
        case .newBowel: return AnyView(NewBowelFormView())
        case .newBladder: return AnyView(NewBladderFormView())
//            case .basicInfo: return AnyView(BasicInfoFormView())
//            case .spinalCordInjury: return AnyView(SpinalCordInjuryFormView())
//            case .autonomicDysreflexia: return AnyView(AutonomicDysreflexiaFormView())
//            case .bladder: return AnyView(BladderFormView())
//            case .bowel: return AnyView(BowelFormView())
//            case .skin: return AnyView(SkinFormView())
//            case .transfers: return AnyView(TransfersFormView())
//            case .respiration: return AnyView(RespirationFormView())
        }
    }
}

struct FormView_Previews: PreviewProvider {
    @State static var view: CarePlanViews = .enterInfo
    
    static var previews: some View {
        FormView(view: $view)
    }
}
