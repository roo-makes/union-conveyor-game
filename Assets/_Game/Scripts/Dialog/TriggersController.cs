using System;
using HutongGames.PlayMaker;
using UnityEngine;
using UnityEngine.Events;

namespace _Game.Scripts.Dialog
{
    public class TriggersController : MonoBehaviour
    {
        // [SerializeField] private UnityEvent _onTriggerComplete;
        // public static event Action OnTriggerComplete;

        private PlayMakerFSM _fsm;

        void Awake()
        {
            _fsm = GetComponent<PlayMakerFSM>();
        }
        
        public void ExecuteTrigger(string triggerName)
        {
            ExecuteTriggerAsync(triggerName);
        }

        public void ExecuteTriggerAsync(string triggerName)
        {
            Debug.Log($"Executing trigger {triggerName}");
            
            var eventData = new FsmEventData
            {
                StringData = triggerName
            };
            Fsm.EventData = eventData;
            
            _fsm.SendEvent("gl-onTrigger");
        }
    }
}