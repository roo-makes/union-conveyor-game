using System.Linq;
using Sirenix.OdinInspector;
using UnityEngine;

namespace _Framework
{
    [RequireComponent(typeof(PlayMakerFSM))]
    public class GameEventListenerToPM : MonoBehaviour, IGameEventListener
    {
        [Required] public GameEvent Event;

        [ValidateInput("FsmHasEvent", "$FsmHasEventError", InfoMessageType.Warning)] [Required]
        public string EventName;

        [SerializeField] private PlayMakerFSM _fsm;

        void Awake()
        {
            if (_fsm == null) _fsm = GetComponent<PlayMakerFSM>();
        }

        private void OnEnable()
        {
            Event.RegisterListener(this);
        }

        private void OnDisable()
        {
            Event.UnregisterListener(this);
        }

        public void OnEventRaised()
        {
            _fsm.SendEvent(EventName);
        }

#if UNITY_EDITOR
        private bool FsmHasEvent()
        {
            if (EventName == string.Empty) return true;

            var fsm = _fsm ?? GetComponent<PlayMakerFSM>();
            if (fsm == null) return true;

            return fsm.FsmEvents.Any(fsmEvent => fsmEvent.Name == EventName);
        }

        private string FsmHasEventError => $"FSM does not have event \"{EventName}\"";
#endif
    }
}