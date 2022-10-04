using System.Collections.Generic;
using System.Linq;
using TMPro;
using UnityEngine;

namespace _Game.Scripts.Dialog
{
    public class ChoiceBoxInitializer : MonoBehaviour
    {
        private PlayMakerFSM _fsm;
        private DialogManager _dialogManager;

        [SerializeField] private List<GameObject> _choiceObjects;

        public int NumChoices => _choiceObjects.Count;
        
        void Awake()
        {
            _fsm = GetComponent<PlayMakerFSM>();
            _dialogManager = GetComponentInParent<DialogManager>();
        }
        
        public void SetPlaymakerChoices()
        {
            var choices = _dialogManager.CurrentChoices;
            
            for (var i = _choiceObjects.Count - 1; i >= 0; i--)
            {
                var active = i < choices.Count;
                _choiceObjects[i].SetActive(active);

                if (active)
                {
                    var tmp = _choiceObjects[i].GetComponentInChildren<TextMeshProUGUI>();
                    tmp.text = choices[i].text;
                }
            }
        }
    }
}