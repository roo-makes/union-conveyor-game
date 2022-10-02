using UnityEngine;

namespace _Game.Scripts.Gameplay.Playmaker
{
    public class DropperZoneStateData : FillZoneStateData
    {
        public override GameObject GetNextUnfilledWidget()
        {
            if (_zoneStateData.IsZoneEmpty) return null;
            return _zoneStateData.Widgets.Find(widget => !widget.GetComponent<WidgetStateData>().IsDroppered);
        }
    }
}