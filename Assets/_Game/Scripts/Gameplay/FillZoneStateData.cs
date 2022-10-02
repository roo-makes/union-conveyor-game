using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class FillZoneStateData : MonoBehaviour
    {
        protected ZoneStateData _zoneStateData;

        void Awake()
        {
            _zoneStateData = GetComponentInChildren<ZoneStateData>();
        }

        public virtual GameObject GetNextUnfilledWidget()
        {
            if (_zoneStateData.IsZoneEmpty) return null;
            return _zoneStateData.Widgets.Find(widget => !widget.GetComponent<WidgetStateData>().IsFilled);
        }
    }
}