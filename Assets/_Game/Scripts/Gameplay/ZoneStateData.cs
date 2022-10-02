using System;
using System.Collections.Generic;
using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class ZoneStateData : MonoBehaviour
    {
        private List<GameObject> _widgetsInZone = new List<GameObject>();

        public List<GameObject> Widgets => _widgetsInZone;
        public bool IsZoneEmpty => _widgetsInZone.Count == 0;

        public void AddWidget(GameObject otherGameObject)
        {
            _widgetsInZone.Add(otherGameObject);
        }
        
        public void RemoveWidget(GameObject otherGameObject)
        {
            _widgetsInZone.Remove(otherGameObject);
        }

        public bool ContainsWidget(GameObject widget)
        {
            return _widgetsInZone.Contains(widget);
        }
        
        public GameObject GetNextWidgetForPredicate(Predicate<GameObject> findFunc)
        {
            if (IsZoneEmpty) return null;
            return Widgets.Find(findFunc);
        }
    }
}