//
//  FormView.swift
//  SAAGE
//
//  Created by X on 2/6/22.
//

import SwiftUI

enum FormViews: CaseIterable {
    //case basicInfo, spinalCordInjury, autonomicDysreflexia, bladder, bowel, skin, transfers, respiration
        case basicInfo, emergencyContact, sciInfo, autonomicDysreflexia, mobility, respiration, newBowel, newBladder
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

//struct MultipleChoiceQuestion: View {
//    var text: Text
//    var options: [String]
//    @Binding var selectedOption: String?
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            text
//                .fixedSize(horizontal: false, vertical: true)
//            ForEach(options, id: \.self) { option in
//                Label(option, systemImage: option == selectedOption ? "circle.inset.filled" : "circle")
//                    .onTapGesture {
//                        if selectedOption == option {
//                            selectedOption = nil
//                        } else {
//                            selectedOption = option
//                        }
//                    }
//            }
//        }
//    }
//}

struct TextQuestion: View {
    var text: Text
    @Binding var textField: String
    var height: CGFloat = 50
    
    var body: some View {
        if height == 50 {
            VStack(alignment: .leading, spacing: 5) {
                text
                    .fixedSize(horizontal: false, vertical: true)
                TextField("", text: $textField)
                    .padding(5)
                    .border(Color.gray)
            }.padding(.top, 5)
        }
        else {
            VStack(alignment: .leading, spacing: 5) {
                text
                    .fixedSize(horizontal: false, vertical: true)
                TextEditor(text: $textField)
                    .padding(5)
                    .border(Color.gray)
                    .frame(minHeight: height, maxHeight: height)
            }.padding(.top, 5)
        }
    }
}

struct LongTextQuestion: View {
    var text: Text
    @Binding var textField: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            text
                .fixedSize(horizontal: false, vertical: true)
            TextEditor(text: $textField)
                .padding(5)
                .border(Color.gray)
                .frame(maxHeight: 150)
                .frame(minHeight: 150)
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

struct CascadingText1: View {
    @Binding var originalOption: String
    var conditionalAnswer: String
    var CascadingQuestion: TextQuestion
    
    var body: some View {
        if originalOption == conditionalAnswer {
            CascadingQuestion
        }
    }
}

struct CascadingMultipleChoice1: View {
    @Binding var originalOption: String
    var conditionalAnswer: String
    var CascadingQuestion: ToggleQuestionProposal1
    
    var body: some View {
        if originalOption == conditionalAnswer {
            CascadingQuestion
        }
    }
}

struct CascadingMultipleChoice2: View {
    @Binding var originalOption: String
    var conditionalAnswer: String
    var CascadingQuestion: ToggleQuestionProposal2
    
    var body: some View {
        if originalOption == conditionalAnswer {
            CascadingQuestion
        }
    }
}

struct CascadingText2: View {
    @Binding var originalOption: String
    var conditionalAnswer: String
    var CascadingQuestion: TextQuestion
    
    var body: some View {
        if originalOption == conditionalAnswer {
            CascadingQuestion
        }
    }
}

struct CascadingTextToCheckbox: View {
    @Binding var originalOption: [String]
    var conditionalAnswer: String
    var CascadingQuestion: TextQuestion
    
    var body: some View {
        if originalOption.contains(conditionalAnswer) {
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

// Enable scaling up a toggle's height
extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}

struct MultipleChoiceQuestion: View {
    var text: Text
    var options: [String]
    @Binding var selectedOption: String?
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            text
                .fixedSize(horizontal: false, vertical: true)
                .padding(10)
            Picker(selection: $selectedIndex, label: Text(""), content: {
                ForEach(0..<options.count, content: { index in
                    Text(options[index]).tag(index).onTapGesture {
                        if selectedOption == options[index] {
                            selectedOption = nil
                        } else {
                            selectedOption = options[index]
                        }
                    }
                })
            })
            .pickerStyle(SegmentedPickerStyle())
            .clipped()
            .frame(height:50)
            .labelsHidden()
        }
    }
}


struct CheckboxStyle: ToggleStyle {
    var trueOption: String
    var falseOption: String
    @Binding var selectedOption: String
    @State private var selection = false
    
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundColor(configuration.isOn ? .green : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    selection = !selection
                    configuration.isOn.toggle()
                    selectedOption = selection ? trueOption : falseOption
                }
        }
    }
}

struct ToggleQuestionProposal1: View {
    var text: Text
    var trueOption: String = "Yes"
    var falseOption: String = "No"
    @Binding var selectedOption: String
    @State private var selection = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            text
            Toggle(isOn: $selection) {
                Text(selection ? trueOption : falseOption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .toggleStyle(CheckboxStyle(trueOption: trueOption, falseOption: falseOption, selectedOption: $selectedOption))
        }
    }
}

struct ToggleQuestionProposal2: View {
    var text: Text
    var trueOption: String = "Yes"
    var falseOption: String = "No"
    @Binding var selectedOption: String
    @State private var selection = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            text
            Toggle(isOn: $selection) {
                Text(selection ? trueOption : falseOption)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .onTapGesture {
                print("tapped")
                selectedOption = selection ? falseOption : trueOption
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
        case .basicInfo: return AnyView(NewBasicInfoFormView())
        case .newBowel: return AnyView(NewBowelFormView())
        case .newBladder: return AnyView(NewBladderFormView())
        case .emergencyContact: return AnyView(NewEmergencyInfoFormView())
        case .sciInfo: return AnyView(NewSCIInfoFormView())
        case .autonomicDysreflexia: return AnyView(AutonomicDysreflexiaFormView())
        case .mobility: return AnyView(MobilityFormView())
        case .respiration: return AnyView(RespirationFormView())
//            case .basicInfo: return AnyView(BasicInfoFormView())
//            case .spinalCordInjury: return AnyView(SpinalCordInjuryFormView())
           
//            case .bladder: return AnyView(BladderFormView())
//            case .bowel: return AnyView(BowelFormView())
//            case .skin: return AnyView(SkinFormView())
//            case .transfers: return AnyView(TransfersFormView())
        }
    }
}

struct FormView_Previews: PreviewProvider {
    @State static var view: CarePlanViews = .enterInfo
    
    static var previews: some View {
        FormView(view: $view)
    }
}
