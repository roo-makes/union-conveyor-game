using System.Collections.Generic;
using Ink.Runtime;
using TMPro;
using UnityEngine;

namespace _Game.Scripts.Dialog
{
    public class DialogManager : MonoBehaviour
    {
        [SerializeField] private TextAsset _inkAsset;
        [SerializeField] private TextMeshProUGUI _textBox;
        private Story _inkStory;

        public enum DialogType
        {
            Standard,
            StageDirection,
            Choices
        }

        public bool CanContinue => _inkStory.canContinue;
        public bool IsChoice => !CanContinue && _inkStory.currentChoices.Count > 0;
        public string DialogText => _inkStory.currentText.Trim();
        public List<Choice> CurrentChoices => IsChoice ? _inkStory.currentChoices : new List<Choice>();
        public DialogType CurrentDialogType => IsChoice ? DialogType.Choices : DialogType.Standard;

        void Awake()
        {
            _inkStory = new Story(_inkAsset.text);
        }

        public void Advance()
        {
            if (CanContinue) _inkStory.Continue();
            if(DialogText.StartsWith("COMMENT:")) Advance();
        }
    
        public string GetCurrentDialogText()
        {
            return DialogText;
        }

        public void ChooseChoiceIndex(int index)
        {
            _inkStory.ChooseChoiceIndex(index);
        }

        // Update is called once per frame
        void Update()
        {
        
        }
    }
}
