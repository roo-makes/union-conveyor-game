using UnityEngine;
using UnityEngine.Events;

namespace _Game.Scripts.Gameplay
{
    public class WidgetStateData : MonoBehaviour
    {
        private bool _isFilled = false;
        private bool _isDosed = false;
        private bool _isSanitized = false;

        [SerializeField] private UnityEvent WidgetSanitized;
        
        
        public bool IsFilled => FillPercent >= 1;
        public bool IsDosed => _isDosed;
        public bool IsSanitized => _isSanitized;
        public float FillPercent { get; set; }

        public void Sanitize()
        {
            _isSanitized = true;
            WidgetSanitized.Invoke();
        }
    }
}