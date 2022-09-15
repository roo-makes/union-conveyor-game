using System;
using Sirenix.OdinInspector;
using UnityEngine;
using UnityEngine.Events;

namespace _Framework
{
    public class GameEventListener : MonoBehaviour, IGameEventListener
    {
        [Required]
        public GameEvent Event;
        public UnityEvent Response;

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
            Response.Invoke();
        }
    }
}