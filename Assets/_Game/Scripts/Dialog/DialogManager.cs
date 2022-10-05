using System.Collections;
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
        [SerializeField] private List<CharacterSO> _characters;

        private Story _inkStory;
        private Dictionary<string, CharacterSO> _charactersDict;
        private CharacterSO _playerCharacter;
        private PlayMakerFSM _fsm;

        public enum DialogType
        {
            Standard,
            StageDirection,
            Choices
        }

        public bool CanContinue => _inkStory.canContinue;
        public bool IsChoice => !CanContinue && _inkStory.currentChoices.Count > 0;


        public string DialogCharacterName
        {
            get
            {
                var curLine = _inkStory.currentText.Trim();
                var colonIdx = curLine.IndexOf(":");
                return curLine.Substring(0, colonIdx).Trim();
            }
        }

        public CharacterSO DialogCharacter
        {
            get
            {
                CharacterSO outCharacter;
                if (DialogCharacterName == "YOU")
                {
                    return _playerCharacter;
                }
                
                _charactersDict.TryGetValue(DialogCharacterName, out outCharacter);
                if (outCharacter == null) outCharacter = _charactersDict["DEFAULT"];
                return outCharacter != null ? outCharacter : null;
            }
        }   

        public string DialogText
        {
            get
            {
                var curLine = _inkStory.currentText.Trim();
                var colonIdx = curLine.IndexOf(":");
                return curLine.Substring(colonIdx + 1).Trim();
            }
        }

        public List<Choice> CurrentChoices => IsChoice ? _inkStory.currentChoices : new List<Choice>();
        public DialogType CurrentDialogType => IsChoice ? DialogType.Choices : DialogType.Standard;

        void Awake()
        {
            _fsm = GetComponent<PlayMakerFSM>();
            _inkStory = new Story(_inkAsset.text);
            _charactersDict = new Dictionary<string, CharacterSO>();
            foreach (var characterSO in _characters)
            {
                _charactersDict.Add(characterSO.Name, characterSO);
            }

            _playerCharacter = _characters.Find(character => character.IsPlayer);
        }

        public void Advance()
        {
            if (CanContinue) _inkStory.Continue();
            if (DialogCharacter == _charactersDict["DEFAULT"]) Advance();
            _fsm.FsmVariables.GetFsmObject("character").Value = DialogCharacter;
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