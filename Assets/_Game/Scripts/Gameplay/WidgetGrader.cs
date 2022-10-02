using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class WidgetGrader : MonoBehaviour
    {
        public bool GradeWidget(GameObject widget)
        {
            var widgetState = widget.GetComponent<WidgetStateData>();
            if (!widgetState.IsSanitized) return false;
            if (!widgetState.IsFilled) return false;
            if (!widgetState.IsDroppered) return false;
            return true;
        }
    }
}