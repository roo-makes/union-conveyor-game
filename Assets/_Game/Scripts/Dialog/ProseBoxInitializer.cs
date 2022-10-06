using TMPro;
using UnityEngine;

namespace _Game.Scripts.Dialog
{
    public class ProseBoxInitializer : MonoBehaviour
    {
        private PlayMakerFSM _fsm;

        void Awake()
        {
            _fsm = GetComponent<PlayMakerFSM>();
        }
        
        void Start()
        {
        }

        public void SetDialogText(string dialogText, CharacterSO character)
        {
            var characterName = character.Name;
            var characterSprite = character.CharacterPortrait;
            var characterVoice = character.CharacterVoice;
            
            _fsm.FsmVariables.GetFsmString("dialogText").Value = dialogText;
            _fsm.FsmVariables.GetFsmObject("characterObj").Value = character;
            _fsm.FsmVariables.GetFsmString("characterName").Value = characterName;
            _fsm.FsmVariables.GetFsmObject("characterSprite").Value = characterSprite;
            _fsm.FsmVariables.GetFsmObject("characterVoice").Value = characterVoice;
            _fsm.SendEvent("onReady");
        }
    }
}