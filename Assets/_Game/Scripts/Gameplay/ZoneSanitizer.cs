using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class ZoneSanitizer : MonoBehaviour
    {
        private ZoneStateData _zoneState;

        void Awake()
        {
            _zoneState = GetComponentInChildren<ZoneStateData>();
        }

        public void SanitizeAllWidgets()
        {
            foreach (var zoneStateWidget in _zoneState.Widgets)
            {
                var widgetState = zoneStateWidget.GetComponent<WidgetStateData>();
                widgetState.Sanitize();
            }
        }
    }
}