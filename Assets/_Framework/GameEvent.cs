using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

namespace _Framework
{
    [CreateAssetMenu(fileName = "GameEvent", menuName = "Framework/GameEvent", order = 0)]
    public class GameEvent : ScriptableObject
    {
        private List<IGameEventListener> listeners = new List<IGameEventListener>();

        [Button("Fire Event")]
        public void Raise()
        {
            Debug.Log($"Raising Event {this.name}");
            
            for (int i = listeners.Count - 1; i >= 0; i--)
            {
                listeners[i].OnEventRaised();
            }
        }

        public void RegisterListener(IGameEventListener listener)
        {
            listeners.Add(listener);
        }

        public void UnregisterListener(IGameEventListener listener)
        {
            listeners.Remove(listener);
        }
    }
}