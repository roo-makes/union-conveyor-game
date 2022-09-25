using System.Collections.Generic;
using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class ConveyorStateData : MonoBehaviour
    {
        public float SpawnRate = 0;
        public float SpawnRateVariance = 0;
        
        private List<GameObject> _widgetsOnConveyor = new List<GameObject>();

        public List<GameObject> Widgets => _widgetsOnConveyor;
        public bool IsConveyorEmpty => _widgetsOnConveyor.Count == 0;
        
        
        
        public void AddWidget(GameObject otherGameObject)
        {
            _widgetsOnConveyor.Add(otherGameObject);
        }
        
        public void RemoveWidget(GameObject otherGameObject)
        {
            _widgetsOnConveyor.Remove(otherGameObject);
        }

        public bool ContainsWidget(GameObject widget)
        {
            return _widgetsOnConveyor.Contains(widget);
        }
    }
}