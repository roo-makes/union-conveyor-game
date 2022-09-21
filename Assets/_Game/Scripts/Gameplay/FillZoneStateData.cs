using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class FillZoneStateData : MonoBehaviour
    {
        private ZoneStateData _zoneStateData;

        void Awake()
        {
            _zoneStateData = GetComponentInChildren<ZoneStateData>();
        }

        public GameObject GetNextUnfilledWidget()
        {
            if (_zoneStateData.IsZoneEmpty) return null;
            return _zoneStateData.Widgets.Find(widget => !widget.GetComponent<WidgetStateData>().IsFilled);
        }
    }
}