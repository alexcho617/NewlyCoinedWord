//
//  WordViewController.swift
//  NewlyCoinedWord
//
//  Created by Alex Cho on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {
    var wordDict = [
        "워드랩": "단어와 해답을 결합한 형태로, 문제에 대한 해답을 찾는 과정에서 단어들을 조합하여 새로운 해답을 찾는 것을 의미한다.",
        "꿀잼": "매우 재미있는 것을 뜻하는 용어로, '꿀 같이 재미있음'의 의미를 담고 있다.",
        "이따금": "가끔, 가끔씩의 뜻으로 사용되는 신조어이다.",
        "품절남": "특정 상품이나 아이템이 품절이 되어 구하기 어려운 남성을 일컫는다.",
        "먹통": "인터넷이나 통신 등에서 연결이 끊어져 동작하지 않는 상태를 의미한다.",
        "와이퍼": "와이프를 지칭하는 말로, 애정어로 사용되기도 한다.",
        "버카충": "버스, 카드, 충전을 합성한 용어.",
        "페북통": "페이스북에 시간을 많이 쏟아붓는 사람을 비하하는 단어이다.",
        "이거닷컴": "무슨 일인지, 상황 등을 이해하지 못할 때 사용되는 표현이다.",
        "인싸": "인사이더의 줄임말로, 소속감이 강하고 사람들과 잘 어울리는 사람을 지칭한다."
    ]


    
    //oulets
    @IBOutlet var wordTextField: UITextField!
    
    @IBOutlet var suggestionButtonViewCollection: [UIButton]!
    
    @IBOutlet var resultLabel: UILabel!
    
    //vdl
    override func viewDidLoad() {
        super.viewDidLoad()
        setResultLabel()
        setTextField()
        setSuggestionButtons()
        textFieldEnter(wordTextField)
        
    }
    
    //actions
    @IBAction func textFieldEnter(_ sender: UITextField) {
        guard let key = wordTextField.text else{
            return
        }
        if  !key.isValidated{
            //alert
            let alert = UIAlertController(title: nil, message: "올바르지 않은 입력입니다", preferredStyle: .alert)
            let cancelButton = UIAlertAction(title: "뒤로", style: .cancel)
            alert.addAction(cancelButton)
            present(alert, animated: true)
            
            resultLabel.text = ""
            wordTextField.text = nil
        }
        else if wordDict.keys.contains(key) {
            resultLabel.text = wordDict[key]
        }else{
            resultLabel.text = "결과가 없습니다🥲"
        }
    }
    
    
    @IBAction func suggestionButtonClicked(_ sender: UIButton) {
        wordTextField.text = sender.currentTitle
        textFieldEnter(wordTextField)
    }
    
    //functions
    func setResultLabel(){
        resultLabel.textAlignment = .center
    }
    
    func setTextField(){
        wordTextField.placeholder = "신조어를 입력하세요"
        wordTextField.layer.borderWidth = 1
        wordTextField.layer.borderColor = UIColor.black.cgColor
        wordTextField.text = getRandomWord()
    }
    
    func setSuggestionButtons(){
        //change appearance
        for button in suggestionButtonViewCollection{
            button.tintColor = .black
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }
        //random draw
        let numberOfRandomItems = suggestionButtonViewCollection.count
        let keys = Array(wordDict.keys)
        var randomIndices = Set<Int>()
        var randomKeys: [String] = []
        
        //draw random numbers and put into set -> 딕셔너리 셔플을 피하려고 한건데 이렇게 인덱스로 할거였으면 그냥 random element로 뽑아서 셋에다 넣는거랑 별 차이가 없었다. 숫자를 뽑는거나 단어를 뽑는거나 둘 다 비슷하기 때문.
        while randomIndices.count < numberOfRandomItems{
            let numberDrawn = Int.random(in: 0..<numberOfRandomItems)
            randomIndices.insert(numberDrawn)
        }
        
        //put each random key into array
        for randomIndex in randomIndices {
            randomKeys.append(keys[randomIndex])
        }
        
        //set as labels
        for i in 0..<suggestionButtonViewCollection.count{
            suggestionButtonViewCollection[i].setTitle(randomKeys[i], for: .normal)
        }
    }
    
    @discardableResult
    func getRandomWord() -> String{
        return wordDict.randomElement()!.key
    }
}

extension String {
    var isValidated: Bool {
        return !isEmpty && range(of: "^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z]$", options: .regularExpression) == nil && count > 1
    }
}
