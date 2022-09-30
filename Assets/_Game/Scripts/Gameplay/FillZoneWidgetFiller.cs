using _Framework;
using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class FillZoneWidgetFiller : MonoBehaviour
    {
        [SerializeField] private FloatVariable _fillTime;

        public void FillWidgetFrame(WidgetStateData widgetState)
        {
            var fillAmount = Time.deltaTime / _fillTime.Value;
            
            Debug.Log($"Fill {fillAmount}");
            widgetState.AddFill(Time.deltaTime / _fillTime.Value);
            Debug.Log($"Filled {widgetState.FillPercent}");
        }
    }
}